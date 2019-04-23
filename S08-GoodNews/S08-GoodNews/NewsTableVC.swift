//
//  NewsTableVC.swift
//  S08-GoodNews
//
//  Created by Humberto Vieira on 23/04/19.
//  Copyright © 2019 Humberto Vieira. All rights reserved.
//

import Foundation
import UIKit
import RxCocoa
import RxSwift

class NewsTableVC: UITableViewController {
    
    private let diposeBag = DisposeBag()
    private var articles = [Article]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.navigationController?.navigationBar.prefersLargeTitles = true
        populateNews()
    }
    
    
    private func populateNews() {
        let strURL = "https://newsapi.org/v2/top-headlines?country=us&apiKey=bcd280fe0c904e2494ba8effc96f6f80"
        guard let url = URL(string: strURL) else { return }
        
        Observable.just(url)
            .flatMap { (url) -> Observable<Data> in
                
                let request = URLRequest(url: url)
                return URLSession.shared.rx.data(request: request)
            }.map { (data) -> [Article]? in
                return try? JSONDecoder().decode(ArticleList.self, from: data).articles
            }.subscribe(onNext: { [weak self] articles in
                if let articles = articles {
                    DispatchQueue.main.async {
                        self?.tableView.reloadData()
                    }
                }
                
               
            })
    }
    
}

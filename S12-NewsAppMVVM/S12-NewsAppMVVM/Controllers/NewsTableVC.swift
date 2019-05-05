//
//  NewsTableVC.swift
//  S12-NewsAppMVVM
//
//  Created by Humberto Vieira on 04/05/19.
//  Copyright © 2019 Humberto Vieira. All rights reserved.
//

import Foundation
import UIKit
import RxSwift

class NewsTableVC: UITableViewController {
    private let disposeBag = DisposeBag()
    private var articleListVM: ArticleListViewModel!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.navigationController?.navigationBar.prefersLargeTitles = true
        
        populateNews()
    }
    
    
    private func populateNews() {
        let resource = Resource<ArticleResponse>(url: URL(string: "https://newsapi.org/v2/top-headlines?" +
            "sources=bbc-news&" +
            "apiKey=bcd280fe0c904e2494ba8effc96f6f80")!)
        
        URLRequest.load(resource: resource)
            .subscribe(onNext: { articlesResponse in
                let articles = articlesResponse.articles
                self.articleListVM = ArticleListViewModel(articles)
                
                DispatchQueue.main.async {
                    self.tableView.reloadData()
                }

            }).disposed(by: disposeBag)
        
    }
}


extension NewsTableVC {
    override func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.articleListVM == nil ? 0 : self.articleListVM.articleVM.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "ArticleTableViewCell", for: indexPath) as? ArticleTableViewCell else {
            return UITableViewCell()
        }
        
        let articleVM = self.articleListVM.articleAt(indexPath.row)
        
        articleVM.title
            .asDriver(onErrorJustReturn: "")
            .drive(cell.titleLabel.rx.text)
            .disposed(by: disposeBag)
        
        articleVM.description
            .asDriver(onErrorJustReturn: "")
            .drive(cell.descriptionLabel.rx.text)
            .disposed(by: disposeBag)
        
        
        return cell
    }
    
}

//
//  NewsViewModel.swift
//  S12-NewsAppMVVM
//
//  Created by Humberto Vieira on 04/05/19.
//  Copyright © 2019 Humberto Vieira. All rights reserved.
//

import Foundation
import RxSwift
import RxCocoa


struct ArticleListViewModel {
    let articleVM: [ArticleViewModel]
}

extension ArticleListViewModel {
    init(_ articles: [Article]) {
        self.articleVM = articles.compactMap(ArticleViewModel.init)
    }
}

extension ArticleListViewModel {
    func articleAt(_ index: Int) -> ArticleViewModel {
        return self.articleVM[index]
    }
}


struct ArticleViewModel {
    let article: Article
    
    init(_ article: Article) {
        self.article = article
    }
}


extension ArticleViewModel {
    var title: Observable<String> {
        return Observable<String>.just(article.title)
    }
    
    var description: Observable<String> {
        return Observable<String>.just(article.description ?? "")
    }
}

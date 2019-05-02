//
//  Article.swift
//  S08-GoodNews
//
//  Created by Humberto Vieira on 23/04/19.
//  Copyright © 2019 Humberto Vieira. All rights reserved.
//

import Foundation

struct ArticleList: Decodable {
    let articles: [Article]
}

extension ArticleList {
    static var all: Resource<ArticleList> = {
        let strURL = "https://newsapi.org/v2/top-headlines?country=us&apiKey=bcd280fe0c904e2494ba8effc96f6f80"
        let url = URL(string: strURL)!
        return Resource(url: url)
    }()
}

struct Article: Decodable {
    let title: String
    let description: String?
}

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

struct Article: Decodable {
    let title: String
    let description: String
}

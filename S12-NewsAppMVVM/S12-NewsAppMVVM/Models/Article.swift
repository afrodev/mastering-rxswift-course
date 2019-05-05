//
//  Article.swift
//  S12-NewsAppMVVM
//
//  Created by Humberto Vieira on 04/05/19.
//  Copyright © 2019 Humberto Vieira. All rights reserved.
//

import Foundation

struct ArticleResponse: Decodable {
    let articles: [Article]
}

struct Article: Decodable {
    let title: String
    let description: String?
}

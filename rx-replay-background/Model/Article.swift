//
//  Article.swift
//  rx-replay-background
//
//  Created by Mavin on 1/19/21.
//

import Foundation


struct ArticlesList: Decodable {
    let articles: [Article]
}

extension ArticlesList {
    
    static var all: Resource<ArticlesList> {
        let url = URL(string: "http://newsapi.org/v2/top-headlines?country=us&apiKey=2ddf96179f754f79a560b207d6f8bc1c")!
        return Resource(url: url)
    }
    
}

struct Article: Decodable {
    let title: String
    let description: String
}

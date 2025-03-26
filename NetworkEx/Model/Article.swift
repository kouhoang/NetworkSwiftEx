//
//  Article.swift
//  NetworkEx
//
//  Created by admin on 25/02/25.
//


import Foundation
import SwiftyJSON

struct Article: Identifiable {
    let id = UUID()
    let title: String
    let description: String?
    let url: String
    let urlToImage: String?
    let publishedAt: Date
    let author: String?
    
    init(json: JSON) {
        self.title = json["title"].stringValue
        self.description = json["description"].string
        self.url = json["url"].stringValue
        self.urlToImage = json["urlToImage"].string
        self.author = json["author"].string
        
        let dateFormatter = ISO8601DateFormatter()
        self.publishedAt = dateFormatter.date(from: json["publishedAt"].stringValue) ?? Date()
    }
}

//
//  NewsService.swift
//  NetworkEx
//
//  Created by admin on 25/02/25.
//


import Foundation
import SwiftyJSON
import Alamofire

class NewsService {
    static let shared = NewsService()
    
    func fetchNews(category: String = "technology", completion: @escaping ([Article]?, Error?) -> Void) {
        let urlString = "\(Constants.baseURL)/top-headlines?country=us&category=\(category)&apiKey=\(Constants.newsAPIKey)"
        
        AF.request(urlString).responseJSON { response in
            switch response.result {
            case .success(let value):
                let json = JSON(value)
                let articles = json["articles"].arrayValue.map { Article(json: $0) }
                completion(articles, nil)
            case .failure(let error):
                completion(nil, error)
            }
        }
    }
}

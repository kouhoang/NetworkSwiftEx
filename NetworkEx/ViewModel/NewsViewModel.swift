//
//  NewsViewModel.swift
//  NetworkEx
//
//  Created by admin on 25/3/25.
//


import Foundation
import Combine

class NewsViewModel: ObservableObject {
    @Published var articles: [Article] = []
    @Published var isLoading = false
    @Published var error: Error?
    
    private var cancellables = Set<AnyCancellable>()
    
    init() {
        fetchNews()
    }
    
    func fetchNews(category: String = "technology") {
        isLoading = true
        
        NewsService.shared.fetchNews(category: category) { [weak self] articles, error in
            DispatchQueue.main.async {
                self?.isLoading = false
                
                if let articles = articles {
                    self?.articles = articles
                }
                
                if let error = error {
                    self?.error = error
                }
            }
        }
    }
}
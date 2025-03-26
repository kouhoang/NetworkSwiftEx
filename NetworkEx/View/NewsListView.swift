//
//  NewsListView.swift
//  NetworkEx
//
//  Created by admin on 25/02/25.
//


import SwiftUI
import Kingfisher

struct NewsListView: View {
    @StateObject private var viewModel = NewsViewModel()
    
    var body: some View {
        NavigationView {
            List(viewModel.articles) { article in
                NavigationLink(destination: NewsDetailView(article: article)) {
                    HStack {
                        if let imageUrl = article.urlToImage {
                            KFImage(URL(string: imageUrl))
                                .resizable()
                                .aspectRatio(contentMode: .fill)
                                .frame(width: 100, height: 100)
                                .cornerRadius(10)
                        }
                        
                        VStack(alignment: .leading) {
                            Text(article.title)
                                .font(.headline)
                            Text(article.description ?? "")
                                .font(.subheadline)
                                .lineLimit(2)
                        }
                    }
                }
            }
            .navigationTitle("News")
            .refreshable {
                viewModel.fetchNews()
            }
        }
    }
}

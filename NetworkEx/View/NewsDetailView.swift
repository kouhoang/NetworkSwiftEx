//
//  NewsDetailView.swift
//  NetworkEx
//
//  Created by admin on 25/02/25.
//


import SwiftUI
import Kingfisher

struct NewsDetailView: View {
    let article: Article
    
    var body: some View {
        ScrollView {
            VStack(alignment: .leading) {
                if let imageUrl = article.urlToImage {
                    KFImage(URL(string: imageUrl))
                        .resizable()
                        .aspectRatio(contentMode: .fill)
                        .cornerRadius(10)
                }
                
                Text(article.title)
                    .font(.title)
                    .fontWeight(.bold)
                
                if let author = article.author {
                    Text("By \(author)")
                        .font(.subheadline)
                        .foregroundColor(.secondary)
                }
                
                Text(article.publishedAt, style: .date)
                    .font(.subheadline)
                    .foregroundColor(.secondary)
                
                Text(article.description ?? "")
                    .font(.body)
                    .padding(.vertical)
                
                Link("Read Full Article", destination: URL(string: article.url)!)
                    .foregroundColor(.blue)
            }
            .padding()
        }
        .navigationTitle("Article Details")
    }
}

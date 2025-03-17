//
//  NewsDetailsView.swift
//  Newsly
//
//  Created by Hewad Mubariz on 18.03.25.
//

import SwiftUI

struct NewsDetailView: View {
    let article: NewsArticle
    
    var body: some View {
        ScrollView {
            VStack(alignment: .leading, spacing: 10) {
                if let imageUrl = article.urlToImage, let url = URL(string: imageUrl) {
                    AsyncImage(url: url) { image in
                        image.resizable()
                            .aspectRatio(contentMode: .fill)
                    } placeholder: {
                        Color.gray
                    }
                    .frame(height: 200)
                    .cornerRadius(12)
                }
                
                Text(article.title)
                    .font(.title)
                    .fontWeight(.bold)
                
                Text(article.description ?? "No description available")
                    .font(.body)
                    .foregroundColor(.gray)
                
                Link("Read Full Article", destination: URL(string: article.url)!)
                    .padding()
                    .background(Color.blue)
                    .foregroundColor(.white)
                    .cornerRadius(10)
            }
            .padding()
        }
        .navigationTitle("Article")
        .navigationBarTitleDisplayMode(.inline)
    }
}

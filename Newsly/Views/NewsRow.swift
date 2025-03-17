//
//  NewsRow.swift
//  Newsly
//
//  Created by Hewad Mubariz on 18.03.25.
//

import SwiftUI

struct NewsRow: View {
    let article: NewsArticle
    
    var body: some View {
        HStack {
            if let imageUrl = article.urlToImage, let url = URL(string: imageUrl) {
                AsyncImage(url: url) { image in
                    image.resizable()
                } placeholder: {
                    Color.gray
                }
                .frame(width: 100, height: 60)
                .cornerRadius(8)
            }
            
            VStack(alignment: .leading) {
                Text(article.title)
                    .font(.headline)
                    .lineLimit(2)
                
                Text(article.publishedAt)
                    .font(.subheadline)
                    .foregroundColor(.gray)
            }
        }
    }
}

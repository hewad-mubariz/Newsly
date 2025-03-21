//
//  NewsRow.swift
//  Newsly
//
//  Created by Hewad Mubariz on 18.03.25.
//

// NewsRow.swift

// NewsRow.swift

import SwiftUI

struct NewsRow: View {
    let article: NewsArticle
    @State private var uiImage: UIImage? = nil

    var body: some View {
        HStack(alignment: .top, spacing: 12) {
            if let imageUrl = article.bestImageUrl, let url = URL(string: imageUrl) {
                if let cachedImage = ImageCacheManager.shared.getImage(forKey: imageUrl) {
                    Image(uiImage: cachedImage)
                        .resizable()
                        .aspectRatio(contentMode: .fill)
                        .frame(width: 100, height: 80)
                        .cornerRadius(8)
                } else {
                    AsyncImage(url: url) { image in
                        image.resizable()
                            .aspectRatio(contentMode: .fill)
                            .onAppear {
                                if let uiImage = image.asUIImage() {
                                    ImageCacheManager.shared.saveImage(uiImage, forKey: imageUrl)
                                }
                            }
                    } placeholder: {
                        Color.gray.opacity(0.3)
                            .overlay(
                                Image(systemName: "photo")
                                    .font(.largeTitle)
                                    .foregroundColor(.gray)
                            )
                    }
                    .frame(width: 100, height: 80)
                    .cornerRadius(8)
                }
            }
            
            VStack(alignment: .leading, spacing: 6) {
                Text(article.title)
                    .font(.headline)
                    .lineLimit(2)
                
                if let byline = article.byline {
                    Text(byline)
                        .font(.subheadline)
                        .foregroundColor(.gray)
                }
                
                Text(article.displayedDate)
                    .font(.caption)
                    .foregroundColor(.gray)
            }
        }
        .padding(.vertical, 6)
    }
}

extension Image {
    func asUIImage() -> UIImage? {
        let controller = UIHostingController(rootView: self)
        controller.view.bounds = CGRect(x: 0, y: 0, width: 100, height: 80)
        
        let renderer = UIGraphicsImageRenderer(size: controller.view.bounds.size)
        return renderer.image { _ in
            controller.view.drawHierarchy(in: controller.view.bounds, afterScreenUpdates: true)
        }
    }
}

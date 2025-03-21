//
//  NewsViewModel.swift
//  Newsly
//
//  Created by Hewad Mubariz on 18.03.25.
//

import SwiftUI

@MainActor
class NewsViewModel: ObservableObject {
    @Published var articles: [NewsArticle] = []
    @Published var isLoading = false
    
    private let newsService = NewsService()

     func loadNews(for section: NewsSection) async {
           isLoading = true
           do {
               let service = NewsService()
               articles = try await service.fetchNews(for: section)
               isLoading = false
           } catch {
               print("❌ Error loading news: \(error)")
               isLoading = false
           }
       }
}

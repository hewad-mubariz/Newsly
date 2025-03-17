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
    
    func loadNews() async {
        isLoading = true
        do {
            articles = try await newsService.fetchNews()
        } catch {
            print("Error fetching news:", error)
        }
        isLoading = false
    }
}

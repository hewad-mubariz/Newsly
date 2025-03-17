//
//  HomeView.swift
//  Newsly
//
//  Created by Hewad Mubariz on 18.03.25.
//

import SwiftUI

struct HomeView: View {
    @StateObject var viewModel = NewsViewModel()
    
    var body: some View {
        NavigationStack {
            List(viewModel.articles) { article in
                NavigationLink(destination: NewsDetailView(article: article)) {
                    NewsRow(article: article)
                }
            }
            .overlay(
                viewModel.articles.isEmpty ?
                ProgressView("Loading news...").padding() : nil
            )
            .task {
                await viewModel.loadNews()
            }
            .navigationTitle("Top News")
        }
    }
}

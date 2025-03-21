//
//  HomeView.swift
//  Newsly
//
//  Created by Hewad Mubariz on 18.03.25.
//

// HomeView.swift

import SwiftUI

struct HomeView: View {
    @StateObject private var viewModel = NewsViewModel()
    @State private var selectedSection: NewsSection = .home

    var body: some View {
        NavigationStack {
            VStack {
                
                // MARK: - Tabs for News Sections
                NewsTabView(selectedSection: $selectedSection)
                
                if viewModel.isLoading {
                    ProgressView()
                        .padding()
                } else {
                    List(viewModel.articles) { article in
                        NavigationLink(destination: Text(article.title)) {
                            NewsRow(article: article)
                        }
                    }
                    .listStyle(PlainListStyle())
                }
                
                Spacer()
            }
            .navigationTitle("Newsly")
            .onChange(of: selectedSection) {
                Task {
                    await viewModel.loadNews(for: selectedSection)
                }
            }
            .task {
                await viewModel.loadNews(for: selectedSection)
            }
        }
    }
}

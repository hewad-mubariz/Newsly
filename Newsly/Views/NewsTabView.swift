//
//  NewsTabView.swift
//  Newsly
//
//  Created by Hewad Mubariz on 21.03.25.
//


import SwiftUI

struct NewsTabView: View {
    @Binding var selectedSection: NewsSection
    private let sections = NewsSection.allCases
    
    var body: some View {
        ScrollView(.horizontal, showsIndicators: false) {
            HStack(spacing: 20) {
                ForEach(sections, id: \.self) { section in
                    Text(section.rawValue)
                        .font(.headline)
                        .padding(.vertical, 8)
                        .padding(.horizontal, 16)
                        .background(selectedSection == section ? Color.blue : Color.gray.opacity(0.2))
                        .foregroundColor(selectedSection == section ? .white : .black)
                        .cornerRadius(12)
                        .onTapGesture {
                            withAnimation {
                                selectedSection = section
                            }
                        }
                }
            }
            .padding(.horizontal)
        }
    }
}

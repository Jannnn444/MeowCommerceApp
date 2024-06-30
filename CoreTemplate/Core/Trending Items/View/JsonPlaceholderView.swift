//
//  JasonPlaceholderVC.swift
//  CoreTemplate
//
//  Created by Hualiteq International on 2024/6/30.
//
import SwiftUI

struct JsonPlaceholderView: View {
    @ObservedObject var viewModel = TrendingViewModels()

    var body: some View {
        NavigationView {
            List(viewModel.trendingPosts) { post in
                VStack(alignment: .leading) {
                    Text(post.title)
                        .font(.headline)
                    Text(post.body)
                        .font(.subheadline)
                }
            }
            .navigationTitle("Trending Posts")
            .onAppear {
                viewModel.getTrendingPosts()
            }
            .alert(item: $viewModel.errorMessages) { errorMessage in
                Alert(
                    title: Text("Error"),
                    message: Text(errorMessage),
                    dismissButton: .default(Text("OK")) {
                        viewModel.errorMessages = nil
                    }
                )
            }
        }
    }
}

extension String: Identifiable {
    public var id: String { self }
}

#Preview {
    JsonPlaceholderView()
}



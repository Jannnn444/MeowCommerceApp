//
//  OceanView.swift
//  CoreTemplate
//
//  Created by Hualiteq International on 2024/6/30.
//
import SwiftUI

struct OceanView: View {

    @ObservedObject var viewModel = TrendingViewModels()
    
    var body: some View {
        NavigationView {
            List(viewModel.trendingOceanPosts) { post in
                VStack(alignment: .leading) {
                    Text(post.title) // Ensure property names match those in ProductsPost
                        .font(.headline)
                    Text(post.subtitle) // Ensure property names match those in ProductsPost
                        .font(.subheadline)
                }
            }
            .navigationTitle("Trending Ocean Posts")
        }
    }
}

#Preview {
    OceanView()
}


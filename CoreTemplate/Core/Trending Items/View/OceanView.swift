//
//  OceanView.swift
//  CoreTemplate
//
//  Created by Hualiteq International on 2024/6/30.
//

import Foundation


import UIKit

import SwiftUI

struct OceanView: View {

    // call this class and get this init directly
    @ObservedObject var viewModel = TrendingViewModels()
    
    var body: some View {
        NavigationView {
            List(viewModel.trendingOceanPosts) { post in
                VStack(alignment: .leading) {
                    Text(post.Title)
                        .font(.headline)
                    Text(post.Subtitle)
                        .font(.subheadline)
                }
            }
        }
    }
}

#Preview {
    OceanView()
}


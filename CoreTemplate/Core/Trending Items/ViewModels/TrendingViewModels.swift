//
//  TrendingViewModels.swift
//  CoreTemplate
//
//  Created by Hualiteq International on 2024/6/29.
//

import Foundation
import Combine

class TrendingViewModels: ObservableObject, Identifiable {
    
    @Published var trendingPosts: [MyPosts] = []
    @Published var errorMessages: String? = nil
    
    func getTrendingPosts() {
        NetworkManager.shared.getRequest(url: "/posts") { (result: Result<[MyPosts], Error>) in
            DispatchQueue.main.async {
                switch result {
                case .success(let posts):
                    self.trendingPosts = posts
                case .failure(let error):
                    self.errorMessages = error.localizedDescription
                }
            }
        }
    }
}


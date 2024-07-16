//
//  ExploreViewModels.swift
//  CoreTemplate
//
//  Created by Hualiteq International on 2024/7/14.
//

import Foundation
import Combine

class ExploreViewModels: ObservableObject, Identifiable {
    @Published var detailProductsPosts: [DetailPost] = []
    @Published var errorMessages: String? = nil
    
    init() {
        getDetailPosts()
        print("DEBUG: Init called. TrendingOceanPosts: \(detailProductsPosts), ErrorMessages: \(String(describing: errorMessages))")
    }
    func getDetailPosts() {
        print("DEBUG: getTrendingPosts called.")
        
        NetworkManager.shared.getRequest(url: "/api/product/1") { (result: Result<[DetailPost], Error>) in
            
            DispatchQueue.main.async {
                switch result {
                case .success(let posts):
                    self.detailProductsPosts = posts
                    print("DEBUG: Success. Received posts: \(posts)")
                case .failure(let error):
                    self.errorMessages = error.localizedDescription
                    print("DEBUG: Error occurred: \(self.errorMessages ?? "Unknown error")")
                    print("DEBUG: Detailed error: \(error)")
                }
            }
            
        }
    }
}

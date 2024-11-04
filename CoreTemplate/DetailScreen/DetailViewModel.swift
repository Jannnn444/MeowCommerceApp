//
//  ExploreViewModels.swift
//  CoreTemplate
//
//  Created by Hualiteq International on 2024/7/14.
//

import Foundation  

class DetailViewModel: ObservableObject, Identifiable {
    @Published var detailProductsPosts: DetailPost?
    @Published var errorMessages: String? = nil
    @Published var number: String = "1" {
        didSet {
            print("@Debug: Re-fetching posts...")
            getDetailPosts()
        }
    }
    @Published var pageName: String = ""
    
    init() {
        getDetailPosts()
        print("DEBUG: Init called. TrendingOceanPosts: \(detailProductsPosts), ErrorMessages: \(String(describing: errorMessages))")
    }
    
    func getDetailPosts(number: String = "") {
        print("DEBUG: getTrendingPosts called.")
        print("/api/product/\(number)")
        
        NetworkManager.shared.getRequest(url: "/api/product/\(number)") { (result: Result<DetailResponse, Error>) in
            
            DispatchQueue.main.async {
                switch result {
                case .success(let posts):
                
                    self.detailProductsPosts = posts.result
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





//
//  TrendingViewModels.swift
//  CoreTemplate
//
//  Created by Hualiteq International on 2024/6/29.
//
import Foundation
import Combine

class ProductViewModel: ObservableObject, Identifiable {
    
    @Published var productPosts: [ProductsPost] = []
    @Published var errorMessages: String? = nil
    @Published var sideSpace: CGFloat = 25
    
    init(){
        getProductPosts()
        print("DEBUG: Init called. ProductPosts: \(productPosts), ErrorMessages: \(String(describing: errorMessages))")
    }
    
    func getProductPosts() {
        print("DEBUG: getTrendingPosts called.")
        
        NetworkManager.shared.getRequest(url: "/api/product/trending?pageSize=10&pageNo=1" ) { (result: Result<ProductResponse, Error>) in
            DispatchQueue.main.async {
                switch result {
                case .success(let posts):
                    self.productPosts = posts.result                    // fetch result from PriductResponse
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

// 206.189.40.30:4040/api/product
    
// DigitalOceanServerIP
// http://206.189.40.30:4041/api/product?pageSize=9&pageNo=1
// http://206.189.40.30:4041/api/product/trending?pageSize=2&pageNo=1

//
//  ExploreViewModels.swift
//  CoreTemplate
//
//  Created by Hualiteq International on 2024/7/14.
//

import Foundation  

class DetailViewModel: ObservableObject, Identifiable {
    @Published var detailProductsPosts: DetailPost?
    @Published var productRenderList: [ProductRender] = []
    @Published var errorMessages: String? = nil
    @Published var number: String = "067af8ae-f233-4112-a05f-d8ef96061d98" {
        didSet {
            print("@Debug: Re-fetching posts with number = \(number)")
            getDetailPosts()  // Re-fetch data when `number` changes
        }
    }
    
    @Published var pageName: String = ""
    @Published var rateArray: [Int] = [] // Array for star representation
    
    init() {
        getDetailPosts()
        print("DEBUG: Init called. TrendingOceanPosts: \(detailProductsPosts), ErrorMessages: \(String(describing: errorMessages))")
    }
    
    func getRateArray(number: String) {
        print("DEBUG: getRateArray called with number : \(number)")
       
        if let product = detailProductsPosts {
            if let rating = product.rating {
                self.rateArray = convertRatingToStars(rating: rating)
                print("DEBUG: Generated rateArray: \(self.rateArray)")
            } else {
                print("DEBUG: Rating is nil, defaulting rateArray to empty.")
                self.rateArray = []
            }
        } else {
            print("DEBUG: detailProductsPosts is nil, cannot generate rateArray.")
        }
    }
    
    func convertRatingToStars(rating: Double) -> [Int] {
        let fullStars = Int(rating)
        let hasHalfStar = rating.truncatingRemainder(dividingBy: 1) > 0
        var starsArray = Array(repeating: 0, count: fullStars)
        if hasHalfStar {
            starsArray.append(1)
        }
        return starsArray
    }
    
    func getDetailPosts(number: String = "") {
        print("DEBUG: getDetailPosts called with number: \(number)")
        let url = "/api/product/\(number)"
        print("DEBUG: Fetching from URL: \(url)")
        
        NetworkManager.shared.getRequest(url: url) { (result: Result<DetailResponse, Error>) in
            DispatchQueue.main.async {
                switch result {
                case .success(let posts):
                    self.detailProductsPosts = posts.result
                    print("DEBUG: Success. Received posts: \(posts)")
                case .failure(let error):
                    self.errorMessages = error.localizedDescription
                    print("DEBUG: Error occurred: \(self.errorMessages ?? "Unknown error")")
                    
                    // Attempt to print raw data if available
                    if let error = error as? DecodingError {
                        switch error {
                        case .dataCorrupted(let context):
                            print("DEBUG: Data corrupted: \(context.debugDescription)")
                        case .keyNotFound(let key, let context):
                            print("DEBUG: Key '\(key)' not found: \(context.debugDescription)")
                        case .typeMismatch(let type, let context):
                            print("DEBUG: Type '\(type)' mismatch: \(context.debugDescription)")
                        case .valueNotFound(let value, let context):
                            print("DEBUG: Value '\(value)' not found: \(context.debugDescription)")
                        @unknown default:
                            print("DEBUG: Unknown decoding error")
                        }
                    } else {
                        print("DEBUG: General error: \(error.localizedDescription)")
                    }
                }
            }
            
        }
    }
}





//
//  ExploreViewModels.swift
//  CoreTemplate
//
//  Created by Hualiteq International on 2024/7/14.
//

import Foundation  

class DetailViewModel: ObservableObject, Identifiable {
    @Published var detailProductsPosts: ProductRender?
    @Published var errorMessages: String? = nil
    @Published var number: String = ""
    
    init() {
        getDetailPosts(number: "")
    }

    func checkClosestNumberToShowStar(ratingNum: Double) -> [Int] {
        let starsTierArray = [1.0, 1.5, 2.0, 2.5, 3.0, 3.5, 4.0, 4.5, 5.0]
        var cloestTier: Double = 0.0
        var smallestDifference: Double = 6.0
        var starArray: [Int] = []
        
        for item in starsTierArray {
            let diff = abs(item - ratingNum)
            
            if diff < smallestDifference {
                smallestDifference = diff
                cloestTier = item
            }
        }
        let intergerPart = Int(floor(cloestTier))
        let fractionPart = cloestTier - Double(intergerPart)
        
        starArray = Array(repeating: 0, count: intergerPart)
        
        if fractionPart > 0 {
            starArray.append(1)
        }
        print("Star array: \(starArray)")
        return starArray
    }
    
    
    func getDetailPosts(number: String = "") {
        print("DEBUG: getDetailPosts called with number: \(number)")
        let url = "/api/product/\(number)"
        print("DEBUG: Fetching from URL: \(url)")
        
        NetworkManager.shared.getRequest(url: url) { (result: Result<DetailResponse, Error>) in
            DispatchQueue.main.async {
                switch result {

                case .success(let posts):
                  
                    print("DEBUG: Success. Received posts: \(posts.result)")
                    
                    guard let detailPostRating = posts.result.rating else { return }
                    
                    let ratings = self.checkClosestNumberToShowStar(ratingNum: detailPostRating)
                    
                    // Safely create and append a product to the list 
                   
                    let postRes = posts.result
                        
                       let product = ProductRender(
                            id: postRes.id,
                            title: postRes.title,
                            subtitle: postRes.subtitle,
                            image_url: postRes.image_url,
                            price: postRes.price,
                            rating: ratings,
                            weight: postRes.weight,
                            detail: postRes.detail
                        )
                    self.detailProductsPosts = product
                    print("DEBUG RATING - state: \(self.detailProductsPosts)")
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





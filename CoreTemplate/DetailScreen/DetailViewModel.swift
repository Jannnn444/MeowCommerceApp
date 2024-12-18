//
//  ExploreViewModels.swift
//  CoreTemplate
//
//  Created by Hualiteq International on 2024/7/14.
//

import Foundation  

struct ProductRatingPayload: Encodable {
    let rating: Double
}

class DetailViewModel: ObservableObject, Identifiable {
    @Published var detailProductsPosts: ProductRender?
    @Published var detailProduct: DetailPost?
    @Published var errorMessages: String? = nil
    @Published var number: String = "" //5189a7b7-59d7-4b8f-a3e3-6870ba38baf3
    
    init() {
        getDetailPosts(number: number)
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
    
    func postRating(number: String, payload: ProductRatingPayload ) {
        print("DEBUG: Post DetailPosts called with number: \(number)")
        
        let url = "/api/product/\(number)/rate"
        print("DEBUG: Process Posting to URL: \(url)")
        
        NetworkManager.shared.postRequest(url: url, payload: payload) { (result: Result<GeneralResponse, Error>) in
                  DispatchQueue.main.async {
                      switch result {
                      case .success(let posts):
                          print("DEBUG: Successfully posted detail: \(posts)")
                      case .failure(let error):
                          self.handleError(error)
                      }
                  }
              }
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
                    print("DEBUG: Error occurred: \(self.errorMessages ?? "Unknown error")")
                    self.handleError(error)
                }
            }
            
        }
    }
    
    
    func getDetailPostsOriginal(number: String = "") {
        print("DEBUG: getDetailPosts called with number: \(number)")
        let url = "/api/product/\(number)"
        print("DEBUG: Fetching from URL: \(url)")
        
        NetworkManager.shared.getRequest(url: url) { (result: Result<DetailResponse, Error>) in
            DispatchQueue.main.async {
                switch result {
                case .success(let posts):
                    self.detailProduct = posts.result
                    print("DEBUG: Success. Received posts: \(posts)")
                case .failure(let error):
                    print("DEBUG: Error occurred: \(self.errorMessages ?? "Unknown error")")
                    self.handleError(error)
                }
            }
        }
    }
    
    private func handleError(_ error: Error) {
           self.errorMessages = error.localizedDescription
           print("DEBUG: Error occurred: \(self.errorMessages ?? "Unknown error")")
           
           if let decodingError = error as? DecodingError {
               switch decodingError {
               case .dataCorrupted(let context):
                   print("DEBUG: Data corrupted: \(context.debugDescription)")
               case .keyNotFound(let key, let context):
                   print("DEBUG: Key '\(key)' not found: \(context.debugDescription)")
               case .typeMismatch(let type, let context):
                   print("DEBUG: Type mismatch for type '\(type)': \(context.debugDescription)")
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





//
//  RateMeUpView.swift
//  CoreTemplate
//
//  Created by Hualiteq International on 2024/11/14.
//
//
//  RateMeUpView.swift
//  CoreTemplate
//
//  Created by Hualiteq International on 2024/11/14.
//

import SwiftUI

struct RateMeUpView: View {
    
    var number: String = ""
    @ObservedObject var detailViewModel = DetailViewModel()
    @State var newProductList: [ProductRender] = []
    
    var body: some View {
        VStack {
            Text("-STAR LAB OPEN-")
                .font(.headline)
            
            // MARK: Star API - Display Rating
            HStack {
                ForEach(detailViewModel.rateArray, id: \.self) { star in
                    Image(systemName: star == 0 ? "star.fill" : "star.lefthalf.fill")
                        .foregroundColor(.yellow)
                }
            }
            .padding()
            
            Divider()
            
            // MARK: Render New Product List
                
                ForEach(newProductList, id: \.title) { product in
                    HStack {
                        ForEach(product.rating, id: \.self) { star in
                            if (star == 0) {
                                Image(systemName: "star.fill")
                                    .foregroundColor(.yellow)
                            } else if star == 1 {
                                Image(systemName: "star.lefthalf.fill")
                                    .foregroundColor(.yellow)
                            }
                        }
                    }
                }
            
        }
        .onAppear {
            detailViewModel.getDetailPosts()
            detailViewModel.getRateArray(number: self.number)
            
            // Safely create and append a product to the list
            if let detailPost = detailViewModel.detailProductsPosts {
                // Extract and convert properties for the ProductRender
                let ratings = detailViewModel.convertRatingToStars(rating: detailPost.rating ?? 0.0)
                
                let product = ProductRender(
                    title: detailPost.title,
                    subtitle: detailPost.subtitle,
                    image_url: detailPost.image_url,
                    price: detailPost.price,
                    rating: ratings,
                    weight: detailPost.weight,
                    detail: detailPost.detail
                )
                newProductList = [product]
            }
        }
    }
}

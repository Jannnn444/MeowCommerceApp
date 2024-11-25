//
//  ProductRender.swift
//  CoreTemplate
//
//  Created by Hualiteq International on 2024/11/20.
//

import Foundation

struct ProductRender: Identifiable {
    var id = UUID()
    var title: String
    var subtitle: String
    var image_url: String
    var price: Int
    var rating: [Int]
    var weight: Int
    var detail: String?
    
    init(title: String, subtitle: String, image_url: String, price: Int, rating: Double, weight: Int, detail: String?) {
         self.title = title
         self.subtitle = subtitle
         self.image_url = image_url
         self.price = price
         self.rating = [Int(rating), Int(round((rating - Double(Int(rating))) * 2))] 
        // Converts 4.3333 -> [4, 1]
         self.weight = weight
         self.detail = detail
     }
}

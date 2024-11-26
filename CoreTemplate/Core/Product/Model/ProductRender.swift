//
//  ProductRender.swift
//  CoreTemplate
//
//  Created by Hualiteq International on 2024/11/20.
//

import Foundation

struct ProductRender: Identifiable {
    var id : String
    var title: String
    var subtitle: String
    var image_url: String
    var price: Int
    var rating: [Int]
    var weight: Int
    var detail: String?
    
}

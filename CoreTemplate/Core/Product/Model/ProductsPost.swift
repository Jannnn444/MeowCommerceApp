//
//  OceanPost.swift
//  CoreTemplate
//
//  Created by Hualiteq International on 2024/6/30.
//

import Foundation

struct ProductsPost: Codable, Hashable, Identifiable {
    let id: String
    let title: String
    let subtitle: String
    let image_url: String
}

struct ProductResponse: Codable, Hashable {
    let message: String
    let statusCode: Int
    let result: [ProductsPost]
}

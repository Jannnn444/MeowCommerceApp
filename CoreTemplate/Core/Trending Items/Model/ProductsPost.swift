//
//  OceanPost.swift
//  CoreTemplate
//
//  Created by Hualiteq International on 2024/6/30.
//

import Foundation

struct ProductsPost: Codable, Hashable, Identifiable {
    let id: Int
    let title: String
    let subtitle: String
    let imageUrl: String
    let price: Int
    let rating: Int
    let weight: Int
    let detail: String
}


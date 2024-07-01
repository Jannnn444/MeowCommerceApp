//
//  OceanPost.swift
//  CoreTemplate
//
//  Created by Hualiteq International on 2024/6/30.
//

import Foundation

struct ProductsPost: Codable, Hashable, Identifiable {
    let id: Int
    let Title: String
    let Subtitle: String
    let ImageUrl: String
}


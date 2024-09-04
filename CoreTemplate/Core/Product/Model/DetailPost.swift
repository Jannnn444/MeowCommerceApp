//
//  DetailPost.swift
//  CoreTemplate
//
//  Created by Hualiteq International on 2024/7/15.
//

import Foundation

struct DetailPost: Codable, Hashable, Identifiable {
    let id: Int
    let title: String
    let subtitle: String
    let imageUrl: String
    let price: Int
    let rating: Int
    let weight: Int
    let detail: String
}

//206.189.40.30




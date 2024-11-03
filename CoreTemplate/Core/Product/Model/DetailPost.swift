//
//  DetailPost.swift
//  CoreTemplate
//
//  Created by Hualiteq International on 2024/7/15.
//

import Foundation

struct DetailPost: Codable, Hashable, Identifiable {
    let id: String
    let title: String
    let subtitle: String
    let imageUrl: String
    let price: Int
    let rating: Int   //optional
    let weight: Int
    let detail: String //optional
}

struct DetailResponse {
    let message: String
    let status: Int
    let result: [DetailPost]
}


//206.189.40.30



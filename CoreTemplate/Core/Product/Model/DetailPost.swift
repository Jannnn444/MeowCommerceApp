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
    let image_url: String
    let price: Int
    let rating: Double?   //optional
    let weight: Int
    let detail: String? //optional
}

struct DetailResponse: Codable, Hashable {
    let message: String
    let statusCode: Int
    let result: DetailPost
}

struct GeneralResponse: Codable, Hashable {
    let message: String
    let statusCode: Int
}


//206.189.40.30



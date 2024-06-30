//
//  Post.swift
//  CoreTemplate
//
//  Created by Hualiteq International on 2024/6/30.
//

import Foundation

struct MyPosts: Decodable, Identifiable {
    let userId: Int
    let id: Int
    let title: String
    let body: String
}

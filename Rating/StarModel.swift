//
//  StarModel.swift
//  CoreTemplate
//
//  Created by yucian huang on 2024/10/22.
//

import Foundation
import SwiftData

@Model
class StarModel {
    
    var rating: Double = 1.0
    
    init(rating: Double) {
        self.rating = rating
    }
}


// here we can save the class we created


// example

/*
let starmodels: [StarModel] = [

    StarModel(rating: 5.0),
    StarModel(rating: 5.4),
    StarModel(rating: 4.7)
]
*/

// you can see here as the app star bank for all user reviews
// later we need star post
// to update to our server

//
//  RatingView.swift
//  CoreTemplate
//
//  Created by yucian huang on 2024/10/22.
//

import SwiftUI

struct RatingView: View {
    
    var ratingArray: [Int]
    
    var body: some View {
        HStack {
            ForEach(ratingArray, id: \.self) { number in
                if number == 0 {
                    Image(systemName: "star.fill")
                } else if number == 1 {
                    Image(systemName: "star.leadinghalf.filled")
                } else {
                    Image(systemName: "star")
                }
            }
        }
    }
    
}
struct Rating {
    
    static func checkStarsCloestFilter(num: Double) -> [Int] {
        let starTierArray = [1.0, 1.5, 2.0, 2.5, 3.0, 3.5, 4.0, 4.5, 5.0]
        var cloestTier: Double = 0.0
        var smallestDifferenceDefault: Double = 6.0
        var starArray0and1: [Int] = []
        
        for item in starTierArray {
            let diff = abs(item - num)
            if diff < smallestDifferenceDefault {
                cloestTier = item
                // here we find the cloest star rate, and updated.
            }
        }
        
        let numItself = Int(floor(cloestTier))
        let numAfterPart = cloestTier - Double(numItself)
        
        starArray0and1 = Array(repeating: 0, count: numItself)
        
        if numAfterPart > 0 {
            starArray0and1.append(1)
        }
        print("DEEBUG star array current: \(starArray0and1)")
        return starArray0and1
    }
    
}

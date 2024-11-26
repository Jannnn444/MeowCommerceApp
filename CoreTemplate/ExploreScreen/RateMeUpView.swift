//
//  RateMeUpView.swift
//  CoreTemplate
//
//  Created by Hualiteq International on 2024/11/14.
//

import SwiftUI

struct RateMeUpView: View {
    
    
    @StateObject var detailViewModel = DetailViewModel()
    var number: String = ""
    
    var body: some View {
        VStack {
            Text("-STAR LAB OPEN-")
                .font(.headline)
            
            Divider()
            // MARK: Render New Product List
            if let newProductList = detailViewModel.detailProductsPosts {
                HStack {
                    ForEach(newProductList.rating, id: \.self) { star in
                        if (star == 0) {
                            Image(systemName: "star.fill")
                                .foregroundColor(.yellow)
                        } else if star == 1 {
                            Image(systemName: "star.lefthalf.fill")
                                .foregroundColor(.yellow)
                        }
                    }
                }
            }
        }
    }
}











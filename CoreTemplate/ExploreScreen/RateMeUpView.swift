//
//  RateMeUpView.swift
//  CoreTemplate
//
//  Created by Hualiteq International on 2024/11/14.
//

import SwiftUI

struct RateMeUpView: View {
    // NOTE: Here only for static api testing!
    
    @StateObject var detailViewModel = DetailViewModel()
    var number: String = "5189a7b7-59d7-4b8f-a3e3-6870ba38baf3"
//    var number: String = ""
    
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
        }.onAppear() {
          /*  detailViewModel.getDetailPostsOriginal(number: self.number)  */ // load the api post for original code
            detailViewModel.getDetailPosts(number: self.number) // load the func with transform the star array
        }
    }
}











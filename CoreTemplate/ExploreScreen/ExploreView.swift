//
//  ExploreView.swift
//  CoreTemplate
//
//  Created by Hualiteq International on 2024/9/2.
//

import SwiftUI

struct ExploreView: View {
    
    @State var nav: NavState = .Explore
    @ObservedObject var detailViewModel = DetailViewModel()
    
    // 1. a) Define a new type that mirrors your data, expect change Ratings Int -> [Int]
    struct DetailProductRender: Identifiable, Hashable {
        let id = UUID()
        let title: String
        let subtitle: String
        let imageUrl: String
        let price: Int
        let rating: [Int]               // -> new type
        let weight: Int
        let detail: String
    }
    // 1. b) Define the state that will held this new data type for UI to render
    @State var myDetailPostList: [DetailProductRender] = []
    
    let columns = Array(repeating: GridItem( spacing: 0, alignment: .center), count: 2)
    
    var body: some View {
        ZStack{
            ScrollView {
                Text("Store Catalogs")
                    .padding()
                    .font(.title)
                    .foregroundStyle(Color.black)
                                       
                LazyVGrid(columns: columns, spacing: 5) {
                    ForEach(myDetailPostList, id: \.self) { product in
                        Group{
                            VStack {
//                                AsyncImage(url: URL(string: "https://picsum.photos/600" ))
//                                    .scaledToFit()
//                                    .frame(width: 150, height: 160)
//                                    .cornerRadius(5)
                                Text("Item name : \(product.title)")
                                    .font(.body)
                                    .foregroundStyle(Color.black)
                                
                                HStack {
                                    Text("Ratings: \(product.rating.count)")
                                        .font(.subheadline)
                                        .foregroundStyle(Color.secondary)
                                  
                                    // stars ratings
                                    // 3. Add View
                                    RatingView(ratingArray: product.rating)
                                }
                            }.padding()
                        }
                    }
                }
                Text("Happy doggo shop.co")
                    .padding()
                    .font(.body)
                    .foregroundStyle(Color.black)
            }
            .padding()
        } 
        .onAppear {
            // 2. Convert data to include the ratings as an Array of Int
            if let product = detailViewModel.detailProductsPosts {
                let formattedProducts = DetailProductRender(
                    title: product.title,
                    subtitle: product.subtitle,
                    imageUrl: product.imageUrl,
                    price: product.price,
                    rating: Rating.checkStarsCloestFilter(num: Double(product.rating)),
                    weight: product.weight,
                    detail: product.detail
                )
                
                self.myDetailPostList = [formattedProducts] // Wrap it in an array
            } else {
                self.myDetailPostList = [] // Provide a fallback in case data is nil
            }
        }
    }
}

#Preview {
    ExploreView()
}

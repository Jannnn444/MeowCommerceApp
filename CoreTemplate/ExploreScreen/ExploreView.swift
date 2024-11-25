//
//  ExploreView.swift
//  CoreTemplate
//
//  Created by Hualiteq International on 2024/9/2.
//

import SwiftUI

struct ExploreView: View {
    
    @Binding var number: String
    @State var nav: NavState = .Explore
    @ObservedObject var detailViewModel = DetailViewModel()
    
    // 1. a) Define a new type that mirrors your data, expect change Ratings Int -> [Int]
    struct DetailProductRender: Codable, Hashable, Identifiable {
        
        let id: String
        let title: String
        let subtitle: String
        let image_url: String
        let price: Int
        let rating: [Int]    // -> new type
        let weight: Int
        let detail: String?
        
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
                                AsyncImage(url: URL(string: "https://picsum.photos/600" ))
                                    .scaledToFit()
                                    .frame(width: 150, height: 160)
                                    .cornerRadius(5)
                                Text("Item name: \(product.title)")
                                    .font(.body)
                                    .foregroundStyle(Color.black)
                                
                                HStack {
                                    Text("Ratings: ")
                                        .font(.subheadline)
                                        .foregroundStyle(Color.secondary)
                                    
                                    // 3. Add View
                                    RatingView(ratingArray: product.rating)
                                }
                            }.padding(.top, 5)
                        }
                    }
                }
                .padding(.horizontal)
                Text("Happy doggo shop.co")
                    .padding()
                    .font(.body)
                    .foregroundStyle(Color.black)
            }
            .padding()
        }
        .onAppear {
//             Fetch and format data on view appearance
////            detailViewModel.getDetailPosts { products in
////                guard let products = products else {
////                    self.myDetailPostList = [] // Clear list if data is nil
////                    return
////                }
////                
////                // Map fetched products to `DetailProductRender` format
////                self.myDetailPostList = products.map { product in
////                    DetailProductRender(
////                        id: product.id,
////                        title: product.title,
////                        subtitle: product.subtitle,
////                        image_url: product.image_url,
////                        price: product.price,
////                        rating: Rating.checkStarsCloestFilter(num: Double(product.rating ?? 1.1)),
////                        weight: product.weight,
////                        detail: product.detail ?? ""
////                    )
////                }
////            }
        }
        
    }
    
}

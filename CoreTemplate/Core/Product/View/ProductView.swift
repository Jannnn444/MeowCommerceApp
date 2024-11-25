//
//  TrendingScrollView.swift
//  CoreTemplate
//
//  Created by Hualiteq International on 2024/5/13.
//

import SwiftUI

struct ProductView: View {
    
    @State private var showingSheet = false
    @ObservedObject var viewModel = ProductViewModel()
    
    
    //    @State var title = ["Free puppy socilaisation in store", "Eco-friendly toys your dog will love", "Top sales in 2024 in discount", "DIY your doggo new gangster vest"]
    //    @State var infos = ["FREE", "Shop Green Elk", "Puppie Land", "Green Ville"]
    
    @State var number: String = ""
    @State var pageName: String = ""
    
    
    var body: some View {
        
        // MARK: ScrollView
        ScrollView(.horizontal) {
            
            Spacer()
            
            HStack{
                ForEach(viewModel.productPosts) { post in
                    
                    // MARK: Button
                    Button(action: {
                        // Button Action
                        
                        // Updating Detail Page PostId and PostTitle
                        number = post.id
                        pageName = post.title
                        showingSheet.toggle()
                    }) {
                        // Button View
                        // MARK: ScrollViewPhoto
                        
                        VStack(alignment: .leading) {
                            Image("Rectangle1")
                                .resizable()
                                .frame(width: 180, height: 180)
                                .cornerRadius(20)
                            
                        // MARK: ScrollViewText
                            
                            Group() {
                                Text(post.title) .font(.custom("BrandonGrotesque-Medium", size: 16))
                                    .lineLimit(nil)
                                    .frame(width: 190, height: 36, alignment: .leading)
                                    .foregroundStyle(Color.black)
                                
                                Text(post.subtitle).font(.custom("BrandonGrotesque-Medium", size: 14))
                                    .lineLimit(nil)
                                    .frame(width: 190, height: 36, alignment: .leading)
                                    .padding(.top, -15)
                                    .foregroundStyle(Color.black)
                            }
                        }
                    }
                    .sheet(isPresented: $showingSheet, content: {
                        DetailView(number: $number)
//                            .presentationDetents([.fraction(1.0)]) // Full screen presentation
//                            .presentationDragIndicator(.hidden) // Optional: shows the drag indicator
                        
                        
                    })
                }
            }
        }
    }
}

#Preview {
    ProductView()
}

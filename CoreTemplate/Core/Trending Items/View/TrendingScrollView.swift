//
//  TrendingScrollView.swift
//  CoreTemplate
//
//  Created by Hualiteq International on 2024/5/13.
//

import SwiftUI

struct TrendingScrollView: View {
    
    
    @ObservedObject var viewModel = TrendingViewModels()
    
    @State var title = ["Free puppy socilaisation in store", "Eco-friendly toys your dog will love", "Top sales in 2024 in discount", "DIY your doggo new gangster vest"]
    @State var infos = ["FREE", "Shop Green Elk", "Puppie Land", "Green Ville"]
    
    
    var body: some View {
        
        // MARK: ScrollView
        ScrollView(.horizontal) {
            VStack {
                // MARK: ScrollViewPhoto
                // MARK: ScrollViewText
                HStack() {
                    ForEach(1..<5) {
                        Image("Rectangle\($0)")
                            .resizable()
                            .frame(width: 173, height: 178)
                            .cornerRadius(20)
                    }
                    Spacer()
                    
                    HStack{
                        ForEach(viewModel.trendingOceanPosts) { post in
                            
                            VStack(alignment: .leading) {
                                
                                
                                Text(post.title) .font(.custom("BrandonGrotesque-Medium", size: 16))
                                    .lineLimit(nil)
                                    .frame(width: 150, height: 36)
                                Text(post.subtitle).font(.custom("BrandonGrotesque-Medium", size: 14))
                                    .lineLimit(nil)
                                    .frame(width: 150, height: 36)
                            }
                            Spacer()
                        }
                    }
                    
//                    ForEach(0..<title.count, id: \.self) { index in
//                        VStack(alignment: .leading) {
//                            
//                            Text(title[index])
//                                
//                                .lineLimit(nil)
// //                               .font(.system(size: 16, weight: .medium))
//                                .font(.custom("BrandonGrotesque-Medium", size: 16))
//                                .foregroundStyle(.black)
//                                .frame(width: 173, height: 40)
//                            
//                                
//                            
//                                Text(infos[index])
//                                    .lineLimit(nil)
//                                    Spacer(minLength: 50)
//                                    .foregroundStyle(.secondary)
////                                    .font(.system(size: 14, weight: .medium))
//                                    .font(.custom("BrandonGrotesque-Medium", size: 14))
//                                    .frame(width: 173, height: 36)
//                        }
//                    }                   
                }
                
            }


        }
        
    }
}

#Preview {
    TrendingScrollView()
}

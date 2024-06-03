//
//  TrendingScrollView.swift
//  CoreTemplate
//
//  Created by Hualiteq International on 2024/5/13.
//

import SwiftUI

struct TrendingScrollView: View {
    
    @State var title = ["Free puppy socilaisation in store", "Eco-friendly toys your dog will love", "Top sales in 2024 in discount", "DIY your doggo new gangster vest"]
    @State var infos = ["FREE", "Shop Green Elk", "Puppie Land", "Green Ville"]
    var body: some View {
        
        // MARK: ScrollView
        ScrollView(.horizontal) {
            VStack {
                // MARK: ScrollViewPhoto
                HStack {
                        ForEach(1..<5) {
                            Image("Rectangle\($0)")
                                .resizable()
                                .frame(width: 173, height: 178)
                                .cornerRadius(20)
                        }
   //                     .padding(.leading, 25)
                        .padding(.top, 30)
                }
                // MARK: ScrollViewText
                HStack() {
                    ForEach(0..<title.count, id: \.self) { index in
                        VStack(alignment: .leading) {
                            
                            Text(title[index])
                                .lineLimit(nil)
                                .multilineTextAlignment(.leading)
                                .font(.system(size: 16, weight: .medium))
                                .foregroundStyle(.black)
                                .frame(width: 173, height: 40)
                                .padding(.top, 3)
                                
                            
                                Text(infos[index])
                                    .lineLimit(nil)
                                    .multilineTextAlignment(.leading)
                                    .foregroundStyle(.secondary)
                                    .font(.system(size: 14, weight: .medium))
                                    .frame(width: 173, height: 36)
                                    .padding(.top, -10)
 
                        }
                       
  //                          .padding(.leading, 25)
                            .padding(.top, 2)
                        
                    }
  //                  .padding(.top, 2)

                }
            }
//                                        .padding(.leading, 25)
//                                        .padding(.top, 30)

        }
 //       .padding(3)
        
    }
}

#Preview {
    TrendingScrollView()
}

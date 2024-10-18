//
//  ExploreView.swift
//  CoreTemplate
//
//  Created by Hualiteq International on 2024/9/2.
//

import SwiftUI

struct ExploreView: View {
    
    @State var nav: NavState = .Explore
    
    let columns = Array(repeating: GridItem( spacing: 0, alignment: .center), count: 2)
    
    var body: some View {
            ZStack{
                ScrollView {
                Text("Store Catalogs")
                    .padding()
                    .font(.title)
                    .foregroundStyle(Color.black)
  
                // MARK: LazyGrid 3 - AsyncImage
                LazyVGrid(columns: columns, spacing: 5) {
                    ForEach(0..<12, id: \.self) { index in
                        Group{
                            VStack {
                                AsyncImage(url: URL(string: "https://picsum.photos/600"))
                                    .scaledToFit()
                                    .frame(width: 150, height: 160)
                                    .cornerRadius(5)
                                Text("Item name : ")
                                    .font(.body)
                                    .foregroundStyle(Color.black)
                            }
                        }
                    }.padding()
                 
                }
                    Text("Happy doggo shop.co")
                        .padding()
                        .font(.body)
                        .foregroundStyle(Color.black)
            }
            .padding()
        }
    }
}

#Preview {
    ExploreView()
}

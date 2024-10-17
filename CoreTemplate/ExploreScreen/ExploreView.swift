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
                
    /*            // MARK: LazyGrid 1 - Blue
                LazyVGrid(columns: columns, spacing: 10) {
                    ForEach(0..<8, id: \.self) { index in
                        ZStack {
                            Rectangle()
                                .fill(Color.cyan)
                                .frame(width: 140, height: 170)
                                .cornerRadius(5)
                        }
                    }.padding()
                        .onTapGesture {
                            print("This Rectangle got presses! U guys!")
                        }
                }
                // MARK: LazyGrid 2 - yellow
                LazyVGrid(columns: columns, spacing: 10) {
                    ForEach(0..<8, id: \.self) { index in
                        Rectangle()
                            .fill(Color.yellow)
                            .frame(width: 120, height: 150)
                            .cornerRadius(5)
                    }.padding(.top, 30).padding(.bottom, 20)
                        .onTapGesture {
                            print("This Rectangle got presses! U guys!")
                        }
                }
     */
                    
                // MARK: LazyGrid 3 - AsyncImage
                LazyVGrid(columns: columns, spacing: 21) {
                    ForEach(0..<12, id: \.self) { index in
                        AsyncImage(url: URL(string: "https://picsum.photos/600"))
                            .scaledToFit()
                            .frame(width: 120, height: 150)
                            .cornerRadius(5)
                    }.padding(.bottom, 7) .padding()
                }
            }
            .padding()
        }
    }
}

#Preview {
    ExploreView()
}

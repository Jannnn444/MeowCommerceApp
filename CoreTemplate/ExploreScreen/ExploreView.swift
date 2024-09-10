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
        VStack{
            Text("Hello, World!")
                .padding()
                .font(.title)
                .foregroundStyle(Color.black)
            
            LazyVGrid(columns: columns, spacing: 10) {
            
                ForEach(0..<8, id: \.self) { index in
                    Rectangle()
                        .fill(Color.cyan)
                        .frame(width: 140, height: 170)
                        .cornerRadius(5)
                    
                }.padding()
               
            }
        }
        .padding()
    }
}

#Preview {
    ExploreView()
}

//
//  ExploreView.swift
//  CoreTemplate
//
//  Created by Hualiteq International on 2024/9/2.
//

import SwiftUI

struct ExploreView: View {
    
    @State var nav: NavState = .Explore
    
    var body: some View {
        VStack{
            Text("Hello, World!")
                .padding()
                .font(.title)
                .foregroundStyle(Color.black)
        }
        .padding()
    }
}

#Preview {
    ExploreView()
}

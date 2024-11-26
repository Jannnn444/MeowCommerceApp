//
//  ExploreCategories.swift
//  CoreTemplate
//
//  Created by Hualiteq International on 2024/11/26.
//

import SwiftUI

struct ExploreCategoriesView: View {
    @State var nav: NavState = .Explore
    @State var searchText = ""
    private var sideSpace: CGFloat = 25
    
    var body: some View {
        
        ScrollView {
            //MARK: App Wrapper
            VStack {
                Text("Exxplore Categories")
                    .font(.custom("BrandonGrotesque-Medium", size: 24))
                
                HStack {
                    Image("Vector")
                    TextField("Search Product or Brand", text: $searchText)
                }
                .padding()
                .frame(maxWidth: .infinity, maxHeight: 50)
                .background(.lighttGray)
                .cornerRadius(10)
                .foregroundStyle(Color.darkkGray)
                
            }
        } .padding( sideSpace)
    }
}

#Preview {
    ExploreCategoriesView()
}

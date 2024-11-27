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
        VStack {
            ScrollView {
                //MARK: App Wrapper
                VStack {
                    Text("Explore Categories")
                        .font(.custom("BrandonGrotesque-Medium", size: 24))
                    
                    HStack {
                        Image("Vector")
                        TextField("Search Product or Brand", text: $searchText)
                            .font(.custom("BrandonGrotesque-Medium", size: 14))
                    }
                    .padding()
                    .frame(maxWidth: .infinity, maxHeight: 50)
                    .background(.lighttGray)
                    .cornerRadius(10)
                    .foregroundStyle(Color.darkkGray)
                    
                    HStack {
                        ScrollView(.horizontal, showsIndicators: false) {
                            CapsuleCategoryButton()
                        }
                    }
                }
            } .padding(sideSpace)
            
            squareProductList()
        }
        .padding()
    }
}

#Preview {
    ExploreCategoriesView()
}


struct CapsuleCategoryButton: View {
    @State var categoryTitle: [String] = ["All", "Dog", "Cat", "Bird"]
    var body: some View {
        
        VStack{
            HStack{
                ForEach(categoryTitle, id: \.self) { categoryItem in
                    Button(action: {
                        print("Category list button tapped!")
                    }) {
                        Text(categoryItem)
                            .font(.custom("BrandonGrotesque-Medium", size: 15))
                            .foregroundStyle(.black)
                            .padding()
                            .frame(width: 80, height: 50)
                            .overlay(
                                RoundedRectangle(cornerRadius: 25)
                                    .stroke(Color.darkkGray, lineWidth: 2)
                            )
                    }
                }
            }.padding()
           
        }
    }
}

struct squareProductList: View {
    var body: some View {
        
            Rectangle()
            .frame(width: 80, height: 50)
            .cornerRadius(20)
            Rectangle()
            .frame(width: 80, height: 50)
            .cornerRadius(20)
    }
}

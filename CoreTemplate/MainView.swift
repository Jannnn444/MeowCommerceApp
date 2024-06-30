//
//  ContentView.swift
//  CoreTemplate
//
//  Created by Janus on 2024/4/29.
//

import SwiftUI

struct MainView: View {
    
    @ObservedObject var viewModel = TrendingViewModels()
    @State var nav: NavState = .Shop
    
    @State var searchText = ""
    private var sideSpace: CGFloat = 25
    
    var body: some View {
        ScrollView {
            //MARK: App Wrapper
            VStack {
                //MARK: Search & Banner Wrapper
                VStack {
                    
                    HStack {
                        
                        //MARK: Search
                        Image("doggoIcon")
                        
                        ZStack{
                            HStack {
                                Image("Vector")
                                //                      .padding(.horizontal, 8)
                                TextField("Search Product or Brand", text: $searchText)
                            }
                            
                            .frame(maxWidth: .infinity, maxHeight: 52)
                            .background(Color.LighttGray)
                            .cornerRadius(10)
                            
                            .foregroundStyle(Color.DarkkGray)
                            // .font(.system(size: 14, weight: .medium))

                        }
                        
                    }
                    //MARK: Banner
                    BannerDesignView()
                        .padding(.top, 20)
                        .padding(.bottom, 20)
                    
                }
                .padding(.trailing, sideSpace)
                
                //MARK: List -- "Trending Items"
                
                SectionTitle(title: "Trending now")
                    .font(.custom("BrandonGrotesque-Medium", size: 24))
                    .padding(.trailing, sideSpace)
                TrendingScrollView()
                    .padding(.bottom, 10)
                
                
                
                //MARK: List -- "Browse Pet Types"
                SectionTitle(title: "Browse pet types")
                    .font(.custom("BrandonGrotesque-Medium", size: 24))
                    .padding(.trailing, sideSpace)
                BrowswPetTypeCategory()
                
//               JsonPlaceholderView()
                
//                switch nav {
//                case .Shop:
//                    Text("Shop")
//                case .Explore:
//                    Text("Explore")
//                case .Favourite:
//                    Text("Favorite")
//                case .Account:
//                    Text("Explore")
//                }
                
            }
            
            .padding(.leading, sideSpace)
            Spacer()
            
            //MARK: Navigation Bar Menu
            NavView(navigationState: $nav)
//                .toolbarBackground(Color.cyan, for: .navigationBar)
//                .toolbarBackground(.visible, for: .navigationBar)
                .colorMultiply(.black)
                .font(.title)
                
               
        }
    }
       
    
}

#Preview {
    MainView()
}



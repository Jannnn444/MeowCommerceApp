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
                switch nav {
                case .Shop:
                    TabShopView()
                case .Explore:
                    Text("Explore")
                case .Favourite:
                    Text("Favorite")
                case .Account:
                    Text("Explore")
                }
            }
            
            .padding(.leading, sideSpace)
            Spacer()
            
                //MARK: Navigation Bar Menu
                NavBarView(navigationState: $nav)
                    .colorMultiply(.black)
                    .font(.title)
        }
    }
}

#Preview {
    MainView()
}



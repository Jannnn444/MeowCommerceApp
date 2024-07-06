//
//  ContentView.swift
//  CoreTemplate
//
//  Created by Janus on 2024/4/29.
//

import SwiftUI

struct MainView: View {
    
    @State var nav: NavState = .Shop
    
    var body: some View {
        
        ScrollView {
            VStack {
                switch nav {
                case .Shop:
                    TheShopView()
                case .Explore:
                    TheExploreView()
                case .Favourite:
                    Text("Favorite")
                case .Account:
                    Text("Explore")
                }
            }
            
            //MARK: Navigation Bar Menu
            
            NavBarView(navigationState: $nav)
                .colorMultiply(.secondary)
                .font(.title)
        }
    }
}

#Preview {
    MainView()
}



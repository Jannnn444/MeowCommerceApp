//
//  ContentView.swift
//  CoreTemplate
//
//  Created by Janus on 2024/4/29.
//

import SwiftUI

struct MainView: View {
    
    @State private var navigationState: NavState = .Shop
    
    var body: some View {
        ZStack {
            ScrollView {
                HStack {
                    
                    switch navigationState {
                    case .Shop:
                        ShopView()
                    case .Explore:
                        ExploreView()
                    case .Favourite:
                        Text("Favorite")
                    case .Account:
                        Text("Acocunt")
                    }
                }
                .padding(.bottom, 10) //60
            }
            VStack {
                
                Spacer()
                
                HStack {
                    //MARK: Navigation Bar
                    NavBarView(navigationState: $navigationState)
                        .colorMultiply(.secondary)
                        .font(.title)
                        .background(Color.white.shadow(radius: 2)) // Optional: Background and shadow for better visibility
                 
                    // here for displayy how to be
                }
              
            }
        }
    }
}

#Preview {
    MainView()
}



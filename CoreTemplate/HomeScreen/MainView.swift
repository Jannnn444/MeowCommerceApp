//
//  ContentView.swift
//  CoreTemplate
//
//  Created by Janus on 2024/4/29.
//

import SwiftUI

struct MainView: View {
    
    @State private var navigationState: NavState = .Shop
    @State var number: String = ""
    // any changes made to number within ExploreView will reflect back in MainView.
    // @State and @Binding are correctly used to handle data flow between MainView and ExploreView.
    // This setup allows ExploreView to modify number which then updates MainView dynamically.
    
    var body: some View {
        ZStack {
            ScrollView {
                HStack {
                    
                    switch navigationState {
                    case .Shop:
                        ShopView()
                    case .Explore:
                        ExploreCategoriesView()
                    case .Cart:
                        CartView()
                    case .Account:
                        Text("Acocunt")
                    
                    }
                }
                .padding(.bottom, 10)  //60
            }
            VStack {
                
                Spacer()
                
                HStack {
                    //MARK: Navigation Bar
                    NavBarView(navigationState: $navigationState)
                        .colorMultiply(.secondary)
                        .font(.title)
                        .background(Color.white.shadow(radius: 2)) // Optional: Background and shadow for better visibility
                        .cornerRadius(20)
                 
                }
            }
        }
    }
}


#Preview {
    MainView()
}



//
//  NavigationView.swift
//  CoreTemplate
//
//  Created by Hualiteq International on 2024/6/30.
//

import SwiftUI

struct NavView: View {
    
    @Binding var navigationState: NavState
    
    var body: some View {
        
        HStack {
            // MARK: Button - Shop
            
                Button {
                    navigationState = .Shop
                } label: {
                    VStack {
                     Image(systemName: "storefront")
                     Text("Shop")
                            .font(.custom("BrandonGrotesque-Medium", size: 12))
                }
                    .padding()
            }
           
            // MARK: Button - Explore
   
                Button {
                    navigationState = .Explore
                } label: {
                    VStack {
                    Image(systemName: "doc.text.magnifyingglass")
                    Text("Explore")
                            .font(.custom("BrandonGrotesque-Medium", size: 12))
                }
                    .padding()
            }
           
            // MARK: Button - Favourite

                Button {
                    navigationState = .Favourite
                } label: {
                    VStack {
                    Image(systemName: "heart")
                    Text("Favourite")
                            .font(.custom("BrandonGrotesque-Medium", size: 12))
                }
                    .padding()
            }
            
            // MARK: Button - Account

                Button {
                    navigationState = .Account
                } label: {
                    VStack {
                    Image(systemName: "person")
                    Text("Account")
                            .font(.custom("BrandonGrotesque-Medium", size: 12))
                }
                    .padding()
            }
            
        }
    }
}

// TODO: Changed into Looping

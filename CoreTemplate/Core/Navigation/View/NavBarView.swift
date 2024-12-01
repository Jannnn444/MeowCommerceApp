//
//  NavigationView.swift
//  CoreTemplate
//
//  Created by Hualiteq International on 2024/6/30.
//

import SwiftUI

struct NavBarView: View {
    
    @Binding var navigationState: NavState
    
    var body: some View {
        
        //MARK: 4 Tabs- Shop, Explore, Favorites, Account
        HStack {
            // MARK: Button - Shop
                
            Button {
                navigationState = .Shop
            } label: {
                VStack {
                    Image(systemName: "storefront")
                        .frame(width: 50, height: 40)
                    Text("Shop")
                        .font(.custom("BrandonGrotesque-Medium", size: 10))
                        .padding(.top, -5)
                }
            }
            .padding()
            // MARK: Button - Explore
            
            Button {
                navigationState = .Explore
            } label: {
                VStack {
                    Image(systemName: "doc.text.magnifyingglass")
                        .frame(width: 50, height: 40)
                    Text("Explore")
                        .font(.custom("BrandonGrotesque-Medium", size: 10))
                        .padding(.top, -5)
                }
            }
            .padding()
            
            // MARK: Button - Favourite
            /* Button {
                navigationState = .Favourite
            } label: {
                VStack {
                    Image(systemName: "heart")
                        .frame(width: 50, height: 40)
                    Text("Favourite")
                        .font(.custom("BrandonGrotesque-Medium", size: 10))
                        .padding(.top, -5)
                }
            }
            .padding()
             */
            
            // MARK: Button - Cart
            Button {
                navigationState = .Cart
            } label: {
                VStack {
                    Image(systemName: "cart")
                        .frame(width: 50, height: 40)
                    Text("My Cart")
                        .font(.custom("BrandonGrotesque-Medium", size: 10))
                        .padding(.top, -5)
                }
            }
            .padding()
            
            // MARK: Button - Account
            Button {
                navigationState = .Account
            } label: {
                VStack {
                    Image(systemName: "person")
                        .frame(width: 50, height: 40)
                    Text("Account")
                        .font(.custom("BrandonGrotesque-Medium", size: 10))
                        .padding(.top, -5)
                }
            }
            .padding()
        }
//        .padding(.horizontal)
    }
}


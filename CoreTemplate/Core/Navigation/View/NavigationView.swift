//
//  NavigationView.swift
//  CoreTemplate
//
//  Created by Hualiteq International on 2024/6/30.
//

import SwiftUI

struct NavigationView: View {
    
    @Binding var navigationState: NavigationState
    
    var body: some View {
        HStack {
            // MARK: Button - Shop
            Button {
                navigationState = .Shop
            } label: {
                 Image(systemName: "")
            }
            // MARK: Button - Explore
            Button {
                navigationState = .Explore
            } label: {
                 
            }
            // MARK: Button - Favourite
            Button {
                navigationState = .Favourite
            } label: {
                 
            }
            // MARK: Button - Account
            Button {
                navigationState = .Account
            } label: {
                 
            }
        }
    }
}

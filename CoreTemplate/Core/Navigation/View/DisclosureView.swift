//
//  DisclosureView.swift
//  CoreTemplate
//
//  Created by Hualiteq International on 2024/7/6.
//

import Foundation
import SwiftUI

struct DisclosureView: View {
    
    @State private var isExpanded: Bool = false
    @State private var selectedItem: String = "Product Detail"
    let items = ["Dug Food", "Car Teaser", "Orcas Favorite"]

    var body: some View {
        VStack {
            DisclosureGroup(
                isExpanded: $isExpanded) {
                    VStack {
                        ForEach(items, id: \.self) { item in
                                Text(item)
                                .font(.custom("BrandonGrotesque-Medium", size: 16))
                                .onTapGesture {
                                    selectedItem = item
                                    isExpanded = false
                                }
                        }
                    }
                } label: {
                    Text(selectedItem)
                        .foregroundStyle(.black)
                        .font(.custom("BrandonGrotesque-Medium", size: 16))
                }
                    .padding()
                    .background(Color(UIColor.systemGray6))
                    .cornerRadius(10)
                    .padding(.horizontal)
        }
    }
}

#Preview {
    DisclosureView()
}


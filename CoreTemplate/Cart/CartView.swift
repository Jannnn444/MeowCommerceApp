//
//  CartView.swift
//  CoreTemplate
//
//  Created by Hualiteq International on 2024/12/1.
//

import SwiftUI

struct CartView: View {
    @ObservedObject var viewModel = ProductViewModel()
    
    var body: some View {
        VStack {
            ScrollView {
                VStack {
                    Text("My Cart")
                        .font(.custom("BrandonGrotesque-Medium", size: 24))
                    
                    Rectangle()
                        .frame(width: 330, height: 5)
                        .cornerRadius(20)
                        .padding(.bottom, 10)
                    
                    ForEach(0..<3, id: \.self) { index in
                        ZStack {
                            HStack {
                                Rectangle()
                                    .frame(width: 300, height: 200)
                                    .foregroundColor(.darkkGray)
                                    .cornerRadius(20)
                            }
                            HStack {
                                Image(systemName: "star.fill")
                                    .foregroundColor(.gray)
                                    .font(.largeTitle)
                                Text("My Product in cart \(index + 1)")
                                    .font(.custom("BrandonGrotesque-Medium", size: 20))
                            }
                        }
                        .padding(.bottom, 5) // Add spacing between items
                    }
                }
                .frame(maxWidth: .infinity) // Center horizontally within the ScrollView
            }
        }
        .frame(maxWidth: .infinity, maxHeight: .infinity) // Center within the parent
        .background(Color.white.edgesIgnoringSafeArea(.all)) // Set background color if needed
    }
}

#Preview {
    CartView(viewModel: ProductViewModel())
}

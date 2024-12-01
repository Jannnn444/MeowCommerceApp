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
            Text("My Cart")
                .font(.custom("BrandonGrotesque-Medium", size: 24))
            
                Rectangle()
                    .frame(width: 330, height: 5)
                    .cornerRadius(20)
                    .padding(.bottom, 10)
                
                ForEach(0..<3, id: \.self) { index in
                    VStack {
                        ZStack {
                            HStack {
                                Rectangle()
                                    .frame(width: 330, height: 200)
                                    .foregroundColor(.darkkGray)
                                    .cornerRadius(20)
                            }
                            HStack {
                                Image(systemName: "star.fill")
                                    .foregroundColor(.lighttGray)
                                    .font(.largeTitle)
                                Text("My Product in cart 1")
                                    .font(.custom("BrandonGrotesque-Medium", size: 20))
                                
                            }
                        }
                    }
                    .padding(.bottom, 5) // Add spacing between items
                }
            }
        }
        .padding(.horizontal, viewModel.sideSpace)
        Spacer()
        
    }
}
#Preview {
    CartView(viewModel: ProductViewModel())
}

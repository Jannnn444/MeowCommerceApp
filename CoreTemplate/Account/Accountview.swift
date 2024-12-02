//
//  Accountview.swift
//  CoreTemplate
//
//  Created by Hualiteq International on 2024/12/2.
//

import SwiftUI

struct Accountview: View {
    var body: some View {
        VStack {
            ScrollView {
                Text("My Cart")
                    .font(.custom("BrandonGrotesque-Medium", size: 24))
                
                Rectangle()
                    .frame(width: 330, height: 5)
                    .cornerRadius(20)
                    .padding(.bottom, 10)
                
                HStack {
                ZStack {
                   
                        Rectangle()
                            .frame(width: 300, height: 200)
                            .foregroundColor(.lighttGray)
                            .cornerRadius(20)
                       
                        Rectangle()
                        .frame(width: 130, height: 150)
                        .foregroundColor(.secondary)
                        .cornerRadius(20)
                        .offset(x: 90)
                    
                        Image(systemName: "person.fill")
                        .resizable()
                        .aspectRatio(contentMode: .fit)
                        .frame(width: 100, height: 100)
                        .offset(x: 90)
                    }
                    .padding()
                }
                
            }
        }
    }
}

#Preview {
    Accountview()
}

//
//  BannerDesignView.swift
//  CoreTemplate
//
//  Created by Hualiteq International on 2024/5/13.
//

import SwiftUI

struct BannerView: View {
    

// static let gradientStart = Color(red: 239.0 / 255, green: 120.0 / 255, blue: 221.0 / 255)                 
// static let gradientEnd = Color(red: 239.0 / 255, green: 172.0 / 255, blue: 120.0 / 255)
    static let gradientStart = Color(.customGreen)
    static let gradientEnd = Color(.tiffanyBlue)
   
    
    
    var body: some View {
        VStack {
            ZStack {
                // MARK: Banner Design
                Rectangle()
                    .fill(LinearGradient(
                        gradient: .init(colors: [Self.gradientStart, Self.gradientEnd]), startPoint: .init(x: 0.5, y: 0), endPoint: .init(x: 0, y: 0.6)
                    ))
                    .foregroundColor(.customGreen)
                    .cornerRadius(10)
                    .frame(maxWidth: .infinity, maxHeight: 125)
                    Image("mainBanner")
                        .resizable()
                        .frame( height: 120)

                VStack {
                    Text("Canagan Dental")
                        .padding(.leading, 140)
                        .font(.system(size: 18, weight: .bold, design: .default))
                    Text("Get Up To 40% OFF")
                        .foregroundStyle(.white)
                        .padding(.leading, 140)
                        .font(.system(size: 13, weight: .bold, design: .default))
                        .padding(.top, 1)
                }
            }
        }

    }
}

#Preview {
    BannerView()
}

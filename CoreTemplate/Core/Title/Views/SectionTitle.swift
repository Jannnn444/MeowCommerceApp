//
//  SectionTitle.swift
//  CoreTemplate
//
//  Created by Hualiteq International on 2024/6/23.
//

import SwiftUI

struct SectionTitle: View {
    
    var title: String = "Section Title"
    
    func seeAll() {
        print("ssseee all")
    }
    
    var body: some View {
       
        
        HStack {
            Text(title)
                .font(.custom("BrandonGrotesque-Medium", size: 18))
       
            Spacer()
            
            Button(action: seeAll ) {
                Text("See all")
//                  .font(.system(size: 16, weight: .medium))
                    .font(.custom("BrandonGrotesque-Medium", size: 16))
                    .foregroundStyle(Color.carrot)
            }
        }
    }
}





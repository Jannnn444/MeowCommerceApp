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
                .font(.system(size: 24, weight: .medium))
            Spacer()
            
            Button(action: seeAll ) {
                Text("see all")
                    .font(.system(size: 16, weight: .medium))
                    .foregroundStyle(Color.carrot)
            }
        }
       
    }
    
    
}


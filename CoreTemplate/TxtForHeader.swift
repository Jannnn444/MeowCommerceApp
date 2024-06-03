//
//  TxtForHeader.swift
//  CoreTemplate
//
//  Created by Hualiteq International on 2024/5/13.
//

import SwiftUI

struct TxtForHeader: View {
    
    @State var headerText = ["Trending Now", "Browse Pet Type"]
    
    var body: some View {
        ForEach(0..<Int(headerText.count)) { index in
        VStack(alignment: .leading) {
            
                Text(headerText[index])
                .font(.system(size: 18, weight: .semibold))
                .foregroundStyle(.black)

            }
         
        }
       
    }
}

#Preview {
    TxtForHeader()
}

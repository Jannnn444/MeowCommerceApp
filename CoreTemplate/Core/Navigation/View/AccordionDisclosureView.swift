//
//  AccordionDisclosureView.swift
//  CoreTemplate
//
//  Created by Hualiteq International on 2024/7/6.
//

import Foundation
import SwiftUI

struct AccordionDisclosureView: View {
    
    var title: String
    
    var body: some View {
        VStack {
            DisclosureGroup("\(title)") {   //Product Detail
                VStack {
                    Text("This is the detail for the expanded detail views, in order to display more information of our pet app products and further more lines we needed...")
                        .font(.custom("BrandonGrotesque-Medium", size: 16))
                        .foregroundStyle(.black)
                }
            }
            .padding(.horizontal)
            .font(.custom("BrandonGrotesque-Medium", size: 16))
            .frame(minWidth: 364, maxHeight: 67)
            .foregroundStyle(.black)
            .background(Color(UIColor.white))
            .cornerRadius(10)
            .padding(.horizontal)
            
        }
    }
}
#Preview {
    AccordionDisclosureView(title: "This is title")
}

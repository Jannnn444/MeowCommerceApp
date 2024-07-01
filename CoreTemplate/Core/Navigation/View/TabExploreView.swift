//
//  TabExploreView.swift
//  CoreTemplate
//
//  Created by Hualiteq International on 2024/7/1.
//

import SwiftUI

struct TabExploreView: View {
    
    var title = "Symply Dog Adult Chicken \nwith Rice & Vegetables"
    var subtitle = "395g"
    @State var count = 0
    
    var body: some View {
        VStack(alignment: .leading, spacing: 10) {
            
            
            HStack {
                Image("product1")
            
            }
            
            HStack {
                Text("\(title)")
                    .font(.headline)
                    .multilineTextAlignment(.leading)
            }
            Text("\(subtitle)")
                .font(.subheadline)
                .foregroundColor(.gray)
            HStack(spacing: 5) {
                ForEach(0..<5) { _ in
                    Image(systemName: "star.fill")
                        .foregroundColor(.carrot)
                }
            }
            HStack {
                Button(action: {
                    
                    if count > 0 {
                        count -= 1
                    }
                }, label: {
                    Image(systemName: "minus")
                })
                
                
                TextField("Count", value: $count ,formatter: NumberFormatter())
                    .textFieldStyle(RoundedBorderTextFieldStyle())
                    .frame(width: 50)
                    .multilineTextAlignment(.center)
                Button(action: {
                    count += 1
                } , label: {
                    Image(systemName: "plus")
                })
            }
        }
        .padding()
    }
}

//#Preview {
//    TabExploreView()
//}

#Preview {
    MainView()
}



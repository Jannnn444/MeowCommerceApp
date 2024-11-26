//
//  SheetStarView.swift
//  CoreTemplate
//
//  Created by Hualiteq International on 2024/11/26.
//

import SwiftUI

struct SheetStarView: View {
    @Binding var rating: Double
    var maximumRating = 5
    var onColor = Color.yellow
    var offColor = Color.gray
    var body: some View {
        Text("Rate from 1 - 5 stars")
        HStack {
            ForEach(1..<maximumRating + 1, id: \.self) { index in
            Image(systemName: "star.fill")
                    .resizable()
                    .scaledToFit()
                    .frame(width: 40, height: 40)
                    .foregroundColor(index <= Int(rating) ? onColor : offColor)
                    .onTapGesture {
                        withAnimation {
                            rating = Double(index)
                        }
                    }
            }
        }
        .gesture(
        DragGesture()
            .onChanged { value in
             // lets calculate the width of each star and rate it according to the scroll movement
                let starwidth = 40.0
                let totalWidth = starwidth * Double(maximumRating)
                let newRating = Double(value.location.x / (totalWidth / Double(maximumRating)))
                
                rating = max(1.0, min(newRating, Double(maximumRating)))
            }
        )
        .font(.title)
    }
}


#Preview {
    SheetStarView()
}

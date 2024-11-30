//
//  SheetStarView.swift
//  CoreTemplate
//
//  Created by Hualiteq International on 2024/11/26.
//

import SwiftUI

struct SheetStarView: View {
    @State var examplecountRating = 0.0
    @Binding var rating: Double
    @ObservedObject var detailViewModel = DetailViewModel()
    var maximumRating = 5
    var onColor = Color.yellow
    var offColor = Color.gray
    @Binding var number: String
    
    @Environment(\.presentationMode) var presentationMode
    
    var body: some View {
        VStack{
            
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
            }.padding()
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
            
            Button {
                // MARK: - Product Post Action
                detailViewModel.postRating(number: self.number, payload: ProductRatingPayload.init(rating: rating))
                presentationMode.wrappedValue.dismiss()
            } label: {
                Text("Send!")
                    .padding()
                    .font(.custom("BrandonGrotesque-Medium", size: 14))
                    .frame(minWidth: 80, maxHeight: 30)
                    .background(.secondary)
                    .foregroundStyle(.blue)
                    .cornerRadius(15)
            }.padding()

        }
    }
}



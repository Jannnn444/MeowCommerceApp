//
//  TabExploreView.swift
//  CoreTemplate
//
//  Created by Hualiteq International on 2024/7/1.
//

import SwiftUI
import Combine

struct DetailView: View {
    
    // This view is the detail sheet of product when press button
    
    @State var count = 0
    @State var amountCounting = 0.00
    @State private var isExpandedforDetail: Bool = false
    @State private var isExpandedforComposition: Bool = false
    @Binding var number: Int
    @ObservedObject var detailViewModel = DetailViewModel()  //here subscribed the DetailViewModels()
    
    private var numberFormatter: NumberFormatter {
        let formatter = NumberFormatter()
        formatter.numberStyle = .decimal
        formatter.minimumFractionDigits = 1
        formatter.maximumFractionDigits = 2
        return formatter
    }
    
    var body: some View {
        VStack {
            
            ScrollView {
                
                ZStack{
                    Text(detailViewModel.pageName)
                        .font(.title)
                        .foregroundStyle(Color.black)
                }
                .padding(.bottom, -40)
                
                VStack(alignment: .leading, spacing: 10) {
                    // Refetch Test
//                    Button {
//                        detailViewModel.number = 2
//                    } label: {
//                        Text("Refetch")
//                    }
                    
                    HStack() {
                        
                        VStack(alignment: .leading) {
                            // MARK: Heart button
                            Button {
                                // Action here
                                print("Heart button pressed")
                            } label: {
                                Image(systemName: "heart.fill")
                                        .resizable()
                                        .frame(width: 24, height: 24)
                                }
                                .zIndex(1) // Ensure the button is on top
                                .padding(.leading, 250) // Adjust padding instead of offset
                        }
                        
                    }.padding()
                    
                    HStack {
                        Image("product1")
                            .padding(.top, -20)
                    }
                    
                    HStack {
                        
                        VStack(alignment: .leading) {
                            
                            // MARK: Product Title
                            Text(detailViewModel.detailProductsPosts?.title ?? "")
                                .font(.custom("BrandonGrotesque-Medium", size: 24))
                                .lineLimit(nil)
                                .frame(width: 250, height: 36, alignment: .leading)
                            
                            // MARK: Product Subtitle
                            Text(detailViewModel.detailProductsPosts?.subtitle ?? "")
                                .font(.custom("BrandonGrotesque-Medium", size: 20))
                                .lineLimit(nil)
                                .frame(width: 250, height: 36, alignment: .leading)
                            
                            // MARK: Weight
                            Text("\(detailViewModel.detailProductsPosts?.weight ?? 100)g")
                                .font(.custom("BrandonGrotesque-Medium", size: 15))
                                .foregroundStyle(Color.secondary)
                                .frame(width: 50, height: 10, alignment: .leading)
                            
                            Spacer()
                            
                        }
                        // MARK: Price
                        Text( "£ \(detailViewModel.detailProductsPosts?.price ?? 0 )")
                            .font(.custom("BrandonGrotesque-Medium", size: 15))
                            .bold()
                            .frame(width: 50, height: 36, alignment: .leading)
                            .padding(.bottom, 50)
                            .padding(.trailing, 5)
                    }
                    
                    HStack(spacing: 5) {
                        
                        // Unwrap rating before using
                        if let myRating = detailViewModel.detailProductsPosts?.rating {
                            Text("\(myRating)")
                            
                            ForEach(0..<myRating, id: \.self) { _ in
                                Image(systemName: "star.fill")
                                    .foregroundColor(.carrot)
                            }
                        }
                    }
                    HStack {
                        
                        // to put the spacer her make sure the unity wont change the title
                        // MARK: Minus Button
                        Button(action: {
                            if count > 0 {
                                count -= 1
                            } 
                        }, label: {
                            Image(systemName: "minus")
                        })
                        
                        // MARK: Count Field
                        TextField("Count", value: $count ,formatter: NumberFormatter())
                            .textFieldStyle(RoundedBorderTextFieldStyle())
                            .frame(width: 50)
                            .multilineTextAlignment(.center)
                            .disabled(true)
                        
                        // MARK: Plus Button
                        Button(action: {
                            count += 1
                        } , label: {
                            Image(systemName: "plus")
                        })
                        
                        // MARK: AmountCount Field
                        TextField("Amount$", value: $amountCounting ,formatter: numberFormatter)    //NumberFormatter()
                            .frame(width: 100)
                            .multilineTextAlignment(.center)
                            .padding(.leading, 100)
                            .background(Color.clear)
                            .border(Color.clear)
                            .disabled(true)
                     
                    }
                    .padding(.bottom, 5)
                    
                }
                HStack {
                    
                    Text("Repeated Order")
                        .font(.custom("BrandonGrotesque-Medium", size: 16))
                        .foregroundStyle(.black)
                    
                    Spacer()
                    HStack {
                        
                        //MARK: Calculate Button
                        
                        Button {
                            amountCounting = Double(count * (detailViewModel.detailProductsPosts?.price ?? 1 ))
                        } label: {
                            Text("Calculate")
                                .font(.custom("BrandonGrotesque-Medium", size: 16))
                                .frame(minWidth: 100   , maxHeight: 45)
                                .foregroundStyle(.carrot)
                        }
                        Button {
                            amountCounting = Double(0.0)
                        } label: {
                            Text("No Thanks")
                                .font(.custom("BrandonGrotesque-Medium", size: 14))
                                .frame(minWidth: 100   , maxHeight: 45)
                                .foregroundStyle(.carrot)
                                .background(Color(UIColor.white))
                                .cornerRadius(10)
                            
                                .overlay(
                                    RoundedRectangle(cornerRadius: 15)
                                        .stroke(Color.secondary, lineWidth: 0.5) // Adjust lineWidth as needed
                                )
                        }
                    }
                }
                .padding(.horizontal)
                .padding(.horizontal)
                
                Divider()
                    .padding(.horizontal)
                
                // MARK: DetailText Intro
                
                DisclosureGroup(isExpanded: $isExpandedforDetail) {
                    Text(detailViewModel.detailProductsPosts?.detail ?? "")
                        .font(.custom("BrandonGrotesque-Medium", size: 12))
                        .lineLimit(nil)
                    
                } label: {
                    Text("Product Detail")
                        .font(.custom("BrandonGrotesque-Medium", size: 16))
                        .foregroundColor(.black)
                }
                
                .padding(.horizontal)
                .padding(.horizontal)
                
                
                Divider()
                    .padding(.horizontal)
                
                
                // MARK: Composition Intro
                DisclosureGroup(isExpanded: $isExpandedforComposition) {
                    Text("This is our Top \(detailViewModel.detailProductsPosts?.id ?? 1) sellers! Totally \(detailViewModel.detailProductsPosts?.weight ?? 1)g. What a good deal! ")
                        .font(.custom("BrandonGrotesque-Medium", size: 12))
                        .lineLimit(nil)
                        .frame(width: 260, height: 30, alignment: .leading)
                        .padding(.trailing, 70)
                } label: {
                    Text("Compositon")
                        .font(.custom("BrandonGrotesque-Medium", size: 16))
                        .foregroundColor(.black)
                }
                .padding(.horizontal)
                .padding(.horizontal)
                
                Divider()
                    .padding(.horizontal)
                Spacer()
                
                
                HStack {
                    Button {
                        print("Added your product to cart")
                    } label: {
                        Text("ADD TO CART")
                            .padding()
                            .font(.custom("BrandonGrotesque-Medium", size: 16))
                            .frame(minWidth: 300, maxHeight: 40)
                            .foregroundStyle(.white)
                            .background(Color(UIColor.black))
                            .cornerRadius(15)
                    }
                }
            }
        }.onAppear() {
            detailViewModel.getDetailPosts(number: self.number) //reload the api post
        }
    }
}
//
#Preview {
    DetailView(number: .constant(1))
}

//#Preview {
//    MainView()
//}
//
//

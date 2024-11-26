//
//  TabExploreView.swift
//  CoreTemplate
//
//  Created by Hualiteq International on 2024/7/1.
//

import SwiftUI
//import Combine

struct DetailView: View {
    
    // This view is the detail sheet of product when press button
    
    @State var  currentRating  = 0.0
    @State var isShowingSheet: Bool = false
    @State var count = 0
    @State var amountCounting = 0.00
    @State private var isExpandedforDetail: Bool = false
    @State private var isExpandedforComposition: Bool = false
    @Binding var number: String
    @ObservedObject var detailViewModel = DetailViewModel()  //here subscribed the DetailViewModels()
    
    // 1. a) Define a new type that mirrors your data, expect change Ratings Int -> [Int]
    struct DetailProductRender: Codable, Hashable, Identifiable {
        
        let id: String
        let title: String
        let subtitle: String
        let image_url: String
        let price: Int
        let rating: [Int]    // -> new type
        let weight: Int
        let detail: String?
        
    }
    // 1. b) Define the state that will held this new data type for UI to render
    @State var myDetailPostList: [DetailProductRender] = []
    
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
                VStack() {
                    
// MARK: - HEART BUTTOH
                    HStack() {
                        Spacer()
                        Button {
                            print("Heart button pressed")
                        } label: {
                            Image(systemName: "heart.fill")
                                .resizable()
                                .frame(width: 24, height: 24)
                        }
                    }
                    .padding()
                    
  // MARK: - ABOVE PART
                    
                    HStack {
                        Image("product1")
                            .padding(.top, -20)
                    }
                    
                    HStack {
                        VStack(alignment: .leading) {
                            
                            HStack {
                                // MARK: Product Title
                                Text(detailViewModel.detailProduct?.title ?? "")
                                    .font(.custom("BrandonGrotesque-Medium", size: 24))
                                    .lineLimit(nil)
                                    .frame(width: 250, height: 40, alignment: .leading)
                                // MARK: Price
                                Text( "£ \(detailViewModel.detailProductsPosts?.price ?? 0 )")
                                    .font(.custom("BrandonGrotesque-Medium", size: 15))
                                    .bold()
                                    .frame(width: 50, height: 20, alignment: .leading)
                            }
                            
                            // MARK: Product Subtitle
                            Text(detailViewModel.detailProduct?.subtitle ?? "")
                                .font(.custom("BrandonGrotesque-Medium", size: 20))
                                .lineLimit(nil)
                                .frame(width: 250, height: 40, alignment: .leading)
                            
                            // MARK: Weight
                            Text("\(detailViewModel.detailProduct?.weight ?? 100)g")
                                .font(.custom("BrandonGrotesque-Medium", size: 15))
                                .foregroundStyle(Color.secondary)
                                .frame(width: 50, height: 10, alignment: .leading)
                           
                            
                            // MARK: Star Rating
                            HStack{
                                    if let ratios = detailViewModel.detailProductsPosts?.rating, !ratios.isEmpty {
                                        ForEach(detailViewModel.detailProductsPosts?.rating ?? [] , id: \.self) { star in
                                            if (star == 0) {
                                                Image(systemName: "star.fill")
                                                    .foregroundColor(.yellow)
                                            } else if star == 1 {
                                                Image(systemName: "star.lefthalf.fill")
                                                    .foregroundColor(.yellow)
                                            }
                                        }
                                    } else {
                                        // where we handle the case there're no ratings
                                        Text("No rating yet, please leave your review!")
                                            .foregroundStyle(.secondary)
                                            .font(.footnote)
                                            .frame(width: 250, height: 20, alignment: .leading)
                                    }
                                }.padding(.top, 5)
                         
                            
                                 ZStack {
                                 // MARK: RATE ME BUTTON
                                 Button {
                                    print("Leave me new rating!")
                                     isShowingSheet.toggle()
                                 } label: {
                                     RateByAButtonView()
                                 }
                                 .sheet(isPresented: $isShowingSheet) {
                                     SheetStarView(rating: $currentRating)
                                 }
                             }.padding(.top, 5)
                        }
                    }
                    
// MARK: - BELOW PART
                    HStack {
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
                            .foregroundColor(.secondary)
                            .background(Color.clear)
                            .border(Color.clear)
                            .disabled(true)
                    }.padding(.top, 5)
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
                    Text(detailViewModel.detailProduct?.subtitle ?? "")
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
                    Text("This is our Top \(detailViewModel.detailProduct?.price ?? 1) sellers! Totally \(detailViewModel.detailProduct?.weight ?? 1)g. What a good deal! ")
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
            detailViewModel.getDetailPostsOriginal(number: self.number)   // load the api post for original code
            detailViewModel.getDetailPosts(number: self.number) // load the func with transform the star array
        }
    }
}

#Preview {
    DetailView(number: .constant("0"))
}


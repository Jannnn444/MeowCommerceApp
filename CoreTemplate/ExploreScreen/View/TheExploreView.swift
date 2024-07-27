//
//  TabExploreView.swift
//  CoreTemplate
//
//  Created by Hualiteq International on 2024/7/1.
//

import SwiftUI
import Combine

struct TheExploreView: View {
    
    @ObservedObject var viewModel = ExploreViewModels()
    @State var count = 0
    
 //   var title = "Symply Dog Adult Chicken \nwith Rice & Vegetables"
    var subtitle = "395g"

    
    var body: some View {
        VStack {
            VStack(alignment: .leading, spacing: 10) {
                
                HStack() {
                    VStack(alignment: .leading) {
                        Image(systemName: "heart")
                            .resizable()
                            .frame(width: 24, height: 24)
                            .offset(x: 270.0)
                        
                    }
                    
                }.padding()
                
                HStack {
                    Image("product1")
                    
                }
                
                // this loop thru all the list
                HStack() {
                    VStack {
                        VStack(alignment: .leading) {
                            Text(viewModel.detailProductsPosts?.title ?? "").font(.custom("BrandonGrotesque-Medium", size: 14))
                                .lineLimit(nil)
                                .frame(width: 150, height: 36)
                            Text(viewModel.detailProductsPosts?.subtitle ?? "").font(.custom("BrandonGrotesque-Medium", size: 14))
                                .lineLimit(nil)
                                .frame(width: 150, height: 36)
                        }
                    
                }
            }
                                
                // this loop thru the first item
//                if let firstPost = viewModel.detailProductsPosts[0] {
//                    HStack {
//                        VStack(alignment: .leading) {
//                            Text(firstPost.title)
//                                .font(.custom("BrandonGrotesque-Medium", size: 24))
//                                .lineLimit(nil)
//                                .frame(width: 200, height: 36)
////                            Text(firstPost.subtitle)
////                                .font(.custom("BrandonGrotesque-Medium", size: 14))
////                                .lineLimit(nil)
////                                .frame(width: 200, height: 36)
//                            
//                        }
//                    }
//                } else {
//                    Text("Loading...")
//                }
                
                //                Text("\(subtitle)")
                //                    .font(.subheadline)
                //                    .foregroundColor(.gray)
                
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
                .padding(.bottom, 5)
                
            }
            HStack {
                
                Text("Repeated Order")
                    .font(.custom("BrandonGrotesque-Medium", size: 16))
                    .foregroundStyle(.black)

                    Spacer()
                    HStack {
                    
                        Button {
                            //action
                        } label: {
                            Text("Calculate")
                                .font(.custom("BrandonGrotesque-Medium", size: 16))
                                .frame(minWidth: 100   , maxHeight: 45)
                                .foregroundStyle(.carrot)
                        }
                        Button {
                            //action
                        } label: {
                            Text("No Thanks")
                                .font(.custom("BrandonGrotesque-Medium", size: 14))
                                .frame(minWidth: 100   , maxHeight: 45)
                                .foregroundStyle(.carrot)
                                .background(Color(UIColor.white))
                                .cornerRadius(10)
                            //                                .padding(.horizontal)
                                .overlay(
                                    RoundedRectangle(cornerRadius: 15)
                                        .stroke(Color.secondary, lineWidth: 0.5) // Adjust lineWidth as needed
                                )
                    }
                }
      
//                    .padding(.leading)

            }
            .padding(.horizontal)
            .padding(.horizontal)
            
            Divider()
                .padding(.horizontal)
            AccordionDisclosureView(title: "Product Detail")
            Divider()
                .padding(.horizontal)
            AccordionDisclosureView(title: "Compositon")
            Divider()
                .padding(.horizontal)
            Spacer()
            
            Button {
                
            } label: {
                Text("ADD TO CART")
                    .padding()
                    .font(.custom("BrandonGrotesque-Medium", size: 16))
                    .frame(minWidth: 364, maxHeight: 67)
                    .foregroundStyle(.white)
                    .background(Color(UIColor.black))
                    .cornerRadius(10)
                    .padding(.horizontal)
            }
        }
       
    }
}
//
//#Preview {
//    TheExploreView()
//}
//
//#Preview {
//    MainView()
//}
//
//

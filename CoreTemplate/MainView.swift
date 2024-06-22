//
//  ContentView.swift
//  CoreTemplate
//
//  Created by Janus on 2024/4/29.
//

import SwiftUI

struct MainView: View {
    
    @State var searchText = ""
    private var sideSpace: CGFloat = 25
    
    var body: some View {
        
        //MARK: App Wrapper
        VStack {
            //MARK: Search & BAnner Wrapper
            VStack {
                
                HStack {
                    
                    //MARK: Search
                    Image("doggoIcon")
                       
                     ZStack{
                         HStack {
                             Image("Vector")
        //                      .padding(.horizontal, 8)
                             TextField("Search Product or Brand", text: $searchText)
                         }
                       
                         .frame(maxWidth: .infinity, maxHeight: 52)
                         .background(Color.LighttGray)
                         .cornerRadius(10)
                        
                         .foregroundStyle(Color.DarkkGray)
                         .font(.system(size: 14, weight: .medium))

                    }
                
            }
                //MARK: Banner
                BannerDesignView()
                    .padding(.top, 20)
                    .padding(.bottom, 20)
                
       
            }
            .padding(.trailing, sideSpace)
           
            
            //MARK: List -- "Trending Items"

            SectionTitle(title: "Trending Now").padding(.trailing, sideSpace)
                    TrendingScrollView()
                .padding(.bottom, 10)
                    
            
            //MARK: List -- "Browse Pet Types"
            SectionTitle(title: "Trending Now").padding(.trailing, sideSpace)
                    BrowswPetTypeCategory()
                
           
    
            
        }
        
            .padding(.leading, sideSpace)
     
            Spacer()
    }
       
    
}

#Preview {
    MainView()
}






 /* TODO:
  
  1. The trending Scroll View The secondary didnt aligned
  2. The List Header didnt show the second section: Browse pet types
  3. Add the button at the right side of list: See all
  4. To let the button on the right & maintain the vertical list, need to usevstack first, then hstack.
  5. Input Fonts (customized)
             
  */

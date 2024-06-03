//
//  ContentView.swift
//  CoreTemplate
//
//  Created by Janus on 2024/4/29.
//

import SwiftUI

struct MainView: View {
    
    @State var searchText = ""
    
    var body: some View {
        
        VStack {
            HStack {
                Image("doggoIcon")
                    .padding(.trailing, 20)
                 ZStack{
                     HStack {
                         Image("Vector")
                             .padding(.horizontal, 8)
                         TextField("Search Product or Brand", text: $searchText)
                     }
                     .padding(18)
                     .frame(width: .infinity, height: 52)
                     .background(Color.LighttGray)
                     .cornerRadius(10)
                    
                     .foregroundStyle(Color.DarkkGray)
                     .font(.system(size: 14, weight: .medium))
                     
                    
                }
            }
            .padding()
            
            BannerDesignView()
            
            List {
                Section(header: Text("Trending Items"))  {
                    TrendingScrollView()
                        .listRowSeparator(.hidden)
                        .padding(.top, -30)
                        .padding(.bottom, -20)
                }
                Section(header: Text("Browse Pet Types")) {
                    BrowswPetTypeCategory()
                        .listRowSeparator(.hidden)
                        .padding(.top, -10)
                        .padding(.bottom, -20)
                }
                
            }
            .listStyle(.plain)
            
            .navigationTitle("Main View")
            
          
           /* TODO:
            
            1. The trending Scroll View The secondary didnt aligned
            2. The List Header didnt show the second section: Browse pet types
            3. Add the button at the right side of list: See all
            4. To let the button on the right & maintain the vertical list, need to usevstack first, then hstack.
            5. Input Fonts (customized)
                       
            */
            
        }
        
        Spacer()
    }
    
}

#Preview {
    MainView()
}






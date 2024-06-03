//
//  DataViewModel.swift
//  CoreTemplate
//
//  Created by Janus on 2024/4/29.
//

import Foundation

final class DataViewModel: ObservableObject {
    @Published var postList: [Post]?
    
    init() {
        // fetch the api
        fetchData()
    }
    
    func fetchData() {
        let endpoint = "/posts"
        
        
    }
    
}

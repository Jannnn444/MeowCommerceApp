//
//  Post.swift
//  CoreTemplate
//
//  Created by Janus on 2024/4/29.
//


// Data Structure to map from JSON
// Example data is an array of objects that look like this:
//      {
//      "userId": 1,
//      "id": 1,
//      "title": "sunt aut facere repellat provident occaecati excepturi optio reprehenderit",
//      "body": "quia et suscipit\nsuscipit recusandae consequuntur expedita et cum\nreprehenderit molestiae ut ut quas                         totam\nnostrum rerum est autem sunt rem eveniet architecto"
//      }
struct Post: Identifiable, Codable {
    var userId: Int
    var id: Int
    var title: String
    var body: String
}

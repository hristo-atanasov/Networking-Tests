//
//  PostsEndpoints.swift
//  Networking Tests
//
//  Created by Hristo Atanasov on 3.01.25.
//

import Foundation

final class PostsEndpoints {
    
    static let shared = PostsEndpoints()
    
    private init() {}
    
    static let postsList: String = "https://jsonplaceholder.typicode.com/posts/" // Returns a list of posts
    static let postById: String = "https://jsonplaceholder.typicode.com/posts/" // Get post by id. Needs to be concatinated with postId at the end
    
}

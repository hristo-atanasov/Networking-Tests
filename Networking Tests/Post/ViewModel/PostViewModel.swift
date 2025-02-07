//
//  PostViewModel.swift
//  Networking Tests
//
//  Created by Hristo Atanasov on 3.01.25.
//

import Foundation

class PostViewModel: ObservableObject {
    @Published var post: Post?
    @Published var error: String?
    
    @MainActor
    func getPostById(postId: Int) async {
        let networkService = NetworkService()
        let url = PostsEndpoints.postById.appending("\(postId)")
        
        let headers = [
            "Accept": "application/json",
        ]
        
        do {
            self.post = try await networkService.fetch(from: url, as: Post.self, headers: headers)
            print("Fetched Post:\n\(self.post!)")
        } catch {
            self.error = error.localizedDescription
            print("Error: \(error.localizedDescription)")
        }
    }
}

//
//  PostsListViewModel.swift
//  Networking Tests
//
//  Created by Hristo Atanasov on 6.01.25.
//

import Foundation

class PostsListViewModel: ObservableObject {
    @Published var postsList: [PostsList] = []
    @Published var error: String?
    
    @MainActor
    func getPostsList() async {
        let networkService = NetworkService()
        let url = PostsEndpoints.postsList
        
        let headers = [
            "Accept": "application/json",
        ]
        
        do {
            self.postsList = try await networkService.fetch(from: url, as: [PostsList].self, headers: headers)
            print("Fetched Posts:\n\(self.postsList)")
        } catch {
            self.error = error.localizedDescription
            print("Error: \(error.localizedDescription)")
        }
    }
}

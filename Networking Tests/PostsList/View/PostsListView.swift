//
//  PostsListView.swift
//  Networking Tests
//
//  Created by Hristo Atanasov on 6.01.25.
//

import SwiftUI

struct PostsListView: View {
    @StateObject private var vm = PostsListViewModel()
    
    var body: some View {
        NavigationStack {
            List(vm.postsList){ post in
                
                NavigationLink(value: post){
                    Text(post.title)
                        .fontWeight(.semibold)
                }
                
            }
            .navigationDestination(for: PostsList.self, destination: { post in
                PostView(postId: post.id)
            })
            .navigationTitle("Posts")
        }
        .task {
            await self.vm.getPostsList()
        }
        .overlay{
            if let error = vm.error {
                Text(error)
            }
        }
        
    }
}

#Preview {
    PostsListView()
}

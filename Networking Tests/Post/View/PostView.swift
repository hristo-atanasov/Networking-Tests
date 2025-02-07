//
//  PostView.swift
//  Networking Tests
//
//  Created by Hristo Atanasov on 6.01.25.
//

import SwiftUI

struct PostView: View {
    @StateObject private var postViewModel = PostViewModel()
    let postId: Int
    
    var body: some View {
            VStack(alignment: .leading) {
                
                if let error = postViewModel.error {
                    HStack(alignment: .center){
                        Text(error)
                            .foregroundStyle(.black)
                            .font(.headline)
                            .background(Color.red)
                    }
                    .frame(maxWidth: .infinity)
                }
                
                ScrollView {
                    
                    if let post = postViewModel.post {
                        Text(post.title)
                            .foregroundStyle(.black)
                            .font(.headline)
                            .padding(.bottom, 10)
                        Text(post.body)
                            .foregroundStyle(.black)
                            .font(.body)
                    }
                }
            }
            .padding()
            .task {
                await self.postViewModel.getPostById(postId: self.postId)
            }
        
        
    }
}

#Preview {
    PostView(postId: 1)
}

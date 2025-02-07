//
//  PostsModel.swift
//  Networking Tests
//
//  Created by Hristo Atanasov on 6.01.25.
//

import Foundation

struct PostsList: Decodable, Identifiable, Hashable {
    let id: Int
    let title: String
}

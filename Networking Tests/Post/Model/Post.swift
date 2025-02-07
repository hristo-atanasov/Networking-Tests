//
//  Post.swift
//  Networking Tests
//
//  Created by Hristo Atanasov on 3.01.25.
//
import Foundation

struct Post: Decodable, Identifiable {
    let userId: Int
    let id: Int
    let title: String
    let body: String
}

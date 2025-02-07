//
//  NetworkError.swift
//  Networking Tests
//
//  Created by Hristo Atanasov on 6.01.25.
//

import Foundation

enum NetworkError: LocalizedError {
    case requestFailed(description: String)
    case httpError(statusCode: Int)
    case decodingFailed(Error)
    case invalidURL
    case unknownError(error: Error)
    
    var errorDescription: String? {
        switch self {
        case .requestFailed(let description):
            return "Request failed: \(description)"
        case .invalidURL:
            return "Invalid URL."
        case .httpError(let statusCode):
            return "The request failed with HTTP status code \(statusCode)."
        case .decodingFailed(let error):
            return "Failed to decode the response: \(error.localizedDescription)"
        case .unknownError(let error):
            return "An unknown error occured: \(error.localizedDescription)"
        }
    }
}

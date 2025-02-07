//
//  NetworkService.swift
//  Networking Tests
//
//  Created by Hristo Atanasov on 3.01.25.
//

import Foundation

final class NetworkService {
    /// Makes a GET request to the passed URL and decodes the response into the specified type.
    /// TODO: Add HTTPHeaderField and  request type.
    func fetch<T: Decodable>(from url: String, as responseType: T.Type, headers: [String:String] = [:], httpMethod: String = "GET") async throws -> T {
        
        // Try to create URL from string
        guard let url = URL(string: url) else {
            throw NetworkError.invalidURL
        }
        
        var request = URLRequest(url: url)
        
        request.httpMethod = httpMethod
        
        // Add the HTTPHeaders to the request if any
        if !headers.isEmpty {
            request.allHTTPHeaderFields = headers
        }
        
        // Perform the network request
        let (data, response) = try await URLSession.shared.data(for: request)
        
        // Validate the HTTP response
        guard let httpResponse = response as? HTTPURLResponse else {
            throw NetworkError.requestFailed(description: "Request failed")
        }
        
        guard httpResponse.statusCode == 200 else {
            throw NetworkError.httpError(statusCode: httpResponse.statusCode)
        }
        
        // Try to decode the data into the specified type
        do {
            let decoder = JSONDecoder()
            // Many APIs are using snake case so we can try to convert to camel case
            decoder.keyDecodingStrategy = .convertFromSnakeCase
            return try decoder.decode(T.self, from: data)
        } catch {
            print("Debug: Error decoding JSON: \(error)")
            throw NetworkError.decodingFailed(error)
        }
    }
}

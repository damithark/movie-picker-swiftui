//
//  Endpoint.swift
//  GenericAPILayer
//
//  Created by Damitha Raveendra on 2024-02-21.
//

import Foundation

enum Endpoint {
    
    // GET
    case getTrendingMovies(url: String = "/3/trending/movie/week")
    case searchMovies(url: String = "/3/search/movie")
    
    
    var request: URLRequest? {
        guard let url = self.url else { return nil }
        var request = URLRequest(url: url)
        request.httpMethod = self.httpMethod
        request.httpBody = self.httpBody
        request.addValues(for: self)
        return request
    }
    
    private var url: URL? {
        var components = URLComponents()
        components.scheme = Constants.scheme
        components.host = Constants.baseURL
        components.port = Constants.port
        components.path = self.path
        components.queryItems = self.queryItems
        return components.url
    }
    
    private var path: String {
        switch self {
        case .getTrendingMovies(let url): return url
        case .searchMovies(let url): return url
        }
    }
    
    
    private var queryItems: [URLQueryItem] {
        switch self {
        case .getTrendingMovies:
            return []
        case .searchMovies:
            return [URLQueryItem(name: "query", value: "avengers"), URLQueryItem(name: "language", value: "en-US")]
        }
    }
    
    
    private var httpMethod: String {
        switch self {
        case .getTrendingMovies:
            return HTTP.Method.get.rawValue
        case .searchMovies:
            return HTTP.Method.get.rawValue
        }
    }
    
    private var httpBody: Data? {
        switch self {
        case .getTrendingMovies:
            return nil
        case .searchMovies:
            return nil
        }
    }
}

extension URLRequest {
    mutating func addValues(for endpoint: Endpoint) {
        switch endpoint {
        case .getTrendingMovies, .searchMovies:
            self.setValue(
                HTTP.Headers.Value.applicationJson.rawValue,
                forHTTPHeaderField: HTTP.Headers.Key.contentType.rawValue
            )
            self.setValue(
                HTTP.Headers.Value.bearerToken.rawValue,
                forHTTPHeaderField: HTTP.Headers.Key.authorization.rawValue
            )
        }
    }
}

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
    
    
    var request: URLRequest? {
        guard let url = self.url else { return nil }
        var request = URLRequest(url: url)
        request.httpMethod = self.httpMethod
        request.httpBody = self.httpBody
//        request.addValue("Bearer eyJhbGciOiJIUzI1NiJ9.eyJhdWQiOiI4ZWFlYjZhMmZlMDJjNjIyY2EzMDAwZTgyZjcyZDQwNyIsInN1YiI6IjY1ZTA3Yzg3ZGFmNTdjMDE4NTljMTM3YiIsInNjb3BlcyI6WyJhcGlfcmVhZCJdLCJ2ZXJzaW9uIjoxfQ.KcSqfF-i1rot9G0XySJEV5htHBx4WIf261BtGShq_Jk", forHTTPHeaderField: "Authorization")
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
        }
    }
    
    
    private var queryItems: [URLQueryItem] {
        switch self {
            default: return []
        }
    }
    
    
    private var httpMethod: String {
        switch self {
        case .getTrendingMovies:
            return HTTP.Method.get.rawValue
        }
    }
    
    private var httpBody: Data? {
        switch self {
        case .getTrendingMovies:
            return nil
        }
    }
}

extension URLRequest {
    mutating func addValues(for endpoint: Endpoint) {
        switch endpoint {
        case .getTrendingMovies:
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

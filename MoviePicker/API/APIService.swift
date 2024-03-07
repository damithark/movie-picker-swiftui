//
//  APIService.swift
//  MoviePicker
//
//  Created by Damitha Raveendra on 2024-03-04.
//

import Foundation
  
enum APIError: Error {
    case urlSessionError(String)
    case serverError(String = "Invalid API Key")
    case invalidResponse(String = "Invalid response from server.")
    case decodingError(String = "Error parsing server response.")
}

protocol Service {
    func makeRequest<T: Codable>(with request: URLRequest, responseModel: T.Type,
                                 completion: @escaping(T?, APIError?) -> Void)
}

class APIService: Service {
    
    func makeRequest<T: Codable>(with request: URLRequest, responseModel: T.Type, completion: @escaping(T?, APIError?) -> Void) {
        
        let task = URLSession.shared.dataTask(with: request) { data, response, error in
            if let error = error {
                completion(nil, .urlSessionError(error.localizedDescription))
                print("DEBUG PRINT: ", error)
                return
            }
            
            if let response = response as? HTTPURLResponse, response.statusCode > 202 {
                completion(nil, .serverError())
                print("Server Error: ", response.statusCode)
                return
            }
            
            guard let data = data else {
                completion(nil, .invalidResponse())
                print("DEBUG PRINT: Invalid Response")
                return
            }
            
            do {
                let result = try JSONDecoder().decode(T.self, from: data)
                completion(result, nil)
                
            } catch let error {
                print(error)
                completion(nil, .decodingError())
                return
            }
        }
        task.resume()
        
    }
    
}

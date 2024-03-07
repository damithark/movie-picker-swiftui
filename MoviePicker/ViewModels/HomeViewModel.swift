//
//  HomeViewModel.swift
//  MoviePicker
//
//  Created by Damitha Raveendra on 2024-03-04.
//

import Foundation

class HomeViewModel: ObservableObject {
    
    @Published var movies: [Movie]
    let service = APIService()
    
    init() {
        movies = []
    }
    
    func getTrendingMovies() {
        let request = Endpoint.getTrendingMovies().request!
        service.makeRequest(with: request, responseModel: Movie.self) { responseData, error in
            if let error = error {
                print("DEBUG PRINT: ", error)
            }
            DispatchQueue.main.async{
//                self.movies.append(contentsOf: responseData ?? [])
                print("Response is: \(String(describing: responseData))")
            }
        }
    }
}

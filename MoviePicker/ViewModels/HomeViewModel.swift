//
//  HomeViewModel.swift
//  MoviePicker
//
//  Created by Damitha Raveendra on 2024-03-04.
//

import Foundation

class HomeViewModel: ObservableObject {
    
    @Published var movies: [Movie]
    @Published var searchResults: [SearchedMovie]
    let service = APIService()
    
    init() {
        movies = []
        searchResults = []
    }
    
    func getTrendingMovies() {
        guard let request = Endpoint.getTrendingMovies().request else { return }
        service.makeRequest(with: request, responseModel: MovieList.self) { responseData, error in
            if let error = error {
                print("DEBUG PRINT: ", error)
            }
            DispatchQueue.main.async{
                self.movies.append(contentsOf: responseData?.results ?? [])
            }
        }
    }
    
    func getSearchedMovies(searchQuery: String) {
        guard let request = Endpoint.searchMovies().request else { return }
        service.makeRequest(with: request, responseModel: SearchedMovieList.self) { responseData, error in
            if let error = error {
                print("DEBUG PRINT: ", error)
            }
            DispatchQueue.main.async {
                self.searchResults.append(contentsOf: responseData?.results ?? [])
            }
        }
    }
}

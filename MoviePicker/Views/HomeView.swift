//
//  HomeView.swift
//  MoviePicker
//
//  Created by Damitha Raveendra on 2024-03-04.
//

import SwiftUI

struct HomeView: View {
    
    @StateObject var viewModel = HomeViewModel()
    @State var searchText = ""
    
    var body: some View {
        NavigationStack {
            if searchText.isEmpty {
                ScrollView {
                    Spacer()
                    if viewModel.movies.isEmpty == true {
                        ProgressView()
                    }
                    else {
                        TrendingSection(movieList: viewModel.movies)
                    }
                }
                .navigationTitle(LocalizableStrings.homeNavTitle)
                .navigationBarTitleTextColor(.white)
                .background(viewModel.movies.isEmpty ? Constants.Colors.darkColor : Constants.Colors.primaryColor)
                .onAppear {
                    if viewModel.movies.isEmpty {
                        viewModel.getTrendingMovies()
                    }
                    if viewModel.searchResults.isEmpty {
                        viewModel.getSearchedMovies(searchQuery: searchText)
                    }
                }
            } else {
                ScrollView {
                    Spacer()
                    LazyVStack {
                        ForEach(viewModel.searchResults) { movieItem in
                            SearchItemView(movie: movieItem)
                        }
                    }
                }
                .navigationTitle(LocalizableStrings.searchTitle)
                .navigationBarTitleTextColor(.white)
                .background(Constants.Colors.primaryColor)
            }
            
        }
        .frame(width: UIScreen.main.bounds.width)
        .searchable(text: $searchText)
        .background(Constants.Colors.primaryColor)
    }
}

#Preview {
    HomeView()
}

struct MoviesRow: View {
    var movie: Movie
    var body: some View {
        Text("\(movie.id). \(movie.title)")
    }
}

extension View {
    /// Sets the text color for a navigation bar title.
    /// - Parameter color: Color of the title should be
    ///
    /// Supports both regular and large titles.
    @available(iOS 14, *)
    func navigationBarTitleTextColor(_ color: Color) -> some View {
        let uiColor = UIColor(color)
    
        // Set appearance for both normal and large sizes.
        UINavigationBar.appearance().titleTextAttributes = [.foregroundColor: uiColor ]
        UINavigationBar.appearance().largeTitleTextAttributes = [.foregroundColor: uiColor ]
    
        return self
    }
}

//
//  HomeView.swift
//  MoviePicker
//
//  Created by Damitha Raveendra on 2024-03-04.
//

import SwiftUI

struct HomeView: View {
    
    @StateObject var viewModel = HomeViewModel()
    
    var body: some View {
        NavigationStack {
            VStack {
//                List(viewModel.movies, id: \.id) { movie in
//                    MoviesRow(movie: movie)
//                }
//                NavigationLink(destination: PostsView(), label:
//                                {
//                                  Text("Next")
//                                    .frame(width: /*@START_MENU_TOKEN@*/100/*@END_MENU_TOKEN@*/, height: 24)
//                                    .padding(10)
//                                    .foregroundColor(.green)
//                                    .background(.black)
//                                    .cornerRadius(10)
//                                })
            }
            .navigationTitle("Home")
            .onAppear {
                if viewModel.movies.isEmpty {
                    viewModel.getTrendingMovies()
                }
            }
        }
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

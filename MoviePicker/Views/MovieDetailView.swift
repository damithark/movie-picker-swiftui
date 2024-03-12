//
//  MovieDetailView.swift
//  MoviePicker
//
//  Created by Damitha Raveendra on 2024-03-12.
//

import SwiftUI

struct MovieDetailView: View {
    
    @Environment(\.dismiss) var dismiss
    let movie: Movie
    
    var body: some View {
        ZStack {
            // Image here
            GeometryReader { geo in
                VStack {
                    AsyncImage(url: movie.fullPosterImgUrl) { image in
                        image
                            .resizable()
                            .frame(width: geo.size.width, height: 400)
                            .aspectRatio(contentMode: .fill)
                            .clipShape(RoundedRectangle(cornerRadius: 20))
                    } placeholder: {
                        ProgressView()
                    }
                        
                    Spacer()
                }
                .ignoresSafeArea()
            }
            
            ScrollView {
                VStack(spacing: 12) {
                    Spacer()
                        .frame(height: 350)
                    
                    HStack {
                        Text(movie.title)
                            .font(.title)
                            .fontWeight(.heavy)
                        Spacer()
                        // Ratings here
                    }
                    
                    HStack {
                        // Genre tags
                        // Running times
                    }
                    
                    HStack {
                        Text(LocalizableStrings.aboutMovie)
                            .font(.title3)
                            .fontWeight(.bold)
                        Spacer()
                    }
                    
                    Text(movie.overview)
                        .lineLimit(2)
                        .foregroundColor(Constants.Colors.subTextColor)
                }
                .padding(.horizontal)
            }
        }
        .overlay(alignment: .topLeading) {
            Button {
                dismiss()
            } label: {
                Image(systemName: "chevron.left")
                    .imageScale(.large)
                    .fontWeight(.bold)
            }
            .tint(.white)
            .padding(.leading )
        }
        .toolbar(.hidden, for: .navigationBar)
        .background(Constants.Colors.primaryColor)
    }
}

//#Preview {
//    MovieDetailView(movie: Movie(adult: false, backdropPath: "", id: 2321, title: "Test", originalLanguage: "English", originalTitle: "Test", overview: "overview", posterPath: "", mediaType: "", genreIds: [2,4], popularity: 7.6, releaseDate: "2008", video: true, voteAverage: 6.9, voteCount: 234000))
//}

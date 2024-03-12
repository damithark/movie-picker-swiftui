//
//  TrendingCard.swift
//  MoviePicker
//
//  Created by Damitha Raveendra on 2024-03-11.
//

import SwiftUI

struct TrendingCard: View {
    
    let movie: Movie
    
    var body: some View {
        ZStack (alignment: .bottom ) {
            AsyncImage(url: movie.fullTrendingImgUrl) { image in
                image
                    .resizable()
                    .scaledToFill()
                    .frame(width: 300, height: 200)
                
            } placeholder: {
                Rectangle().fill(Constants.Colors.secondaryColor)
                    .frame(width: 300, height: 172)
                ProgressView()
            }
            
            HStack (alignment: .bottom) {
                VStack {
                    HStack {
                        Text(movie.title)
                            .foregroundStyle(.white)
                            .lineLimit(1)
                            .fontWeight(.heavy)
                        Spacer()
                        Image(systemName: "heart.fill")
                            .foregroundStyle(.red)
                            .frame(width: 20, height: 20)
                    }
                    HStack {
                        Image(systemName: "hand.thumbsup.fill")
                            .foregroundColor(.yellow)
                        Text(String(format: "%0.1f", movie.voteAverage))
                            .foregroundStyle(.white)
                        Spacer()
                        Image(systemName: "eye.fill")
                            .foregroundColor(.white)
                        Text("\(movie.voteCount)")
                            .foregroundStyle(.white)
                    }
                }
            }
            .padding(.horizontal, 6)
            .padding(.vertical, 6)
            .background(Constants.Colors.secondaryColor)
        }
        .frame(width: 300, height: 200)
        .cornerRadius(10.0)
    }
}

//#Preview {
//    TrendingCard(movie: viewModel.movies.first)
//}

//
//  SearchItemView.swift
//  MoviePicker
//
//  Created by Damitha Raveendra on 2024-03-12.
//

import SwiftUI

struct SearchItemView: View {
    
    let movie: SearchedMovie
    
    var body: some View {
        HStack {
            AsyncImage(url: movie.fullPosterImgUrl) { image in
                image
                    .resizable()
                    .scaledToFill()
                    .frame(width: 100, height: 120)
                
            } placeholder: {
                Rectangle().fill(Constants.Colors.secondaryColor)
                    .frame(width: 100, height: 120)
                ProgressView()
            }
            .cornerRadius(10)
            .clipped()
            .padding(.leading, 10)
            .padding(.vertical, 10)
            
            VStack (alignment: .leading) {
                Text(movie.title)
                    .foregroundStyle(.white)
                    .font(.title3)
                    .fontWeight(.semibold)
                    .lineLimit(2)
                HStack {
                    Image(systemName: "hand.thumbsup.fill")
                        .foregroundColor(.yellow)
                    Text(String(format: "%0.1f", movie.voteAverage))
                        .foregroundStyle(Constants.Colors.subTextColor)
                }
                HStack {
                    Image(systemName: "eye.fill")
                        .foregroundColor(Constants.Colors.subTextColor)
                    Text("\(movie.voteCount)")
                        .foregroundStyle(Constants.Colors.subTextColor)
                }
            }
            Spacer()
        }
        .background(Constants.Colors.secondaryColor)
        .cornerRadius(10)
        .padding(.horizontal)
    }
}

//#Preview {
//    SearchItemView()
//}

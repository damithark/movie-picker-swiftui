//
//  TrendingSection.swift
//  MoviePicker
//
//  Created by Damitha Raveendra on 2024-03-11.
//

import SwiftUI

struct TrendingSection: View {
    
    var movieList: [Movie]
    
    var body: some View {
        NavigationStack {
            HStack {
                Text(LocalizableStrings.trendingTitle)
                    .font(.title2)
                    .fontWeight(.bold)
                    .foregroundStyle(.white)
                Spacer()
            }
            .padding(.horizontal)
            .padding(.top)
            ScrollView(.horizontal, showsIndicators: false) {
                HStack {
                    ForEach(movieList) { movieItem in
                        NavigationLink {
                            MovieDetailView(movie: movieItem)
                        } label: {
                            TrendingCard(movie: movieItem)
                        }

                    }
                }
                .padding(.horizontal)
            }
        }
    }
}

#Preview {
    TrendingSection(movieList: [])
}

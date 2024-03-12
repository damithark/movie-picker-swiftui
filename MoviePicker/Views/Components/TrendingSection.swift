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
                    TrendingCard(movie: movieItem)
                }
            }
            .padding(.horizontal)
        }
    }
}

#Preview {
    TrendingSection(movieList: [])
}

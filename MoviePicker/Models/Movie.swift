//
//  Movie.swift
//  MoviePicker
//
//  Created by Damitha Raveendra on 2024-03-04.
//

import Foundation

//struct Movies: Codable {
//    let page: Int
//    let results: [Movie]
//}

struct Movie: Codable {
    let id: Int
    let title: String
    let original_language: String
    let overview: String
    let poster_path: String
    let media_type: String
    let release_date: String
    let vote_average: String
    let genre_ids: [Int]
}

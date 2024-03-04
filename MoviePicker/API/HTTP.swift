//
//  HTTP.swift
//  MoviePicker
//
//  Created by Damitha Raveendra on 2024-03-03.
//

import Foundation

enum HTTP {
    
    enum Method: String {
        case get = "GET"
        case post = "POST"
        case put = "PUT"
        case delete = "DELETE"
    }
    
    enum Headers {
        
        enum Key: String {
            case contentType = "Content-Type"
            case authorization = "Authorization"
        }
        
        enum Value: String {
            case applicationJson = "application/json"
            case bearerToken = "Bearer eyJhbGciOiJIUzI1NiJ9.eyJhdWQiOiI4ZWFlYjZhMmZlMDJjNjIyY2EzMDAwZTgyZjcyZDQwNyIsInN1YiI6IjY1ZTA3Yzg3ZGFmNTdjMDE4NTljMTM3YiIsInNjb3BlcyI6WyJhcGlfcmVhZCJdLCJ2ZXJzaW9uIjoxfQ.KcSqfF-i1rot9G0XySJEV5htHBx4WIf261BtGShq_Jk"
        }
    }
}

//
//  Constants.swift
//  MoviePicker
//
//  Created by Damitha Raveendra on 2024-03-04.
//

import Foundation
import SwiftUI

struct Constants {
    
    
    static let scheme = "https"
    static let baseURL = "api.themoviedb.org"
    static let port: Int? = nil
    
    struct Colors {
        static let primaryColor = Color(red: 39/255, green: 40/255, blue: 59/255)
        static let secondaryColor = Color(red: 61/255, green: 61/255, blue: 88/255)
        static let subTextColor = Color(red: 190/255, green: 190/255, blue: 190/255)
        static let darkColor = Color(.black)
    }
    
    struct Fonts {
        static let titleFont = Font.custom("Helvetica-Bold", size: 24)
        static let bodyFont = Font.custom("Helvetica", size: 16)
    }
    
    struct Dimensions {
        static let cornerRadius: CGFloat = 8.0
        static let padding: CGFloat = 16.0
    }
}


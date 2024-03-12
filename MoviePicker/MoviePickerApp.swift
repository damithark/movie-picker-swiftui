//
//  MoviePickerApp.swift
//  MoviePicker
//
//  Created by Damitha Raveendra on 2024-03-03.
//

import SwiftUI

@main
struct MoviePickerApp: App {
    var body: some Scene {
        WindowGroup {
            TabView {
                HomeView()
                    .tabItem {
                        Image(systemName: "film.stack")
                    }
                HomeView()
                    .tabItem {
                        Image(systemName: "heart.fill")
                    }
                    .foregroundStyle(Constants.Colors.secondaryColor)
                HomeView()
                    .tabItem {
                        Image(systemName: "bookmark")
                    }
                    .foregroundStyle(Constants.Colors.secondaryColor)
            }
        }
    }
}

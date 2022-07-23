//
//  movieApp.swift
//  movie
//
//  Created by Nay Linn on 7/14/22.
//

import SwiftUI

@main
struct movieApp: App {
    var body: some Scene {
        WindowGroup {
            PopularMoviesView().configureView()
        }
    }
}

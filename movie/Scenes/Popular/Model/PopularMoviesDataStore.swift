//
//  PopularMoviesDataStore.swift
//  movie
//
//  Created by Nay Linn on 7/23/22.
//

import Foundation
class PopularMoviesDataStore : ObservableObject {
    @Published var page : Int = 1
    @Published var hasNextPage = false
    @Published var movies : [Movie] = []
}

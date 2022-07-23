//
//  PopularMoviesModel.swift
//  movie
//
//  Created by Nay Linn on 7/20/22.
//

import Foundation
enum PopularMoviesModel{
    
    enum LoadPopularMovies {
        struct Request {
            var page : Int
        }
        struct Response {
            var moviesResponse : MoviesResponse?
            var error : MovieErrors?
        }
        
        struct ViewModel{
            var page : Int?
            var totalPage : Int?
            var movies : [Movie]?
            var error : MovieErrors?
        }

    }
    
}

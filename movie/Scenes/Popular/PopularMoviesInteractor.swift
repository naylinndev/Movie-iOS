//
//  PopularMoviesInteractor.swift
//  movie
//
//  Created by Nay Linn on 7/20/22.
//

import Foundation
import RxSwift

protocol PopularMoviesBusinessLogic {
    func loadPopularMovies(request: PopularMoviesModel.LoadPopularMovies.Request)
}

class PopularMoviesInteractor{
   var presenter : PopularMoviesPresentationLogic?
}

extension PopularMoviesInteractor : PopularMoviesBusinessLogic {
    func loadPopularMovies(request: PopularMoviesModel.LoadPopularMovies.Request) {
        var response : PopularMoviesModel.LoadPopularMovies.Response!

        netApi.rx.request(.getPopularMovies(page: request.page))
            .map(MoviesResponse.self)
            .subscribe { event in
                switch event{
                case .success(let movieResponse) :
                    response = PopularMoviesModel.LoadPopularMovies.Response(moviesResponse: movieResponse, error: nil)
                    self.presenter?.presentMovies(response: response)
                    break
                    
                case .failure(let error):
                    response = PopularMoviesModel.LoadPopularMovies.Response(moviesResponse: nil, error: MovieErrors.canNotLoadMovies(error: error.localizedDescription))
                    self.presenter?.presentMovies(response: response)
                    break

                }
                
            }
    }
}

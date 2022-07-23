//
//  PopularMoviesPresentationLogic.swift
//  movie
//
//  Created by Nay Linn on 7/20/22.
//

import Foundation
protocol PopularMoviesPresentationLogic{
    func presentMovies(response : PopularMoviesModel.LoadPopularMovies.Response)
}

class PopularMoviesPresenter {
    var view : PopularMoviesDisplayLogic?
}

extension PopularMoviesPresenter : PopularMoviesPresentationLogic {
    func presentMovies(response: PopularMoviesModel.LoadPopularMovies.Response) {
        
        let viewModel = PopularMoviesModel.LoadPopularMovies.ViewModel(page: response.moviesResponse?.page, totalPage: response.moviesResponse?.total_pages, movies: response.moviesResponse?.results, error: response.error)
        view?.displayMovies(viewModel: viewModel)
        
    }
}

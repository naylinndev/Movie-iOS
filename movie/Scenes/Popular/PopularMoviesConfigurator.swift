//
//  PopularMoviesConfigurator.swift
//  movie
//
//  Created by Nay Linn on 7/20/22.
//

import SwiftUI

extension PopularMoviesView {
    func configureView() -> some View  {
        var view = self
        let interactor = PopularMoviesInteractor()
        let presenter  = PopularMoviesPresenter()
        view.interactor = interactor
        interactor.presenter = presenter
        presenter.view = view
        
        return view
    }
}

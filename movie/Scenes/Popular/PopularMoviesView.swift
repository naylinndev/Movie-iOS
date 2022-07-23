//
//  PopularView.swift
//  movie
//
//  Created by Nay Linn on 7/16/22.
//

import SwiftUI

protocol PopularMoviesDisplayLogic {
    func displayMovies(viewModel : PopularMoviesModel.LoadPopularMovies.ViewModel)
}

struct PopularMoviesView: View {
    var interactor : PopularMoviesBusinessLogic?
    @ObservedObject var movies = PopularMoviesDataStore()
    
    
    var body: some View {
        let columns: [GridItem] =
        Array(repeating: .init(.flexible()), count: 2)
        NavigationView {
            ScrollView {
                
                LazyVStack{
                    LazyVGrid(columns: columns) {
                        ForEach(Array(movies.movies.enumerated()),id: \.offset) {index, movie in
                            MovieItem(movie: movie).onAppear(perform: {
                                if(index == movies.movies.count - 1){
                                    movies.page += 1
                                    loadPopularMovies()
                                    print("\(movies.movies.count) load pages \(movies.page) \(index)")
                                }
                            })
                        }
                    }.padding(2)
                    if(movies.hasNextPage) {
                        ProgressView()
                    }
                }
            }.navigationTitle("Popular").onAppear{
                loadPopularMovies()
            }
        }
    }
    
   
}

extension PopularMoviesView :  PopularMoviesDisplayLogic{
    func displayMovies(viewModel: PopularMoviesModel.LoadPopularMovies.ViewModel) {
        print("reach here")
        movies.page = viewModel.page ?? movies.page
        movies.hasNextPage = viewModel.totalPage ?? 0 > movies.page ? true : false
        if(movies.page == 1){
            movies.movies = viewModel.movies ?? []
        }else {
            movies.movies.append(contentsOf: viewModel.movies ?? [])
        }
        print("\(movies.page) \(movies.hasNextPage) adfasdf \(movies.movies.count)")
        print("\(viewModel.totalPage!) adfasdf \(viewModel.movies!.count)")
    
    }
    
    func loadPopularMovies(){
        let request = PopularMoviesModel.LoadPopularMovies.Request(page: movies.page)
        interactor?.loadPopularMovies(request: request)
    }
}

struct PopularMoviesView_Previews: PreviewProvider {
    static var previews: some View {
        PopularMoviesView()
    }
}

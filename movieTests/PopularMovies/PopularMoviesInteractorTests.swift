//
//  PopularMoviesInteractorTests.swift
//  movieTests
//
//  Created by Nay Linn on 7/23/22.
//

import XCTest
@testable import movie

class PopularMoviesInteractorTests: XCTestCase {

    var slut :  PopularMoviesInteractor!
    var presenterSpy : PopularMoviesPresenterSpy!
    var isFinished = false
    override func setUpWithError() throws {
        // Put setup code here. This method is called before the invocation of each test method in the class.
        try super.setUpWithError()
        
        slut = PopularMoviesInteractor()
        presenterSpy = PopularMoviesPresenterSpy()
    }
    
    
    class PopularMoviesPresenterSpy : PopularMoviesPresentationLogic{
        var presentPopularMoviesLoaded = false
        func presentMovies(response: PopularMoviesModel.LoadPopularMovies.Response) {
            presentPopularMoviesLoaded = true
        }
        
    }
    
    func testLoadPopularMoviesCallPresenterToPresentMovies(){
        //Given
        slut.presenter = presenterSpy
        // When
        let request = PopularMoviesModel.LoadPopularMovies.Request(page: 1)
        slut.loadPopularMovies(request: request)
        
        XCTAssertTrue(presenterSpy.presentPopularMoviesLoaded,"loadPopularMovies(request: ) should ask presenter to load movies")
    }
    

    override func tearDownWithError() throws {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
        slut = nil
        presenterSpy = nil
        try super.tearDownWithError()

    }
    



}

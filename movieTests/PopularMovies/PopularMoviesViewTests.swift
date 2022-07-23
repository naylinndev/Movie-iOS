//
//  PopularMoviesViewTests.swift
//  movieTests
//
//  Created by Nay Linn on 7/23/22.
//

import XCTest
@testable import movie
class PopularMoviesViewTests: XCTestCase {

    var slut : PopularMoviesView!
    var interactorSpy : PopularMoviesInteractorSpy!
    
    override func setUpWithError() throws {
        // Put setup code here. This method is called before the invocation of each test method in the class.
        try super.setUpWithError()
        slut = PopularMoviesView()
        interactorSpy = PopularMoviesInteractorSpy()
    }
    
    
    class PopularMoviesInteractorSpy : PopularMoviesBusinessLogic{
        var loadPopularMoviesCalled = false
        func loadPopularMovies(request: PopularMoviesModel.LoadPopularMovies.Request) {
            loadPopularMoviesCalled = true
        }
    }
    
    func testShouldLoadPopularMoviesOnAppear() {
        //Given
        slut.interactor = interactorSpy
        //When
        slut.loadPopularMovies()
        
        XCTAssertTrue(interactorSpy.loadPopularMoviesCalled,"loadPopularMovies should ask interactor to load popular movies")
    }

    override func tearDownWithError() throws {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
        slut = nil
        interactorSpy = nil
        try super.tearDownWithError()
    }


}

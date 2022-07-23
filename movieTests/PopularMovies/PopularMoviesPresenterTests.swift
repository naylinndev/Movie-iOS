//
//  PopularMoviesPresenterTests.swift
//  movieTests
//
//  Created by Nay Linn on 7/23/22.
//

import XCTest
@testable import movie

class PopularMoviesPresenterTests: XCTestCase {

    var sut : PopularMoviesPresenter!
    var viewSpy : PopularMoviesViewSpy!
    override func setUpWithError() throws {
        try super.setUpWithError()
        // Put setup code here. This method is called before the invocation of each test method in the class.
        sut = PopularMoviesPresenter()
        viewSpy = PopularMoviesViewSpy()
    }

    
    
    class PopularMoviesViewSpy{}

    override func tearDownWithError() throws {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
        sut = nil
        viewSpy = nil
        try super.tearDownWithError()
    }
}

//
//  MoviesResponse.swift
//  movie
//
//  Created by Nay Linn on 7/20/22.
//

import Foundation
class MoviesResponse :  Codable {
    let page : Int?
    let total_pages : Int?
    let results : [Movie]?
}

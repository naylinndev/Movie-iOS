//
//  MoviesResponse.swift
//  movie
//
//  Created by Nay Linn on 7/20/22.
//

import Foundation
class Movie : Codable,Identifiable {
    var id : Int?
    var adult : Bool?
    var backdrop_path : String?
    var original_title : String?
    var title : String?
    var overview : String?
    var poster_path : String?
    var vote_average : Double?
}

#if DEBUG
extension Movie{
    convenience init(forPreview: Bool  = true) {
        self.init()
        if(forPreview){
            id = 12
            adult = false
            backdrop_path = "393mh1AJ0GYWVD7Hsq5KkFaTAoT.jpg"
            original_title = "Minions: The Rise of Gru"
            title = "Minions: The Rise of Gru"
            overview = "Four years after Isla Nublar was destroyed, dinosaurs now live—and hunt—alongside humans all over the world. This fragile balance will reshape the future and determine, once and for all, whether human beings are to remain the apex predators on a planet they now share with history’s most fearsome creatures."
            poster_path = "/wKiOkZTN9lUUUNZLmtnwubZYONg.jpg"
            vote_average = 8.467
        }
        
    }
}
#endif

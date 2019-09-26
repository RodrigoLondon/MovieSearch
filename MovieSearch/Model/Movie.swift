//
//  Movie.swift
//  MovieSearch
//
//  Created by Lewis Jones on 22/11/2018.
//  Copyright © 2018 Rodrigo. All rights reserved.
//

import Foundation


struct Movie {
    let name: String
    let rating: Double
    let description: String
    let imageURL: String?
}

extension Movie {
    
//    enum CodingKeys: String, CodingKey
//    {
//        case name = "title"
//        case url = "link"
//        case rating = "vote_average"
//        case description = "overview"
//        case imageURL = "poster_path"
//
//    }
    init?(dictionary: [String : Any]) {

        guard let name = dictionary["title"] as? String, let rating = dictionary["vote_average"] as? Double, let description = dictionary["overview"] as? String else { return nil }
        let imageURL = dictionary["poster_path"] as? String
        //let imageURL1 = URL(string: "https://image.tmdb.org/t/p/original")!
        //let imageURL2 = "https://image.tmdb.org/t/p/original\(imageURL)"

        self.name = name
        self.rating = rating
        self.description = description
        self.imageURL = imageURL

    }
    
}


//
// API
//e8ead7c87b8ce8bec496e1904ad51b6f
//
//
// READ ACCESS TOKEN
//eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJhdWQiOiJlOGVhZDdjODdiOGNlOGJlYzQ5NmUxOTA0YWQ1MWI2ZiIsInN1YiI6IjViZjZkNDI3OTI1MTQxN2MxZDA2MjkzYyIsInNjb3BlcyI6WyJhcGlfcmVhZCJdLCJ2ZXJzaW9uIjoxfQ.-fc9knJawrVjgIyTpetu1KToJqyJlO2e_kVIY1Mh_k8



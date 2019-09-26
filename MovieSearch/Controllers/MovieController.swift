//
//  MovieController.swift
//  MovieSearch
//
//  Created by Lewis Jones on 22/11/2018.
//  Copyright © 2018 Rodrigo. All rights reserved.
//

import Foundation
import UIKit

//https://api.themoviedb.org/3/search/movie?api_key={api_key}&query=Jack+Reacher
class MovieController{
    

     var allMovies: [Movie] = []
    
    
    static func getMovies(searchText: String, completion: @escaping(([Movie])
        -> Void)) {
        let baseURL = URL(string: "https://api.themoviedb.org/3/search/movie?")!
        guard var components = URLComponents(url: baseURL, resolvingAgainstBaseURL: true) else {
            print("Our URL is not working!.")
            completion([])
            return
        }
        //let api = "e8ead7c87b8ce8bec496e1904ad51b6f"
        
        let apiQuery = URLQueryItem(name: "api_key", value: "e8ead7c87b8ce8bec496e1904ad51b6f")
        let searchQuery = URLQueryItem(name: "query", value: searchText)
        components.queryItems = [apiQuery, searchQuery]
        
        guard let url = components.url else {
            print("Our query items are causing trouble.")
            completion([])
            return
        }
        
        let dataTask = URLSession.shared.dataTask(with: url) { (data, _, error) in
            if let error = error {
                print("Error getting data back from webserver: \(error.localizedDescription).")
                completion([])
                return
            }
            guard let data = data else {
                print("No data was received from sever.")
                completion([])
                return
            }
//            guard let decode = try JSONDecoder().decode(Movie.self, from: data) else {
//                print("Could not convert data into JSON.")
//                completion([])
//                return
//            }
            guard let topLevelJSON = (try? JSONSerialization.jsonObject(with: data, options: .allowFragments)) as? [String : Any] else {
                print("Could not convert data into JSON.")
                completion([])
                return
            }

            guard let movieDictionaries = topLevelJSON["results"] as? [[String : Any]] else {
                print("Could not get dictionaries from results.")
                completion([])
                return
                
            }


            var allMovies: [Movie] = []
            
            for movieDictionary in movieDictionaries {
                if let newMovie = Movie(dictionary: movieDictionary) {
                  allMovies.append(newMovie)
               
                }
            }
            completion(allMovies)
        }
        dataTask.resume()
    }
   

    
   static func getImageFor(movie: Movie, completion: @escaping ((UIImage?) -> Void)) {
     //   https://image.tmdb.org/t/p/w500/kqjL17yufvn9OVLyXYpvtyrFfak.jpg

         guard let movieImageURL = movie.imageURL else {
            return
        }
             let imageBaseURL = "https://image.tmdb.org/t/p/w500\(movieImageURL)"
             print(imageBaseURL)

              guard let url = URL(string: imageBaseURL) else {
                    print("Movie didn't have an image that could be made into a url.")
                    completion(nil)
                    return
                }
    
       
        URLSession.shared.dataTask(with: url) { (data, _, error) in
            if let error = error {
                print("Error: \(error.localizedDescription).")
                completion(nil)
                return
            }
            guard let data = data else {
                print("Could not get any data back from image.")
                completion(nil)
                return
            }
            let image = UIImage(data: data)
           
            completion(image)
        } .resume()
    }
    
    
}




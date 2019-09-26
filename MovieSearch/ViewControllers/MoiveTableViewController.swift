//
//  MoiveTableViewController.swift
//  MovieSearch
//
//  Created by Lewis Jones on 22/11/2018.
//  Copyright © 2018 Rodrigo. All rights reserved.
//

import UIKit

class MoiveTableViewController: UITableViewController, UISearchBarDelegate {
    
    @IBOutlet weak var movieSearchBar: UISearchBar!
    
    var movies: [Movie] = []

    
    override func viewDidLoad() {
        super.viewDidLoad()
      movieSearchBar.delegate = self
        
    }
    
    
    func searchBarSearchButtonClicked(_ searchBar: UISearchBar) {
        
        guard let searchText = movieSearchBar.text, !searchText.isEmpty else { return }
        
        MovieController.getMovies(searchText: searchText) { (movies) in
            self.movies = movies
            DispatchQueue.main.async {
                self.tableView.reloadData()
                //self.movieSearchBar.text = ""
            }
            print(movies.count)
            
        }
    }

    // MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return movies.count
    }

    
    override    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "MovieCell", for: indexPath) as! MovieTableViewCell
        let movieItem = movies[indexPath.row]
        cell.movie = movieItem


        return cell
    }

  }


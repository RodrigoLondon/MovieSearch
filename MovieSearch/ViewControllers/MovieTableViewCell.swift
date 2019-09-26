//
//  MovieTableViewCell.swift
//  MovieSearch
//
//  Created by Lewis Jones on 22/11/2018.
//  Copyright © 2018 Rodrigo. All rights reserved.
//

import UIKit

class MovieTableViewCell: UITableViewCell {
    
    @IBOutlet weak var movieNameLabel: UILabel!
    @IBOutlet weak var movieRatingLabel: UILabel!
    @IBOutlet weak var movieDescriptionLabel: UILabel!
    @IBOutlet weak var movieImageView: UIImageView!
   
    var movie: Movie? {
        
        didSet {
            guard let movie = movie else { return }
        
            movieNameLabel.text = movie.name
            movieRatingLabel.text = String(movie.rating)
            movieDescriptionLabel.text = movie.description
            movieImageView.image = nil
            
            MovieController.getImageFor(movie: movie) { (image) in
                if let image = image {
                    DispatchQueue.main.async {
                        self.movieImageView.image = image
                    }
                } else {
                    print("Image was nil")
            }
            
        }
     }
   }
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
        
        // Configure the view for the selected state
    }
}


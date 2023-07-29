//
//  MovieTableViewController.swift
//  SeSACWeek3
//
//  Created by walkerhilla on 2023/07/29.
//

import UIKit

class MovieTableViewController: UITableViewController {
  
  override func viewDidLoad() {
    super.viewDidLoad()
    
    // Uncomment the following line to preserve selection between presentations
    // self.clearsSelectionOnViewWillAppear = false
    
    // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
    // self.navigationItem.rightBarButtonItem = self.editButtonItem
  }
  
  // MARK: - Table view data source
  
  override func numberOfSections(in tableView: UITableView) -> Int {
    return 1
  }
  
  override func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
    return 120
  }
  
  override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
    return MovieInfo.movie.count
  }
  
  override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
    
    let movie = MovieInfo.movie[indexPath.row]
    let cell = tableView.dequeueReusableCell(withIdentifier: "MovieCell") as! MovieCell
    
    cell.moviePoster.image = movie.posterImage ?? UIImage()
    cell.movieTitle.text = movie.title
    cell.movieInfo.text = "\(movie.releaseDate) | \(movie.runtime) | \(movie.rate)점"
    cell.movieOverview.textAlignment = .justified
    cell.movieOverview.numberOfLines = 0
    cell.movieOverview.text = movie.overview
    
    return cell
  }
}

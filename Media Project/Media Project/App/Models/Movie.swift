//
//  Movie.swift
//  Media Project
//
//  Created by walkerhilla on 2023/08/12.
//

import Foundation

struct Movie {
  let id: Int
  let title: String
  let overView: String
  let posterPath: String
  let releaseDate: String
  let rate: Double
  let adult: Bool
  
  var posterImageURL: String {
    MovieAPIManager.imageCDN + posterPath
  }
}

//
//  PosterCollectionViewCell.swift
//  SeSAC3Week5
//
//  Created by walkerhilla on 2023/08/16.
//

import UIKit

class PosterCollectionViewCell: UICollectionViewCell {
  
  @IBOutlet weak var posterImageView: UIImageView!
  
  var imageURL: String?
  override func awakeFromNib() {
    super.awakeFromNib()
    // Initialization code
  }
  
  override func prepareForReuse() {
    super.prepareForReuse()
    
    guard let imageURL else { return }
    self.posterImageView.kf.setImage(with: URL(string: imageURL))
  }
}

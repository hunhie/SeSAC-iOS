//
//  BeerTableViewCell.swift
//  Beer API
//
//  Created by walkerhilla on 2023/08/09.
//

import UIKit

class BeerTableViewCell: UITableViewCell {
  
  static let identifier = "BeerTableViewCell"
  
  @IBOutlet weak var beerImageView: UIImageView!
  @IBOutlet weak var name: UILabel!
  @IBOutlet weak var desc: UILabel!
  
  var beer: Beer?
  
  override func awakeFromNib() {
    super.awakeFromNib()
    // Initialization code
  }
  
  override func setSelected(_ selected: Bool, animated: Bool) {
    super.setSelected(selected, animated: animated)
    
    // Configure the view for the selected state
  }
  
  func configureCell() {
    guard let beer else { return }
    let url = URL(string: beer.image)
    if let url {
      beerImageView.kf.setImage(with: url)
    }
    name.text = beer.name
    desc.text = beer.description
  }
}

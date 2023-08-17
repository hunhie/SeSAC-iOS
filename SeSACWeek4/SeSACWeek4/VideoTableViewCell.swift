//
//  VideoTableViewCell.swift
//  SeSACWeek4
//
//  Created by walkerhilla on 2023/08/09.
//

import UIKit

class VideoTableViewCell: UITableViewCell {
  
  @IBOutlet weak var thumbnailImageView: UIImageView!
  @IBOutlet weak var titleLabel: UILabel!
  @IBOutlet weak var contentLabel: UILabel!
  
  override func awakeFromNib() {
    super.awakeFromNib()
    
    titleLabel.textColor = .black
    titleLabel.font = .boldSystemFont(ofSize: 14)
    titleLabel.numberOfLines = 0
    contentLabel.font = .systemFont(ofSize: 13)
    contentLabel.numberOfLines = 2
    thumbnailImageView.contentMode = .scaleAspectFill
  }
  
  override func setSelected(_ selected: Bool, animated: Bool) {
    super.setSelected(selected, animated: animated)
    
    // Configure the view for the selected state
  }
  
}

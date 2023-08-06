//
//  SettingTableViewCell.swift
//  Tamagotchi App
//
//  Created by walkerhilla on 2023/08/05.
//

import UIKit

final class SettingTableViewCell: UITableViewCell {
  
  static let identifier = "SettingTableViewCell"
  
  @IBOutlet weak var titleLabel: UILabel!
  @IBOutlet weak var detailLabel: UILabel!
  @IBOutlet weak var menuImageView: UIImageView!
  
  var menu: Menu?
  
  override func awakeFromNib() {
    super.awakeFromNib()
    
    titleLabel.textColor = ColorConstant.textColor
    titleLabel.font = .monospacedDigitSystemFont(ofSize: 13, weight: .bold)
    detailLabel.textColor = ColorConstant.textColor
    menuImageView.tintColor = ColorConstant.textColor
    self.backgroundColor = ColorConstant.backgroundColor
  }
  
  func configureCell() {
    
    guard let menu else { return }
    
    titleLabel.text = menu.name
    menuImageView.image = UIImage(systemName: menu.image)
   
    detailLabel.text = menu.detail != nil ? menu.detail : ""
  }
}

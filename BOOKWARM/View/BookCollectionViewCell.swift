//
//  BookCollectionViewCell.swift
//  BOOKWARM
//
//  Created by walkerhilla on 2023/07/31.
//

import UIKit

class BookCollectionViewCell: UICollectionViewCell {

  @IBOutlet weak var backView: UIView!
  @IBOutlet weak var bookTitleLabel: UILabel!
  @IBOutlet weak var bookRateLabel: UILabel!
  @IBOutlet weak var bookImageView: UIImageView!
  
  override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

}

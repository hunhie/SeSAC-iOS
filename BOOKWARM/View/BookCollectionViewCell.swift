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
  @IBOutlet weak var likeButton: UIButton!
  
  var book: Book?
  var indexPath: IndexPath?
  
  override func awakeFromNib() {
    super.awakeFromNib()
    
    // cell 배경 설정
    backView.backgroundColor = .lightGray
    backView.layer.cornerRadius = 8
    backView.clipsToBounds = true
    
    // cell 책 제목 레이블 설정
    bookTitleLabel.textColor = .white
    bookTitleLabel.textAlignment = .natural
    
    // cell 좋아요 버튼 설정
    likeButton.tintColor = .white
  }
  
  func configureCell() {
    guard let book = book,
          let indexPath = indexPath else { return }
    bookTitleLabel.text = book.title
    bookRateLabel.text = "\(book.rate)"
    likeButton.tag = indexPath.row
  }
  
}

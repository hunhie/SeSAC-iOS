//
//  BookCollectionViewCell.swift
//  BOOKWARM
//
//  Created by walkerhilla on 2023/07/31.
//

import UIKit
import Kingfisher

final class BookCollectionViewCell: UICollectionViewCell {
  
  @IBOutlet weak var backView: UIView!
  @IBOutlet weak var bookTitleLabel: UILabel!
  @IBOutlet weak var authorLabel: UILabel!
  @IBOutlet weak var priceLabel: UILabel!
  @IBOutlet weak var bookImageView: UIImageView!

  
  var book: Book?
  var indexPath: IndexPath?
  
  override func awakeFromNib() {
    super.awakeFromNib()
    
    // cell 배경 설정
    backView.backgroundColor = .lightGray
    backView.layer.cornerRadius = 8
    backView.clipsToBounds = true
    
    authorLabel.textColor = .white
    authorLabel.font = .systemFont(ofSize: 11)
    priceLabel.textColor = .white
    priceLabel.font = .systemFont(ofSize: 11)
    
    // cell 책 제목 레이블 설정
    bookTitleLabel.textColor = .white
    bookTitleLabel.textAlignment = .natural
    
  }
  
  func configureCell() {
    guard let book = book else { return }
    bookTitleLabel.text = book.title
    authorLabel.text = book.authors
    priceLabel.text = "\(book.price)"
    if let url = URL(string: book.thumbnail) {
    bookImageView.kf.setImage(with: url)
    }
  }
  
}

//
//  DetailViewController.swift
//  BOOKWARM
//
//  Created by walkerhilla on 2023/07/31.
//

import UIKit

class DetailViewController: UIViewController {
  
  @IBOutlet weak var bookImageView: UIImageView!
  @IBOutlet weak var bookTitleLabel: UILabel!
  @IBOutlet weak var bookPriceLabel: UILabel!
  @IBOutlet weak var bookRateLabel: UILabel!
  @IBOutlet weak var bookDescLabel: UILabel!
  @IBOutlet weak var likeBarButton: UIBarButtonItem!
  
  
  var indexPath: IndexPath?
  var book: Book?
  
  override func viewDidLoad() {
    super.viewDidLoad()
    
    configureUI()
  }
  
  func configureUI() {
    guard let book = book else { return }
    
    bookTitleLabel.text = book.title
    bookPriceLabel.text = (book.price.toStringWithComma()  ?? "") + "원"
    bookRateLabel.text = "\(book.rate)"
    bookDescLabel.text = book.desc
    likeBarButton.image = UIImage(systemName: book.like ? "heart.fill" : "heart")
    
    if let bookImage = book.bookImage {
      bookImageView.load(url: bookImage)
    }
  }
  
  @IBAction func likeBarButtonTapped(_ sender: UIBarButtonItem) {
    guard let indexPath = indexPath else { return }
    BookInfo.bookData[indexPath.row].like.toggle()
    book?.like.toggle()
    likeBarButton.image = UIImage(systemName: book!.like ? "heart.fill" : "heart")
  }
}

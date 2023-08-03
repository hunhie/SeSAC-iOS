//
//  DetailViewController.swift
//  BOOKWARM
//
//  Created by walkerhilla on 2023/07/31.
//

import UIKit

enum PresentationType {
  case push
  case modal
}

final class DetailViewController: UIViewController {
  
  @IBOutlet weak var bookImageView: UIImageView!
  @IBOutlet weak var bookTitleLabel: UILabel!
  @IBOutlet weak var bookPriceLabel: UILabel!
  @IBOutlet weak var bookRateLabel: UILabel!
  @IBOutlet weak var bookDescLabel: UILabel!
  @IBOutlet weak var likeBarButton: UIBarButtonItem!
  @IBOutlet weak var memoTextView: UITextView!

  var indexPath: IndexPath?
  var book: Book?
  var type: PresentationType?
  
  private let placeholder = "메모를 입력하세요."
  
  override func viewDidLoad() {
    super.viewDidLoad()
    
    memoTextView.delegate = self
    memoTextView.text = placeholder
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
    
    if type == .modal {
      self.navigationItem.leftBarButtonItem = UIBarButtonItem(image: UIImage(systemName: "xmark"), style: .done, target: self, action: #selector(back))
    }
  }
  
  @objc func back() {
    dismiss(animated: true)
  }
  
  @IBAction func likeBarButtonTapped(_ sender: UIBarButtonItem) {
    guard let indexPath = indexPath else { return }
    BookInfo.bookData[indexPath.row].like.toggle()
    book?.like.toggle()
    likeBarButton.image = UIImage(systemName: book!.like ? "heart.fill" : "heart")
  }
}

extension DetailViewController: UITextViewDelegate {
  func textViewDidBeginEditing(_ textView: UITextView) {
    if textView.text == placeholder {
      textView.text = nil
    }
  }
  
  func textViewDidEndEditing(_ textView: UITextView) {
    if textView.text.count == 0 {
      textView.text = placeholder
    }
  }
}

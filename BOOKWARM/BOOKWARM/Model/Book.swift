//
//  Book.swift
//  BOOKWARM
//
//  Created by walkerhilla on 2023/07/31.
//

import Foundation

struct Book {
  let title: String
  let authors: String
  let price: Int
  let contents: String
  let thumbnail: String
}

class BookInfo {
  static var bookData: [Book] = [

  ]
  
  static var dataCount: Int {
    self.bookData.count
  }
  
  static var recentBookData: [Book] = []
  
  static var recentBookDataCount: Int {
    self.recentBookData.count
  }
  
  static func appendRecentBook(_ book: Book) {
    recentBookData.append(book)
    recentBookData.reverse()
  }
}

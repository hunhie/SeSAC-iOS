//
//  RealmModel.swift
//  BOOKWARM
//
//  Created by walkerhilla on 2023/09/05.
//

import Foundation
import RealmSwift

class BookTable: Object {
  
  @Persisted(primaryKey: true) var _id: ObjectId
  @Persisted var title: String
  @Persisted var author: String
  @Persisted var price: Int
  @Persisted var contents: String
  @Persisted var thumbnail: String

  convenience init(title: String, author: String, price: Int, contents: String, thumbnail: String) {
    self.init()
    
    self.title = title
    self.author = author
    self.price = price
    self.contents = contents
    self.thumbnail = thumbnail
  }
}

//
//  Section.swift
//  NewCollectionViewPractice
//
//  Created by walkerhilla on 2023/09/16.
//

import UIKit

struct Case1Item: Hashable {
  static func == (lhs: Case1Item, rhs: Case1Item) -> Bool {
    return lhs.id == rhs.id
  }

  let id = UUID()
  let title: String
  let subTitle: String?
  let imageName: String?
  let imageTintColor: UIColor?
  let isSideText: Bool
}

struct Case2Item: Hashable {
  let id = UUID()
  let title: String
}

//
//  PassDataDelegate.swift
//  SeSAC3PhotoGram
//
//  Created by walkerhilla on 2023/08/29.
//

import Foundation

protocol PassDataDelegate {
  func receiveData(date: Date)
  func receiveData(image: String)
}

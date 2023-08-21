//
//  ReusableViewProtocol.swift
//  SeSAC3Week5
//
//  Created by walkerhilla on 2023/08/17.
//

import UIKit

protocol ReusableViewProtocol {
  static var identifier: String { get }
}

extension UIViewController: ReusableViewProtocol {
  static var identifier: String {
    return String(describing: self)
  }
}

extension UIView: ReusableViewProtocol {
  static var identifier: String {
    return String(describing: self)
  }
}

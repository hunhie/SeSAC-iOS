//
//  Extension+UIViewController.swift
//  Lottery API
//
//  Created by walkerhilla on 2023/09/13.
//

import UIKit

extension UIViewController {
  
  func addTapGestureForEndEditing() {
    let tapGestureRecognizer = UITapGestureRecognizer(target: self, action: #selector(didTapScreen))
    tapGestureRecognizer.cancelsTouchesInView = false
    view.addGestureRecognizer(tapGestureRecognizer)
  }
  
  @objc func didTapScreen() {
    view.endEditing(true)
  }
}

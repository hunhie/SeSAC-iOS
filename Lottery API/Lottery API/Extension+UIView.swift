//
//  Extension+UIView.swift
//  Lottery API
//
//  Created by walkerhilla on 2023/08/08.
//

import UIKit

extension UIView {
  
  func setBackgroundColor(number: Int) {
    
    switch number {
    case 1...10:
      self.backgroundColor = UIColor(hexCode: Colors.yellow)
    case 11...20:
      self.backgroundColor = UIColor(hexCode: Colors.sky)
    case 21...30:
      self.backgroundColor = UIColor(hexCode: Colors.red)
    case 31...40:
      self.backgroundColor = UIColor(hexCode: Colors.gray)
    case 41...45:
      self.backgroundColor = UIColor(hexCode: Colors.green)
    default:
      break
    }
  }
}

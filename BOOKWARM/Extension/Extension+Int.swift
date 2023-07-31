//
//  Extension+Int.swift
//  BOOKWARM
//
//  Created by walkerhilla on 2023/07/31.
//

import Foundation

extension Int {
  public func toStringWithComma() -> String? {
    let numberFormmater = NumberFormatter()
    numberFormmater.numberStyle = .decimal
    
    if let numberToString = numberFormmater.string(from:NSNumber(value: self)) {
      return numberToString
    }
    return nil
  }
}

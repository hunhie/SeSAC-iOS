//
//  Observable.swift
//  Lottery API
//
//  Created by walkerhilla on 2023/09/13.
//

import Foundation

final class Observable<T> {
  var value: T? {
    didSet {
      handler?(value)
    }
  }
  
  private var handler: ((T?) -> Void)?
  
  func bind(_ closure: @escaping (T?) -> Void) {
    closure(value)
    handler = closure
  }
}

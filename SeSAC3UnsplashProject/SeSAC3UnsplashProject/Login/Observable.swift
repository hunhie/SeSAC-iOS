//
//  Observable.swift
//  SeSAC3UnsplashProject
//
//  Created by walkerhilla on 2023/09/12.
//

import Foundation

class Observable<T> {
  var value: T {
    didSet {
      listener?(value)
    }
  }
  
  init(value: T) {
    self.value = value
  }
  
  private var listener: ((T) -> Void)?
  
  func bind(_ closure: @escaping (T) -> Void) {
    print(#function)
    closure(value)
    listener = closure
  }
}

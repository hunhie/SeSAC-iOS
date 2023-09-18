//
//  Observable.swift
//  MVVMPractice
//
//  Created by walkerhilla on 2023/09/19.
//

import Foundation

final class Observable<T> {
  
  var value: T? {
    didSet {
      listener?(value)
    }
  }
  
  private var listener: ((T?) -> ())?
  
  func bind(_ closure: @escaping (T?) -> ()) {
    self.listener = closure
  }
}

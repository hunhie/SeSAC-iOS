//
//  User.swift
//  Tamagotchi App
//
//  Created by walkerhilla on 2023/08/05.
//

import Foundation

/// 사용자 모델 싱글톤 객체
final class User {
  static let shared = User()
  private init() {}
  
  var name: String = "대장"
  
  func getName() -> String {
    self.name
  }
}

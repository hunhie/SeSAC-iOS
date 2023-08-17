//
//  UserDefaultsHelper.swift
//  SeSACWeek4
//
//  Created by walkerhilla on 2023/08/11.
//

import Foundation

class UserDefaultsHelper {
  
  static let userDefaults = UserDefaults.standard
  
  private init() {}

  enum Key: String {
    case nickname, age
  }
  
  var nickname: String {
    get {
      return UserDefaultsHelper.userDefaults.string(forKey: Key.nickname.rawValue) ?? "대장"
    }
    set {
      UserDefaultsHelper.userDefaults.set(newValue, forKey: Key.nickname.rawValue)
    }
  }
}

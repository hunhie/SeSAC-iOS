//
//  User.swift
//  MVVMPractice
//
//  Created by walkerhilla on 2023/09/19.
//

import Foundation

enum authentificationResponse {
  case success
  case failed
}

// 백엔드 서버(DB)가 있다 가정하고 대체하는 클래스
final class DB {
  static let shared = DB()
  
  private init() { }
  
  var account: User?
  
  func authentification(user: User) -> authentificationResponse {
    if let account,
       account == user {
      return .success
    } else {
      return .failed
    }
  }
  
  func createAccount(user: User) {
    self.account = user
  }
}

final class User: Equatable {
  static func == (lhs: User, rhs: User) -> Bool {
    print(lhs.id, rhs.id)
    print(lhs.password, rhs.password)
    if lhs.id == rhs.id && lhs.password == rhs.password {
      return true
    } else {
      return false
    }
  }
  
  var id: String
  var password: String
  var nickname: String?
  
  init(id: String, password: String, nickname: String? = nil) {
    self.id = id
    self.password = password
    self.nickname = nickname
  }
}

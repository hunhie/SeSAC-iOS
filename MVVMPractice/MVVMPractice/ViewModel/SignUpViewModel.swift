//
//  SignUpViewModel.swift
//  MVVMPractice
//
//  Created by walkerhilla on 2023/09/19.
//

import Foundation

enum SignUpError: Error {
  case idEmpty
  case idIncorrect
  case passwordEmpty
  case passwordIncorrect
  case nicknameEmpty
  case nicknameIncorrect
}

final class SignUpViewModel {
  func validation(id: String?, password: String?, nickname: String?) throws {
    guard let id, !id.isEmpty else { throw SignUpError.idEmpty }
    
    guard id.contains(where: { $0 == "@" }) else { throw SignUpError.idIncorrect }
    
    guard let password, !password.isEmpty else { throw SignUpError.passwordEmpty }
    
    guard password.count > 5, password.count < 11 else { throw SignUpError.passwordIncorrect }
    
    guard let nickname, !nickname.isEmpty else { throw SignUpError.nicknameEmpty }
    
    guard nickname.count < 10 else { throw SignUpError.nicknameIncorrect }
    
    print("success")
    
    DB.shared.createAccount(user: User(id: id, password: password, nickname: nickname))
  }
}

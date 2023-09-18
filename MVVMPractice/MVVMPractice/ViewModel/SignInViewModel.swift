//
//  SignInViewModel.swift
//  MVVMPractice
//
//  Created by walkerhilla on 2023/09/19.
//

import Foundation

final class SignInViewModel {
  func authentification(id: String?, password: String?) -> authentificationResponse{
    guard let id, let password else { return .failed }
    
    return DB.shared.authentification(user: User(id: id, password: password))
  }
}

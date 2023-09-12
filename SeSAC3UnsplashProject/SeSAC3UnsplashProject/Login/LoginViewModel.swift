//
//  LoginViewModel.swift
//  SeSAC3UnsplashProject
//
//  Created by walkerhilla on 2023/09/12.
//

import Foundation

final class LoginViewModel {
  
  var id = Observable(value: "")
  var pw = Observable(value: "")
  var isValid = Observable(value: false)
  
  func checkValidation() {
    if id.value.count >= 6 && pw.value.count >= 4 {
      isValid.value = true
    } else {
      isValid.value = false
    }
  }
  
  func signIn() {
    
    // 서버 
  }
}

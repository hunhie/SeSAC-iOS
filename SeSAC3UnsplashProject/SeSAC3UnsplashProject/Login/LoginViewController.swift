//
//  LoginViewController.swift
//  SeSAC3UnsplashProject
//
//  Created by walkerhilla on 2023/09/12.
//

import UIKit

final class LoginViewController: UIViewController {
  
  @IBOutlet weak var idTf: UITextField!
  @IBOutlet weak var pwTf: UITextField!
  @IBOutlet weak var signInButton: UIButton!
  
  let viewModel = LoginViewModel()
  
  override func viewDidLoad() {
    super.viewDidLoad()
    
    viewModel.id.bind { text in
      print(text)
      self.idTf.text = text
    }
    
    viewModel.pw.bind { text in
      self.pwTf.text = text
    }
    
    viewModel.isValid.bind { bool in
      self.signInButton.isEnabled = bool
      self.signInButton.backgroundColor = bool ? .green : .lightGray
    }
    
    signInButton.addTarget(self, action: #selector(signInButtonTapped), for: .touchUpInside)
    idTf.addTarget(self, action: #selector(idTfChanged), for: .editingChanged)
    pwTf.addTarget(self, action: #selector(pwTfChanged), for: .editingChanged)
  }
  @objc func idTfChanged() {
    print("변경")
    viewModel.id.value = idTf.text!
    viewModel.checkValidation()
  }
  
  @objc func pwTfChanged() {
    viewModel.pw.value = pwTf.text!
    viewModel.checkValidation()
  }
  
  @objc func signInButtonTapped() {
    guard let id = idTf.text,
          let pw = pwTf.text else { return }
    print(id, pw)
  }
}

//
//  SignUpViewController.swift
//  MVVMPractice
//
//  Created by walkerhilla on 2023/09/19.
//

import UIKit

final class SignUpViewController: UIViewController {
  
  let mainView = SignUpView()
  let viewModel = SignUpViewModel()
  
  override func viewDidLoad() {
    super.viewDidLoad()

    mainView.signUpButton.addTarget(self, action: #selector(signUpButtonTapped), for: .touchUpInside)
  }
  
  override func loadView() {
    super.loadView()
    
    view = mainView
  }
  
  @objc func signUpButtonTapped() {
    do {
      try viewModel.validation(id: mainView.idTextField.text, password: mainView.passwordTextField.text, nickname: mainView.nicknameTextField.text)
    } catch {
      print(error)
    }
    navigationController?.popViewController(animated: true)
  }
}

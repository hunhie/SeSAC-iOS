//
//  SignInViewController.swift
//  MVVMPractice
//
//  Created by walkerhilla on 2023/09/18.
//

import UIKit
import SnapKit

class SignInViewController: UIViewController {
  
  let mainView = SignInView()
  let viewModel = SignInViewModel()
  
  override func viewDidLoad() {
    super.viewDidLoad()
    
    mainView.signInButton.addTarget(self, action: #selector(signInButtonTapped), for: .touchUpInside)
    mainView.signUpButtonLabel.addTarget(self, action: #selector(signUpButtonLabelTapped), for: .touchUpInside)
  }
  
  override func loadView() {
    super.loadView()
    
    view = mainView
  }
  
  @objc func signInButtonTapped() {
    do {
      try viewModel.authentification(id: mainView.idTextField.text, password: mainView.passwordTextField.text)
      let windowScene = UIApplication.shared.connectedScenes.first as? UIWindowScene
      let sceneDelegate = windowScene?.delegate as? SceneDelegate
      let vc = PhotoViewController()
      let nav = UINavigationController(rootViewController: vc)
      sceneDelegate?.window?.rootViewController = nav
      sceneDelegate?.window?.makeKeyAndVisible()
    } catch {
      print("아이디 또는 비밀번호가 올바르지 않습니다.")
    }
  }
  
  @objc func signUpButtonLabelTapped() {
    let vc = SignUpViewController()
    navigationController?.pushViewController(vc, animated: true)
  }
}


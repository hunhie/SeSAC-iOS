//
//  SignUpViewController.swift
//  SeSAC3Week6
//
//  Created by walkerhilla on 2023/08/24.
//

import UIKit

class SignUpViewController: UIViewController {
  
  let logoLabel: UILabel = {
    let label = LogoLabel()
    label.configureUI()
    return label
  }()
  
  let nameTextField: UITextField = {
    let tf = RadiusTextField()
    tf.placeholder = "이름을 입력하세요"
    return tf
  }()
  
  let idTextField: UITextField = {
    let tf = RadiusTextField()
    tf.placeholder = "아이디를 입력하세요"
    return tf
  }()
  
  let passwordTextField: UITextField = {
    let tf = RadiusTextField()
    tf.placeholder = "비밀번호를 입력하세요"
    tf.textContentType = .password
    return tf
  }()
  
  let signUpButton: UIButton = {
    let button = RadiusButton()
    button.setTitle("회원가입", for: .normal)
    button.addTarget(self, action: #selector(signUp), for: .touchUpInside)
    return button
  }()
  
  override func viewDidLoad() {
    super.viewDidLoad()
    
    configureUI()
  }
  
  func configureUI() {
    view.backgroundColor = .black
    navigationController?.navigationBar.tintColor = .red
    
    setupLogoLabel()
    setupTextField()
    setupSignInButton()
  }
  
  func setupLogoLabel() {
    view.addSubview(logoLabel)
    logoLabel.snp.makeConstraints { make in
      make.top.equalTo(view).offset(200)
      make.centerX.equalTo(view)
    }
  }
  
  func setupTextField() {
    view.addSubview(nameTextField)
    view.addSubview(idTextField)
    view.addSubview(passwordTextField)
    
    nameTextField.snp.makeConstraints { make in
      make.centerX.equalTo(view)
      make.centerY.equalTo(view).offset(-100)
      make.width.equalTo(view).multipliedBy(0.7)
      make.height.equalTo(55)
    }
    
    idTextField.snp.makeConstraints { make in
      make.centerX.equalTo(view)
      make.top.equalTo(nameTextField.snp.bottom).offset(13)
      make.width.equalTo(view).multipliedBy(0.7)
      make.height.equalTo(55)
    }
    
    passwordTextField.snp.makeConstraints { make in
      make.centerX.equalTo(view)
      make.top.equalTo(idTextField.snp.bottom).offset(13)
      make.width.equalTo(view).multipliedBy(0.7)
      make.height.equalTo(55)
    }
  }
  
  func setupSignInButton() {
    view.addSubview(signUpButton)
    signUpButton.snp.makeConstraints { make in
      make.top.equalTo(passwordTextField.snp.bottom).offset(15)
      make.centerX.equalTo(view)
      make.width.equalTo(view).multipliedBy(0.7)
      make.height.equalTo(55)
    }
  }
  
  @objc func signUp() {
    let vc = MainViewController()
    let windowScene = UIApplication.shared.connectedScenes.first as? UIWindowScene
    let sceneDelegate = windowScene?.delegate as? SceneDelegate
    let nav = UINavigationController(rootViewController: vc)
    sceneDelegate?.window?.rootViewController = nav
    sceneDelegate?.window?.makeKeyAndVisible()
  }
}

//
//  LoginViewController.swift
//  SeSAC3Week6
//
//  Created by walkerhilla on 2023/08/24.
//

import UIKit
import SnapKit

class LoginViewController: UIViewController {
  
  let logoLabel: UILabel = {
    let label = LogoLabel()
    label.configureUI()
    return label
  }()
  
  let idTextField: UITextField = {
    let tf = RadiusTextField()
    tf.placeholder = "아이디를 입력해주세요."
    return tf
  }()
  
  let passwordTextField: UITextField = {
    let tf = RadiusTextField()
    tf.placeholder = "비밀번호를 입력해주세요."
    return tf
  }()
  
  let rememberMeSwitch: UISwitch = {
    let view = UISwitch()
    view.onTintColor = .red
    view.isOn = true
    return view
  }()
  
  let signUpButton: UIButton = {
    let button = UIButton()
    button.setTitle("회원가입", for: .normal)
    button.setTitleColor(.red, for: .normal)
    button.addTarget(self, action: #selector(signUp), for: .touchUpInside)
    return button
  }()
  
  let signInButton: UIButton = {
    let button = RadiusButton()
    button.setTitle("로그인", for: .normal)
    button.addTarget(self, action: #selector(signIn), for: .touchUpInside)
    return button
  }()
  
  override func viewDidLoad() {
    super.viewDidLoad()

    configureUI()
  }
  
  func configureUI() {
    view.backgroundColor = .black
    setupTextField()
    setupSignInLabel()
    setupSignInButton()
    setupRememberMeSwitch()
    setupsignUpButton()
  }
  
  
  func setupTextField() {
    view.addSubview(idTextField)
    view.addSubview(passwordTextField)
    
    idTextField.snp.makeConstraints { make in
      make.centerX.equalTo(view)
      make.centerY.equalTo(view).offset(-50)
      make.width.equalTo(view).multipliedBy(0.7)
      make.height.equalTo(55)
    }
    
    passwordTextField.snp.makeConstraints { make in
      make.top.equalTo(idTextField.snp.bottom).offset(13)
      make.centerX.equalTo(view)
      make.width.equalTo(view).multipliedBy(0.7)
      make.height.equalTo(52)
    }
  }
  
  func setupSignInButton() {
    view.addSubview(signInButton)
    signInButton.snp.makeConstraints { make in
      make.top.equalTo(passwordTextField.snp.bottom).offset(15)
      make.centerX.equalTo(view)
      make.width.equalTo(view).multipliedBy(0.7)
      make.height.equalTo(55)
    }
  }
  
  func setupSignInLabel() {
    view.addSubview(logoLabel)
    logoLabel.snp.makeConstraints { make in
      make.top.equalTo(view).offset(200)
      make.centerX.equalTo(view)
    }
  }
  
  func setupRememberMeSwitch() {
    view.addSubview(rememberMeSwitch)
    rememberMeSwitch.snp.makeConstraints { make in
      make.top.equalTo(signInButton.snp.bottom).offset(17)
      make.leading.equalTo(passwordTextField.snp.leading)
    }
  }
  
  func setupsignUpButton() {
    view.addSubview(signUpButton)
    signUpButton.snp.makeConstraints { make in
      make.top.equalTo(signInButton.snp.bottom).offset(17)
      make.trailing.equalTo(passwordTextField.snp.trailing)
    }
  }
  
  @objc func signUp() {
    let vc = SignUpViewController()
    navigationController?.pushViewController(vc, animated: true)
  }
  
  @objc func signIn() {
    let vc = MainViewController()
    let windowScene = UIApplication.shared.connectedScenes.first as? UIWindowScene
    let sceneDelegate = windowScene?.delegate as? SceneDelegate
    let nav = UINavigationController(rootViewController: vc)
    sceneDelegate?.window?.rootViewController = nav
    sceneDelegate?.window?.makeKeyAndVisible()
  }
}

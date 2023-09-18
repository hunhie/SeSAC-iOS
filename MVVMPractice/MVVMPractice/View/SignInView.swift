//
//  SignInView.swift
//  MVVMPractice
//
//  Created by walkerhilla on 2023/09/18.
//

import UIKit
import SnapKit

final class SignInView: UIView {
  
  let title: UILabel = {
    let view = UILabel()
    view.text = "JJAPFLIX"
    view.font = .monospacedDigitSystemFont(ofSize: 30, weight: .heavy)
    view.textColor = .red
    return view
  }()
  
  let idTextField: UITextField = {
    let view = UITextField()
    let padding = UIView(frame: CGRect(x: 0, y: 0, width: 10, height: 0))
    view.leftView = padding
    view.leftViewMode = .always
    view.placeholder = "아이디를 입력하세요."
    view.layer.cornerRadius = 8
    view.clipsToBounds = true
    view.backgroundColor = .systemGray6
    return view
  }()
  
  let passwordTextField: UITextField = {
    let view = UITextField()
    let padding = UIView(frame: CGRect(x: 0, y: 0, width: 10, height: 0))
    view.leftView = padding
    view.leftViewMode = .always
    view.placeholder = "비밀번호를 입력하세요"
    view.layer.cornerRadius = 8
    view.clipsToBounds = true
    view.backgroundColor = .systemGray6
    return view
  }()
  
  let signInButton: UIButton = {
    let view = UIButton()
    view.setTitle("로그인", for: .normal)
    view.setTitleColor(.black, for: .normal)
    view.layer.cornerRadius = 8
    view.clipsToBounds = true
    view.backgroundColor = .white
    return view
  }()
  
  let signUpButtonLabel: UIButton = {
    let view = UIButton()
    view.setTitle("계정이 없으신가요?", for: .normal)
    view.setTitleColor(.red, for: .normal)
    return view
  }()
  
  
  override init(frame: CGRect) {
    super.init(frame: frame)
    
    configureView()
    setConstraints()
  }
  
  required init?(coder: NSCoder) {
    fatalError("init(coder:) has not been implemented")
  }
  
  private func configureView() {
    backgroundColor = .black
    addSubview(title)
    addSubview(idTextField)
    addSubview(passwordTextField)
    addSubview(signInButton)
    addSubview(signUpButtonLabel)
  }
  
  private func setConstraints() {
    title.snp.makeConstraints { make in
      make.centerX.equalToSuperview()
      make.top.equalToSuperview().offset(100)
    }
    
    idTextField.snp.makeConstraints { make in
      make.centerX.equalToSuperview()
      make.top.equalTo(title.snp.bottom).offset(150)
      make.width.equalToSuperview().multipliedBy(0.7)
      make.height.equalTo(50)
    }
    
    passwordTextField.snp.makeConstraints { make in
      make.centerX.equalToSuperview()
      make.top.equalTo(idTextField.snp.bottom).offset(15)
      make.width.equalToSuperview().multipliedBy(0.7)
      make.height.equalTo(50)
    }
    
    signInButton.snp.makeConstraints { make in
      make.centerX.equalToSuperview()
      make.top.equalTo(passwordTextField.snp.bottom).offset(15)
      make.width.equalToSuperview().multipliedBy(0.7)
      make.height.equalTo(55)
    }
    
    signUpButtonLabel.snp.makeConstraints { make in
      make.top.equalTo(signInButton.snp.bottom).offset(10)
      make.leading.equalTo(signInButton)
    }
  }
}

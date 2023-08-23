//
//  ViewController.swift
//  SeSAC3Week6
//
//  Created by walkerhilla on 2023/08/21.
//

import UIKit
import SnapKit


//1. 뷰 객체 프로퍼티 선언(클래스 인스턴스 생성)
//2. 명시적으로 루트뷰에 추가
//3. 크기와 위치 정의
//4. 속성 정의

// => Frame 환계
// => AutoLayout 스토리보드 대응
// => NSLayoutConstraints -> 코드베이스 대응
class ViewController: UIViewController {
  
  let emailTextField: UITextField = UITextField()
  let passwordTextField: UITextField = UITextField()
  let signButton: UIButton = UIButton()
  
  override func viewDidLoad() {
    super.viewDidLoad()

    setupEmailTextField()
    setupPasswordTextField()
    setupSignButton()
  }
  
  func setupEmailTextField() {
    view.addSubview(emailTextField)
    
    emailTextField.frame = CGRect(x: 50, y: 80, width: UIScreen.main.bounds.width - 100, height: 50)
    
    emailTextField.backgroundColor = .lightGray
    emailTextField.placeholder = "뭐든 입력해보세요."
  }
  
  func setupPasswordTextField() {
    
    view.addSubview(passwordTextField)
    
    passwordTextField.translatesAutoresizingMaskIntoConstraints = false
    
    NSLayoutConstraint(item: passwordTextField, attribute: .leading, relatedBy: .equal, toItem: view.safeAreaLayoutGuide, attribute: .leading, multiplier: 1, constant: 50).isActive = true
    NSLayoutConstraint(item: passwordTextField, attribute: .trailing, relatedBy: .equal, toItem: view.safeAreaLayoutGuide, attribute: .trailing, multiplier: 1, constant: -50).isActive = true
    NSLayoutConstraint(item: passwordTextField, attribute: .top, relatedBy: .equal, toItem: view.safeAreaLayoutGuide, attribute: .top, multiplier: 1, constant: 60).isActive = true
    
    passwordTextField.backgroundColor = .brown
  }
  
  func setupSignButton() {
    view.addSubview(signButton)
    signButton.translatesAutoresizingMaskIntoConstraints = false
    signButton.backgroundColor = .blue
    signButton.addTarget(self, action: #selector(signButtonTapped), for: .touchUpInside)
    
    NSLayoutConstraint.activate([
      signButton.centerXAnchor.constraint(equalTo: view.centerXAnchor),
      signButton.widthAnchor.constraint(equalToConstant: 300),
      signButton.heightAnchor.constraint(equalToConstant: 50),
      signButton.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor)
    ])
  }
  
  @objc func signButtonTapped() {
    let vc = LocationViewController()
//    let nav = UINavigationController(rootViewController: vc)
    present(vc, animated: true)
  }
  
}


//
//  CustomViewController.swift
//  SeSAC3Week6
//
//  Created by walkerhilla on 2023/08/24.
//

import UIKit
import SnapKit

class CustomViewController: UIViewController {
  
  let idTextField: UITextField = {
    let tf = BlackRadiusTextField()
    tf.placeholder = "아이디를 입력해주세요."
    return tf
  }()
  
  let passwordTextField: UITextField = {
    let tf = BlackRadiusTextField()
    tf.placeholder = "비밀번호를 입력해주세요."
    return tf
  }()
  
  override func viewDidLoad() {
    super.viewDidLoad()
    
    view.backgroundColor = .white
    view.addSubview(idTextField)
    view.addSubview(passwordTextField)
    
    idTextField.snp.makeConstraints { make in
      make.centerX.centerY.equalTo(view)
      make.width.equalTo(view).multipliedBy(0.7)
      make.height.equalTo(55)
    }
    
    passwordTextField.snp.makeConstraints { make in
      make.top.equalTo(idTextField.snp.bottom).offset(20)
      make.centerX.equalTo(view)
      make.width.equalTo(view).multipliedBy(0.7)
      make.height.equalTo(55)
    }
    
  }
  

}

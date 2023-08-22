//
//  TextViewController.swift
//  SeSAC3Week6
//
//  Created by walkerhilla on 2023/08/22.
//

import UIKit
import SnapKit

class TextViewController: UIViewController {
  
  let photoImageView = {
    let view = UIImageView()
    view.backgroundColor = .systemMint
    view.contentMode = .scaleAspectFill
    return view
  }()
  let titleTextField = {
    let tf = UITextField()
    tf.borderStyle = .none
    tf.layer.borderColor = UIColor.black.cgColor
    tf.layer.borderWidth = 1
    tf.placeholder = "제목을 입력하세요."
    tf.textAlignment = .center
    tf.font = .boldSystemFont(ofSize: 15)
    return tf
  }()
  
  
  override func viewDidLoad() {
    super.viewDidLoad()
    
    view.backgroundColor = .white
    setupImageView()
    setupTextFeild()
  }
  
  func setupImageView() {
    view.addSubview(photoImageView)
    photoImageView.backgroundColor = .blue
    photoImageView.snp.makeConstraints { make in
      make.top.horizontalEdges.equalTo(view.safeAreaLayoutGuide)
      make.height.equalTo(view).multipliedBy(0.3)
    }
  }
  
  func setupTextFeild() {
    view.addSubview(titleTextField)
    titleTextField.snp.makeConstraints { make in
      make.top.equalTo(photoImageView.snp.bottom).offset(20)
      make.horizontalEdges.equalTo(view.safeAreaLayoutGuide).inset(20)
      make.height.equalTo(50)
    }
  }
  
}

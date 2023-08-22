//
//  Example1ViewController.swift
//  SeSAC3Week6
//
//  Created by walkerhilla on 2023/08/22.
//

import UIKit
import SnapKit

class Example1ViewController: UIViewController {
  
  lazy var imageView: UIImageView = {
    let view = UIImageView()
    view.backgroundColor = .systemGray6
    return view
  }()
  
  lazy var titleTextField: UITextField = {
    let tf = UITextField()
    tf.layer.borderColor = UIColor.black.cgColor
    tf.layer.borderWidth = 1
    tf.placeholder = "날짜를 입력해주세요."
    tf.textAlignment = .center
    return tf
  }()
  
  lazy var dateTextField: UITextField = {
    let tf = UITextField()
    tf.layer.borderColor = UIColor.black.cgColor
    tf.layer.borderWidth = 1
    tf.placeholder = "제목을 입력해주세요."
    tf.textAlignment = .center
    return tf
  }()
  
  lazy var memoTextView: UITextView = {
    let view = UITextView()
    view.layer.borderColor = UIColor.black.cgColor
    view.layer.borderWidth = 1
    return view
  }()
  
  override func viewDidLoad() {
    super.viewDidLoad()
    
    configureUI()
  }
  
  func configureUI() {
    view.backgroundColor = .white
    [imageView, titleTextField, dateTextField, memoTextView].forEach { view.addSubview($0) }
    
    setupImageView()
    
  }
  
  func setupImageView() {
    imageView.snp.makeConstraints { make in
      make.top.equalTo(view)
      make.horizontalEdges.equalTo(view).inset(20)
      make.height.equalTo(300)
    }
    
    titleTextField.snp.makeConstraints { make in
      make.top.equalTo(imageView.snp.bottom).offset(20)
      make.horizontalEdges.equalTo(view).inset(20)
      make.height.equalTo(55)
    }
    
    dateTextField.snp.makeConstraints { make in
      make.top.equalTo(titleTextField.snp.bottom).offset(20)
      make.horizontalEdges.equalTo(view).inset(20)
      make.height.equalTo(55)
    }
    
    memoTextView.snp.makeConstraints { make in
      make.top.equalTo(dateTextField.snp.bottom).offset(20)
      make.bottom.equalTo(view.safeAreaLayoutGuide).offset(-20)
      make.horizontalEdges.equalTo(view).inset(20)
    }
  }
}

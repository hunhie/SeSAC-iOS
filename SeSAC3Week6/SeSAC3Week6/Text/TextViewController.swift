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
    view.clipsToBounds = true
    return view
  }()
  
  let picker = UIImagePickerController()
  
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
  
  lazy var cameraButton: UIButton = {
    let button = UIButton()
    let image = UIImage(systemName: "camera")
    button.setImage(image, for: .normal)
    button.addTarget(self, action: #selector(camaraButtonTapped), for: .touchUpInside)
    return button
  }()
  
  override func viewDidLoad() {
    super.viewDidLoad()
    
    view.backgroundColor = .white
    setupImageView()
    setupTextFeild()
    setupCameraButton()
  }
  
  override func viewDidAppear(_ animated: Bool) {
    super.viewDidAppear(animated)
  
  }
  
  func setupImageView() {
    view.addSubview(photoImageView)
    photoImageView.backgroundColor = .blue
    photoImageView.snp.makeConstraints { make in
      make.top.horizontalEdges.equalTo(view.safeAreaLayoutGuide)
      make.height.lessThanOrEqualTo(350)
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
  
  func setupCameraButton() {
    view.addSubview(cameraButton)
    cameraButton.snp.makeConstraints { make in
      make.top.equalTo(titleTextField.snp.bottom).offset(20)
      make.centerX.equalTo(view)
      make.size.equalTo(40)
    }
  }
  
  @objc func camaraButtonTapped() {
    let type: UIImagePickerController.SourceType = .camera
    
//    guard UIImagePickerController.isSourceTypeAvailable(type) else {
//      print("갤러리 사용 불가")
//      return
//    }
//    picker.delegate = self
//    picker.sourceType = type
//    picker.allowsEditing = true
    
    let picker = UIColorPickerViewController()
            
    present(picker, animated: true)
  }
  
}

extension TextViewController: UIImagePickerControllerDelegate, UINavigationControllerDelegate {
  func imagePickerControllerDidCancel(_ picker: UIImagePickerController) {
    print("취소 누름")
    dismiss(animated: true)
  }
  
  func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
    print(info)
    
    if let image = info[UIImagePickerController.InfoKey.editedImage] as? UIImage {
      self.photoImageView.image = image
    }
    
    dismiss(animated: true)
  }
}

//
//  TitleViewController.swift
//  SeSAC3PhotoGram
//
//  Created by walkerhilla on 2023/08/29.
//

import UIKit

class TitleViewController: BaseViewController {
  
  let textfield = {
    let view = UITextField()
    view.placeholder = "제목을 입력해주세요"
    return view
  }()
  
  var completionHandler: ((String) -> Void)?
  
  override func viewDidLoad() {
    super.viewDidLoad()
    
  }
  
  override func viewDidDisappear(_ animated: Bool) {
    super.viewDidDisappear(animated)
   
    completionHandler?(textfield.text ?? "")
  }
  
  override func configureView() {
    super.configureView()
    
    view.addSubview(textfield)
    
    navigationItem.rightBarButtonItem = UIBarButtonItem(title: "완료", style: .plain, target: self, action: #selector(doneButtonTapped))
  }
  
  override func setConstraints() {
    textfield.snp.makeConstraints { make in
      make.top.horizontalEdges.equalTo(view.safeAreaLayoutGuide).inset(10)
      make.height.equalTo(50)
    }
  }
  
  @objc func doneButtonTapped() {
    print(#function)
    completionHandler?(textfield.text ?? "")
    navigationController?.popViewController(animated: true)
  }
}

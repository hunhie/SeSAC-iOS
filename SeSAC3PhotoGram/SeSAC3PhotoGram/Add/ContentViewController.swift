//
//  ContentViewController.swift
//  SeSAC3PhotoGram
//
//  Created by walkerhilla on 2023/08/29.
//

import UIKit

class ContentViewController: BaseViewController {
  
  let textview = {
    let view = UITextView()
    view.backgroundColor = .lightGray
    return view
  }()
  
  var completionHandler: ((String) -> Void)?
  
  override func viewDidDisappear(_ animated: Bool) {
    super.viewDidDisappear(animated)
    
    completionHandler?(textview.text)
  }
  
  override func configureView() {
    super.configureView()
    
    view.addSubview(textview)
  }
  
  override func setConstraints() {
    textview.snp.makeConstraints { make in
      make.edges.equalTo(view.safeAreaLayoutGuide).inset(10)
    }
  }
}

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
  
  let sampleview = {
    let view = UIView()
    view.backgroundColor = .yellow
    return view
  }()
  
  var completionHandler: ((String) -> Void)?
  
  deinit {
    print("deinit: \(self)")
  }
  
  func setAnimation() {

  }
  
  override func viewDidLoad() {
    super.viewDidLoad()
    
    completionHandler?("안녕하세요")
  }
  
  override func viewDidDisappear(_ animated: Bool) {
    super.viewDidDisappear(animated)
    
//    completionHandler?(textview.text)
  }
  
  override func configureView() {
    super.configureView()
    
    view.addSubview(textview)
    view.addSubview(sampleview)
    
    setAnimation()
  }
  
  override func setConstraints() {
    textview.snp.makeConstraints { make in
      make.edges.equalTo(view.safeAreaLayoutGuide).inset(10)
    }
    sampleview.snp.makeConstraints { make in
      make.top.horizontalEdges.equalTo(view.safeAreaLayoutGuide).inset(10)
      make.height.equalTo(100)
    }
  }
}


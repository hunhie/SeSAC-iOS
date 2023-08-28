//
//  BaseViewController.swift
//  SeSAC3PhotoGram
//
//  Created by walkerhilla on 2023/08/28.
//

import UIKit
import SnapKit

class BaseViewController: UIViewController {
  
  override func viewDidLoad() {
    super.viewDidLoad()
    
    configureView()
    setConstraints()
  }
  
  
  func configureView() {
    print(#function)
    view.backgroundColor = .white
  }
  
  func setConstraints() {
    print(#function)
  }
}

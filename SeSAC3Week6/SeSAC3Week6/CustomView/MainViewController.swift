//
//  MainViewController.swift
//  SeSAC3Week6
//
//  Created by walkerhilla on 2023/08/24.
//

import UIKit
import SnapKit

class MainViewController: UIViewController {
  
  let label: UILabel = {
    let label = UILabel()
    label.text = "메인 화면입니다"
    label.textColor = .red
    return label
  }()
  
  override func viewDidLoad() {
    super.viewDidLoad()
    
    configureUI()
  }
  
  func configureUI() {
    view.backgroundColor = .black
    view.addSubview(label)
    label.snp.makeConstraints { make in
      make.centerX.centerY.equalTo(view)
    }
  }

}

//
//  GenericViewController.swift
//  SeSAC3Week6
//
//  Created by walkerhilla on 2023/08/24.
//

import UIKit
import SnapKit

class GenericViewController: UIViewController {
  
  let sampleLabel: UILabel = {
    let label = UILabel()
    return label
  }()
  
  let sampleButton: UIButton = {
    let button = UIButton()
    button.setTitle("이동하기", for: .normal)
    button.addTarget(self, action: #selector(buttonTapped), for: .touchUpInside)
    return button
  }()
  
  override func viewDidLoad() {
    super.viewDidLoad()

    configureUI()
  }
  
  func configureUI() {
    view.backgroundColor = .white
    
    setupLabel()
    setupButton()
  }
  
  func setupLabel() {
    view.addSubview(sampleLabel)
    sampleLabel.backgroundColor = .yellow
    configureBorder(view: sampleLabel)
    sampleLabel.snp.makeConstraints { make in
      make.horizontalEdges.equalToSuperview().inset(100)
      make.top.equalTo(view.safeAreaLayoutGuide).offset(20)
      make.height.equalTo(35)
    }
  }
  
  func setupButton() {
    view.addSubview(sampleButton)
    sampleButton.backgroundColor = .green
    sampleButton.snp.makeConstraints { make in
      make.horizontalEdges.equalToSuperview().inset(100)
      make.top.equalTo(sampleLabel.snp.bottom).offset(20)
      make.height.equalTo(60)
    }
  }
  
  @objc func buttonTapped() {
    transition(viewController: TextViewController(), style: .present(.withNavigation))
  }
}

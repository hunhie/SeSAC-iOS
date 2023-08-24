//
//  RadiusButton.swift
//  SeSAC3Week6
//
//  Created by walkerhilla on 2023/08/24.
//

import UIKit

class RadiusButton: UIButton {
  
  override init(frame: CGRect) {
    super.init(frame: frame)
    
    configureUI()
  }
  
  required init?(coder: NSCoder) {
    fatalError("init(coder:) has not been implemented")
  }
  
  func configureUI() {
    layer.cornerRadius = 8
    clipsToBounds = true
    backgroundColor = .systemBlue
  }
}

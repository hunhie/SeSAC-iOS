//
//  LogoLabel.swift
//  SeSAC3Week6
//
//  Created by walkerhilla on 2023/08/24.
//

import UIKit

class LogoLabel: UILabel {
  
  override init(frame: CGRect) {
    super.init(frame: frame)
    
    configureUI()
  }
  
  required init?(coder: NSCoder) {
    fatalError("init(coder:) has not been implemented")
  }
  
  func configureUI() {
    text = "JACKFLIX"
    textColor = .red
    font = .monospacedDigitSystemFont(ofSize: 45, weight: .heavy)
  }
}

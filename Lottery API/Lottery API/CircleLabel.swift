//
//  CircleLabel.swift
//  Lottery API
//
//  Created by walkerhilla on 2023/09/13.
//

import UIKit

final class CircleLabel: UILabel {
  override init(frame: CGRect) {
    super.init(frame: frame)
    
    configureView()
  }
  
  required init?(coder: NSCoder) {
    fatalError("init(coder:) has not been implemented")
  }
  
  private func configureView() {
    font = .monospacedDigitSystemFont(ofSize: 15, weight: .heavy)
    textColor = .white
    textAlignment = .center
    clipsToBounds = true
    layer.cornerRadius = 20
  }
}


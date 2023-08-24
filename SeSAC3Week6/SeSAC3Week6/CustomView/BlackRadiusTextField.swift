//
//  BlackRadiusTextField.swift
//  SeSAC3Week6
//
//  Created by walkerhilla on 2023/08/24.
//

import UIKit

class BlackRadiusTextField: UITextField {
  
  override init(frame: CGRect) {
    super.init(frame: frame)
    
    configureView()
  }
  
  //NSCoding 프로토콜에 선언된 이니셜라이저
  //XIB -> NIB 변환 과정에서 객체 생성 시 필요한 init 구문 (storyboard)
  //Interface Builder에서 생성된 뷰들이 초기화될 때 실행되는 구문!
  required init?(coder: NSCoder) {
    fatalError("init(coder:) has not been implemented")
  }
  
  func configureView() {
    borderStyle = .none
    layer.borderColor = UIColor.black.cgColor
    layer.borderWidth = 1
    layer.cornerRadius = 8
    textColor = .black
    textAlignment = .center
    font = .boldSystemFont(ofSize: 15)
  }
}

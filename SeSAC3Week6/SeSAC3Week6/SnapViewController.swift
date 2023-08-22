//
//  SnapViewController.swift
//  SeSAC3Week6
//
//  Created by walkerhilla on 2023/08/22.
//

import UIKit
import SnapKit

class SnapViewController: UIViewController {
  
  let redView = UIView()
  let whiteView = UIView()
  let blueView = UIView()
  let yellowView = UIView()
  
  override func viewDidLoad() {
    super.viewDidLoad()
   
    view.backgroundColor = .white
    setupView()
  }
  
  func setupView() {
    view.addSubview(redView)
    view.addSubview(whiteView)
    view.addSubview(blueView)
    blueView.addSubview(yellowView)
    
    redView.backgroundColor = .red
    redView.snp.makeConstraints { make in
      make.width.equalTo(200)
      make.height.equalTo(150)
      make.centerX.equalTo(view)
      make.bottom.equalTo(-50)
    }
    
    whiteView.backgroundColor = .systemGray6
    whiteView.snp.makeConstraints { make in
      make.top.equalTo(view.safeAreaLayoutGuide)
      make.leading.equalTo(view.safeAreaLayoutGuide)
      make.trailing.equalTo(view.safeAreaLayoutGuide)
      make.height.equalTo(200)
    }
    
    blueView.backgroundColor = .blue
    blueView.snp.makeConstraints { make in
      make.center.equalTo(view)
      make.size.equalTo(200)
    }
    
    yellowView.backgroundColor = .yellow
    yellowView.snp.makeConstraints { make in
      make.edges.equalTo(blueView).inset(50)
    }
    
    
  }
}

//
//  AddView.swift
//  SeSAC3PhotoGram
//
//  Created by walkerhilla on 2023/08/28.
//

import UIKit

class AddView: BaseView {
  
  let photoImageView = {
    let view = UIImageView()
    view.backgroundColor = .lightGray
    view.contentMode = .scaleAspectFill
    return view
  }()
  
  let searchButton = {
    let view = UIButton()
    view.backgroundColor = .systemGreen
    return view
  }()
  
  let searchProtocolButton = {
    let view = UIButton()
    view.backgroundColor = .systemBrown
    return view
  }()
  
  
  let dateButton = {
    let view = UIButton()
    view.backgroundColor = .systemGreen
    return view
  }()
  
  let titleButton = {
    let view = UIButton()
    view.backgroundColor = .systemBlue
    view.setTitle("오늘의 사진", for: .normal)
    return view
  }()
  
  let contentButton = {
    let view = UIButton()
    view.backgroundColor = .systemRed
    view.setTitle("컨텐츠", for: .normal)
    return view
  }()
  
  override func configureView() {
    addSubview(photoImageView)
    addSubview(searchButton)
    addSubview(dateButton)
    addSubview(searchProtocolButton)
    addSubview(titleButton)
    addSubview(contentButton)
    
    dateButtonSetTitle()
  }
  
  override func setConstraints() {
    super.setConstraints()
    photoImageView.snp.makeConstraints { make in
      make.top.equalTo(self.safeAreaLayoutGuide)
      make.horizontalEdges.equalTo(self).inset(10)
      make.height.equalTo(self).multipliedBy(0.3)
    }
    
    searchButton.snp.makeConstraints { make in
      make.size.equalTo(50)
      make.bottom.trailing.equalTo(photoImageView)
    }
    
    dateButton.snp.makeConstraints { make in
      make.top.equalTo(photoImageView.snp.bottom).offset(10)
      make.horizontalEdges.equalToSuperview().inset(10)
      make.height.equalTo(55)
    }
    
    searchProtocolButton.snp.makeConstraints { make in
      make.size.equalTo(50)
      make.bottom.leading.equalTo(photoImageView)
    }
    
    titleButton.snp.makeConstraints { make in
      make.top.equalTo(dateButton.snp.bottom).offset(10)
      make.horizontalEdges.equalToSuperview().inset(10)
      make.height.equalTo(55)
    }
    
    contentButton.snp.makeConstraints { make in
      make.top.equalTo(titleButton.snp.bottom).offset(10)
      make.horizontalEdges.equalTo(self).inset(10)
      make.height.equalTo(50)
    }
  }
  
  func dateButtonSetTitle() {
    dateButton.setTitle(DateFormatter.today(), for: .normal)
  }
}

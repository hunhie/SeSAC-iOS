//
//  DateView.swift
//  SeSAC3PhotoGram
//
//  Created by walkerhilla on 2023/08/29.
//

import UIKit

class DateView: BaseView {
  
  let picker = {
    let view = UIDatePicker()
    view.datePickerMode = .date
    view.preferredDatePickerStyle = .wheels
    return view
  }()
  
  override func configureView() {
    super.configureView()
    
    addSubview(picker)
  }
  
  override func setConstraints() {
    super.setConstraints()
    
    picker.snp.makeConstraints { make in
      make.top.equalTo(self.safeAreaLayoutGuide)
      make.horizontalEdges.equalTo(self).inset(10)
    }
  }
}

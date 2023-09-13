//
//  LottoView.swift
//  Lottery API
//
//  Created by walkerhilla on 2023/09/13.
//

import UIKit
import SnapKit

final class LottoView: UIView {
  
  override init(frame: CGRect) {
    super.init(frame: frame)
    
    configureView()
    setConstraints()
  }
  
  required init?(coder: NSCoder) {
    fatalError("init(coder:) has not been implemented")
  }
  
  lazy var pickerView = UIPickerView()
  
  lazy var seriesField: UITextField = {
    let view = UITextField()
    view.inputView = pickerView
    view.tintColor = .clear
    view.textAlignment = .center
    
    return view
  }()
  
  lazy var numbersView: UIStackView = {
    let view = UIStackView()
    view.axis = .horizontal
    view.spacing = 4
    view.alignment = .fill
    view.distribution = .fillEqually
    numberLabels.forEach { label in
      view.addArrangedSubview(label)
    }
    view.addArrangedSubview(plusView)
    view.addArrangedSubview(bonusNumber)
    return view
  }()
  
  lazy var numberLabels: [CircleLabel] = {
    let labels = (0...5).map{ _ in CircleLabel() }
    return labels
  }()
  
  lazy var plusView: UIView = {
    let view = UIView()
    view.addSubview(plusImageView)
    return view
  }()
  
  lazy var plusImageView: UIImageView = {
    let view = UIImageView()
    view.image = UIImage(systemName: "plus")
    view.contentMode = .scaleAspectFit
    view.preferredSymbolConfiguration = .init(pointSize: 20)
    view.tintColor = .gray
    return view
  }()
  
  lazy var bonusNumber: UILabel = {
    let view = CircleLabel()
    return view
  }()
  
  private func configureView() {
    backgroundColor = .white
    addSubview(numbersView)
    addSubview(seriesField)
  }
  
  private func setConstraints() {
    numbersView.snp.makeConstraints { make in
      make.centerX.centerY.equalToSuperview()
      make.leading.trailing.equalToSuperview().inset(20)
      make.height.equalTo(40)
    }
    
    seriesField.snp.makeConstraints { make in
      make.bottom.equalTo(numbersView.snp.top).offset(-15)
      make.centerX.equalToSuperview()
    }
    
    plusImageView.snp.makeConstraints { make in
      make.centerX.centerY.equalToSuperview()
      make.width.equalTo(plusImageView.snp.height).multipliedBy(1)
    }
  }
  
  func setData(_ lotto: Lotto) {
    for i in 0...5 {
      let number = lotto.numbers[i]
      self.numberLabels[i].text = "\(number)"
      self.numberLabels[i].setBackgroundColor(number: number)
    }
    self.bonusNumber.text = "\(lotto.bnusNo)"
    self.bonusNumber.setBackgroundColor(number: lotto.bnusNo)
    self.seriesField.text = "\(lotto.drwNo)회 당첨결과"
  }
}

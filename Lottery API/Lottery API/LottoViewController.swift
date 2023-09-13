//
//  LottoViewController.swift
//  Lottery API
//
//  Created by walkerhilla on 2023/08/08.
//

import UIKit
import Alamofire
import SwiftyJSON

final class LottoViewController: UIViewController {
  
  let mainView = LottoView()
  let viewModel = LottoViewModel()
  let drwNo: [Int] = (1...1079).reversed()
  
  override func viewDidLoad() {
    super.viewDidLoad()
    
    mainView.pickerView.delegate = self
    mainView.pickerView.dataSource = self
    mainView.seriesField.delegate = self
    
    addTapGestureForEndEditing()
    
    viewModel.lotto.bind { lotto in
      guard let lotto else { return }
      self.mainView.setData(lotto)
    }
    
    fetchData(drwNo[0])
  }
  
  override func loadView() {
    super.loadView()
    
    self.view = mainView
  }
  
  //MARK: - API Call Request
  
  func fetchData(_ drwNo: Int) {
    LottoAPIManager.shared.callRequest(drwNo: drwNo) { [weak self] lotto in
      guard let self else { return }
      self.viewModel.lotto.value = lotto
    }
  }

}

extension LottoViewController: UIPickerViewDelegate, UIPickerViewDataSource {
  func numberOfComponents(in pickerView: UIPickerView) -> Int {
    1
  }
  
  func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
    return drwNo.count
  }
  
  
  func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
    fetchData(drwNo[row])
  }
  
  func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
    return "\(drwNo[row])"
  }
}

extension LottoViewController: UITextFieldDelegate {
  func textField(_ textField: UITextField, shouldChangeCharactersIn range: NSRange, replacementString string: String) -> Bool {
    return false
  }
}

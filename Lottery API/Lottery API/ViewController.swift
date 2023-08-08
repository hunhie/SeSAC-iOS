//
//  ViewController.swift
//  Lottery API
//
//  Created by walkerhilla on 2023/08/08.
//

import UIKit
import Alamofire
import SwiftyJSON

final class ViewController: UIViewController {
  
  @IBOutlet var numberViews: [UILabel]!
  @IBOutlet weak var plusImageView: UIImageView!
  @IBOutlet weak var seriesField: UITextField!
  
  let pickerView = UIPickerView()
  
  let drwNo: [Int] = (1...1079).reversed()
  
  override func viewDidLoad() {
    super.viewDidLoad()
    
    pickerView.delegate = self
    pickerView.dataSource = self
    seriesField.inputView = pickerView
    seriesField.delegate = self
    seriesField.tintColor = .clear
    seriesField.textAlignment = .center
    
    configureUI()
    callRequest(drwNo: drwNo[0])
  }
  
  func configureUI() {
    setupNumberViews()
    setupPlusImageView()
  }
  
  func setupNumberViews() {
    numberViews.forEach { label in
      label.font = .monospacedDigitSystemFont(ofSize: 15, weight: .heavy)
      label.textColor = .white
      label.textAlignment = .center
      label.layer.cornerRadius = label.frame.size.width/2
      label.clipsToBounds = true
    }
  }
  
  func setupPlusImageView() {
    plusImageView.preferredSymbolConfiguration = .init(pointSize: 20)
    plusImageView.tintColor = .gray
  }
  
  //MARK: - API Call Request
  
  func callRequest(drwNo: Int) {
    let url = "https://www.dhlottery.co.kr/common.do?method=getLottoNumber&drwNo=\(drwNo)"
    AF.request(url, method: .get).validate().responseJSON { response in
      switch response.result {
      case .success(let value):
        let json = JSON(value)
        print(json)
        
        for i in 0...5 {
          let number = json["drwtNo\(i+1)"].intValue
          self.numberViews[i].text = "\(number)"
          self.numberViews[i].setBackgroundColor(number: number)
        }
        
        let number = json["bnusNo"].intValue
        self.numberViews[6].text = "\(number)"
        self.numberViews[6].setBackgroundColor(number: number)
        
        let serieseNo = json["drwNo"].intValue
        self.seriesField.text = "\(serieseNo)회 당첨결과"
      case .failure(let error):
        print(error)
      }
    }
  }
  
  @IBAction func tapGesture(_ sender: Any) {
    view.endEditing(true)
  }
}

extension ViewController: UIPickerViewDelegate, UIPickerViewDataSource {
  func numberOfComponents(in pickerView: UIPickerView) -> Int {
    1
  }
  
  func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
    return drwNo.count
  }
  
  
  func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
    callRequest(drwNo: drwNo[row])
  }
  
  func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
    return "\(drwNo[row])"
  }
}

extension ViewController: UITextFieldDelegate {
  func textField(_ textField: UITextField, shouldChangeCharactersIn range: NSRange, replacementString string: String) -> Bool {
    return false
  }
}

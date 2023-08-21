//
//  CodableViewController.swift
//  SeSAC3Week5
//
//  Created by walkerhilla on 2023/08/16.
//

import UIKit
import Alamofire

// 컴파일 시 오류 타입을 알 수 있음
enum ValidationError: Error {
  case emptyString
  case isNotInt
  case isNotDate
}

class CodableViewController: UIViewController {
  
  struct Lotto: Codable {
    let totSellamnt: Int
    let returnValue, drwNoDate: String
    let firstWinamnt, drwtNo6, drwtNo4, firstPrzwnerCo: Int
    let drwtNo5, bnusNo, firstAccumamnt, drwNo: Int
    let drwtNo2, drwtNo3, drwtNo1: Int
  }

  struct Translation: Codable {
    let message: Message
  }

  // MARK: - Message
  struct Message: Codable {
    let service, version: String
    let result: Result
    let type: String
    
    enum CodingKeys: String, CodingKey {
      case service = "@service"
      case version = "@version"
      case result
      case type = "@type"
    }
  }

  // MARK: - Result
  struct Result: Codable {
    let engineType, tarLangType, translatedText, srcLangType: String
  }
  
  @IBOutlet weak var textField: UITextField!
  @IBOutlet weak var checkButton: UIButton!
  @IBOutlet weak var tempLabel: UILabel!
  @IBOutlet weak var humidityLabel: UILabel!
  
  var resultText = "Apple"
  
  override func viewDidLoad() {
    super.viewDidLoad()
    
    fetchTranslateData(source: "ko", target: "en", text: "안녕하세요")
    fetchWeatherData()
  }
  
  @IBAction func checkButtonTapped(_ sender: UIButton) {
    guard let text = textField.text else { return }
    
    do {
      let result = try validateUserInput(text: text)
    } catch {
      
    }
  }
  
  func validateUserInput(text: String) throws -> Bool {
    guard text.isEmpty else {
      throw ValidationError.emptyString
    }
    
    guard Int(text) != nil else {
      throw ValidationError.isNotInt
    }
    
    guard checkDateFormat(text: text) else {
      throw ValidationError.isNotDate
    }
    
    return true
  }
  
  func checkDateFormat(text: String) -> Bool {
    let format = DateFormatter()
    format.dateFormat = "yyyyMMdd"
    
    let result = format.date(from: text)
    
    return result == nil ? false : true
  }
  
  //  func fetchLottoData() {
  //    let url = "https://www.dhlottery.co.kr/common.do?method=getLottoNumber&drwNo=1080"
  //
  //    AF.request(url, method: .get).validate()
  //      .responseData { response in
  //        guard let value = response.value else { return }
  //        print("responseData:", value)
  //
  //      }
  //
  //
  //    AF.request(url, method: .get).validate()
  //      .responseString { response in
  //        guard let value = response.value else { return }
  //        print("responseString:", value)
  //      }
  //
  //    AF.request(url, method: .get).validate()
  //      .response { response in
  //        guard let value = response.value else { return }
  //        print("response:", value)
  //      }
  //
  //    AF.request(url, method: .get).validate()
  //      .responseDecodable(of: Lotto.self) { response in
  //        guard let value = response.value else { return }
  //        print("responseDecodable:", value)
  //
  //      }
  //
  //  }
  
  func fetchTranslateData(source: String, target: String, text: String) {
    
    print("fetchTranslateData", source, target, text)
    
    let url = "https://openapi.naver.com/v1/papago/n2mt"
    let header: HTTPHeaders = [
      "X-Naver-Client-Id": Key.naverClientId,
      "X-Naver-Client-Secret": Key.naverClientSecret
    ]
    let parameters: Parameters = [
      "source": source,
      "target": target,
      "text": text
    ]
    
    AF.request(url, method: .post, parameters: parameters, headers: header)
      .validate(statusCode: 200...500)
      .responseDecodable(of: Translation.self) { response in
        
        guard let value = response.value else { return }
        print(value.message.result.translatedText)
      }
  }
  
  func fetchWeatherData() {
    WeatherManager.shared.callReqeustCodable { data in
      self.tempLabel.text = "\(data.main.temp)"
    } failure: { error in
      self.showAlert(title: "에러", message: "삐비빅", button: "알았다") {
        print(self.title)
      }
    }

  }
}

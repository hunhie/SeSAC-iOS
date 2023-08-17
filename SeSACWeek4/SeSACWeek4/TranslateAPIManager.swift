//
//  TranslateAPIManager.swift
//  SeSACWeek4
//
//  Created by walkerhilla on 2023/08/11.
//

import Foundation
import Alamofire
import SwiftyJSON

class TranslateAPIManager {
  
  static let shared = TranslateAPIManager()
  
  private init() { }
  
  func callRequest(text: String, resultString: @escaping (String) -> Void) {
    let url = "https://openapi.naver.com/v1/papago/n2mt"
    let headers = HTTPHeaders([
      "X-Naver-Client-Id": APIKey.naverID,
      "X-Naver-Client-Secret": APIKey.naverSecret
    ])
    let parameters: Parameters = [
      "source": "ko",
      "target": "en",
      "text": text
    ]
    AF.request(url, method: .post, parameters: parameters,headers: headers).validate().responseJSON { response in
      switch response.result {
      case .success(let value):
        let json = JSON(value)
        let text = json["message"]["result"]["translatedText"].stringValue
        resultString(text)
      case .failure(let error):
        print(error)
      }
    }
  }
}

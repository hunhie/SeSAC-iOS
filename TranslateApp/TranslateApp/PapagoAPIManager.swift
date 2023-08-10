//
//  PapagoAPIManager.swift
//  TranslateApp
//
//  Created by walkerhilla on 2023/08/10.
//

import Foundation
import Alamofire
import SwiftyJSON

/// 언어 코드 19개를 나타내는 열거형입니다.
enum LanguageCode: String, CaseIterable {
  case ko
  case ja
  case zhCN
  case zhTW
  case hi
  case en
  case es
  case fr
  case de
  case pt
  case vi
  case id
  case fa
  case ar
  case mm
  case th
  case ru
  case it
  case unk
  
  /// 언어 코드 -> 문자열 변환
  ///
  /// **Return**
  /// - String, 언어 문자열
  func languageString() -> String {
    switch self {
    case .ko:
      return "한국어"
    case .ja:
      return "일본어"
    case .zhCN:
      return "중국어 간체"
    case .zhTW:
      return "중국어 번체"
    case .hi:
      return "힌디어"
    case .en:
      return "영어"
    case .es:
      return "스페인어"
    case .fr:
      return "프랑스어"
    case .de:
      return "독일어"
    case .pt:
      return "포르투갈어"
    case .vi:
      return "베트남어"
    case .id:
      return "인도네시아어"
    case .fa:
      return "페르시아어"
    case .ar:
      return "아랍어"
    case .mm:
      return "미얀마어"
    case .th:
      return "태국어"
    case .ru:
      return "러시아어"
    case .it:
      return "이탈리아어"
    case .unk:
      return "알수없음"
    }
  }
}

struct PapagotAPIManager {
  private let detectUrl = "https://openapi.naver.com/v1/papago/detectLangs"
  private let translateUrl = "https://openapi.naver.com/v1/papago/n2mt"
  
  
  /// 파파고 API 언어 감지
  ///
  /// **Parameters**
  /// - text: String, 어떤 언어인지 확인할 텍스트
  ///
  /// **Return**
  /// - completion: (LanguageCode?) -> Void, 함수 종료 시 실행될 클로저
  func detectLanguage(
    text: String,
    completion: @escaping (LanguageCode?) -> Void) {
    
    guard let url = URL(string: self.detectUrl) else {
      completion(nil)
      return
    }
    
    let parameters: Parameters = [
      "query": text
    ]
    let headers: HTTPHeaders = [
      "X-Naver-Client-Id": APIKeys.naverClientId,
      "X-Naver-Client-Secret": APIKeys.naverClientSecret
    ]
    
    AF.request(url, method: .post, parameters: parameters, headers: headers).validate().responseJSON { response in
      switch response.result {
      case .success(let value):
        let json = JSON(value)
        let langCodeStr = json["langCode"].stringValue
        let langCode = LanguageCode(rawValue: langCodeStr)
        completion(langCode)
      case .failure(let error):
        print(error)
        completion(nil)
      }
    }
  }
  
  /// 파파고 API 번역
  ///
  /// **Parameters**
  /// - source: LanguageCode, 원본 언어의 언어 코드
  /// - target: LanguageCode, 목적 언어의 언어 코드
  /// - text: String, 번역할 텍스트
  ///
  /// **Return**
  /// - completion: (LanguageCode?) -> Void, 함수 종료 시 실행될 클로저
  func translateLanguage(
    source: LanguageCode,
    target: LanguageCode,
    text: String,
    completion: @escaping (String?) -> Void) {
      
    guard let url = URL(string: self.translateUrl) else {
      completion(nil)
      return
    }
    
    let parameters: Parameters = [
      "source": source.rawValue,
      "target": target.rawValue,
      "text": text
    ]
    let headers: HTTPHeaders = [
      "X-Naver-Client-Id": APIKeys.naverClientId,
      "X-Naver-Client-Secret": APIKeys.naverClientSecret
    ]
    AF.request(url, method: .post, parameters: parameters, headers: headers).validate().responseJSON { response in
      switch response.result {
      case .success(let value):
        let json = JSON(value)
        let translatedText = json["message"]["result"]["translatedText"].stringValue
        completion(translatedText)
      case .failure(let error):
        print(error)
        completion("오류 발생, 잠시 후 다시 시도해주세요.")
      }
    }
  }
}

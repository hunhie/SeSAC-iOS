//
//  KakaoAPIManager.swift
//  SeSACWeek4
//
//  Created by walkerhilla on 2023/08/11.
//

import Foundation
import Alamofire
import SwiftyJSON

class KakaoAPIManager {
  
  static let shared = KakaoAPIManager()
  
  private init() { }
  
  let header: HTTPHeaders = ["Authorization": APIKey.kakaoKey]
  
  func callRequest(type: Endpoint, query: String, page: Int, success: @escaping (KakaoVideo) -> (), failure: @escaping (Error) -> ()) {
    
    let text = query.addingPercentEncoding(withAllowedCharacters: .urlQueryAllowed)!
    let page = "&page=\(page)"
    let url = type.requestURL + text + page
    
    AF.request(url, method: .get, headers: header).validate(statusCode: 200...500).responseDecodable(of: KakaoVideo.self) { response in
      switch response.result {
      case .success(let value):
        success(value)
      case .failure(let error):
        failure(error)
      }
    }
  }
  
}

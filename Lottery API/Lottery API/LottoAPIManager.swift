//
//  LottoAPIManager.swift
//  Lottery API
//
//  Created by walkerhilla on 2023/09/13.
//

import Foundation
import Alamofire

final class LottoAPIManager {
  static let shared = LottoAPIManager()
  static let baseURL = "https://www.dhlottery.co.kr/common.do?method=getLottoNumber&drwNo="
  
  private init() { }
  
  func callRequest(drwNo: Int, completion: @escaping (Lotto) -> Void) {
    let url = Self.baseURL + "\(drwNo)"
    AF.request(url, method: .get).validate().responseDecodable(of: Lotto.self) { response in
      switch response.result {
      case .success(let value):
        print(value)
        completion(value)
      case .failure(let error):
        print(error)
      }
    }
  }
}

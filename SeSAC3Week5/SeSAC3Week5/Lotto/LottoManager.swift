//
//  LottoManager.swift
//  SeSAC3Week5
//
//  Created by walkerhilla on 2023/08/17.
//

import Foundation
import Alamofire

//class LottoManager {
//  
//  static let shared = LottoManager()
//  
//  private init()  { }
//  
//  func callLotto(completionHandler: @escaping (Int, Int) -> Void) {
//    let url = "https://www.dhlottery.co.kr/common.do?method=getLottoNumber&drwNo=1080"
//    
//    AF.request(url, method: .get).validate()
//      .responseDecodable(of: Lotto.self) { response in
//        guard let value = response.value else { return }
//        
//        completionHandler(value.firstWinamnt, value.firstAccumamnt)
//      }
//  }
//}

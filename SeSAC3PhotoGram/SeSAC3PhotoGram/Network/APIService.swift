//
//  APIService.swift
//  SeSAC3PhotoGram
//
//  Created by walkerhilla on 2023/08/30.
//

import Foundation

class APIService {
  
  static let shared = APIService()
  
  private init() { }
  
  func callRequest() {
    let url = URL(string: "https://www.dhlottery.co.kr/common.do?method=getLottoNumber&drwNo=1080")
    let request = URLRequest(url: url!)
    
    URLSession.shared.dataTask(with: request) { (data, response, error) in
      print(data, response, error)
    }.resume()
  }
}

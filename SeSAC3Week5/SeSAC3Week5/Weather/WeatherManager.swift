//
//  WeatherManager.swift
//  SeSAC3Week5
//
//  Created by walkerhilla on 2023/08/17.
//

import Foundation
import Alamofire
import SwiftyJSON

class WeatherManager {
  static let shared = WeatherManager()
  
  private init() { }
  
  func callReqeustCodable(success: @escaping (WeatherData) -> Void, failure: @escaping (Error) -> Void) {
    let url = "https://api.openweathermap.org/data/2.5/weather?lat=44.3&lon=10.99&appid=d12a65f0419e10dd8da6bdce6d801a91"
    
    AF.request(url, method: .get).validate().responseDecodable(of: WeatherData.self) { response in
      switch response.result {
      case .success(let value):
        success(value)
      case .failure(let error):
        failure(error)
      }
    }
  }
  
  func callReqeustJSON(completion: @escaping (JSON) -> Void) {
    let url = "https://api.openweathermap.org/data/2.5/weather?lat=44.3&lon=10.99&appid=d12a65f0419e10dd8da6bdce6d801a91"
    
    AF.request(url, method: .get).validate().responseJSON { response in
      switch response.result {
      case .success(let value):
        let json = JSON(value)
        completion(json)
      case .failure(let error):
        print(error)
      }
    }
  }
  
  func callReqeustJSON(completion: @escaping (String, String) -> Void) {
    let url = "https://api.openweathermap.org/data/2.5/weather?lat=44.3&lon=10.99&appid=d12a65f0419e10dd8da6bdce6d801a91"
    
    AF.request(url, method: .get).validate().responseJSON { response in
      switch response.result {
      case .success(let value):
        let json = JSON(value)
        let temp = json["main"]["temp"].doubleValue - 273.15
        let humidity = json["main"]["humidity"].intValue
        
        completion("\(temp)", "\(humidity)")
      case .failure(let error):
        print(error)
      }
    }
  }
}

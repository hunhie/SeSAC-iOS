//
//  Lotto.swift
//  Lottery API
//
//  Created by walkerhilla on 2023/09/13.
//

import Foundation

struct Lotto: Codable {
  let bnusNo, firstWinamnt, firstAccumamnt, drwNo: Int
  let drwtNo1, drwtNo2, drwtNo3, drwtNo4, drwtNo5, drwtNo6: Int
  let totSellamnt: Int
  let returnValue: String
  let firstPrzwnerCo: Int
  let drwNoDate: String
  
  var numbers: [Int] {
    [drwtNo1, drwtNo2, drwtNo3, drwtNo4, drwtNo5, drwtNo6]
  }
}

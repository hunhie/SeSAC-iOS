//
//  KakaoVideo.swift
//  SeSACWeek4
//
//  Created by walkerhilla on 2023/08/17.
//

import Foundation

// MARK: - KakaoVideo
struct KakaoVideo: Codable {
    let meta: Meta
    let documents: [Document]
}

// MARK: - Document
struct Document: Codable {
  let playTime: Int
  let datetime, title: String
  let url: String
  let author: String?
  let thumbnail: String
  
  enum CodingKeys: String, CodingKey {
    case playTime = "play_time"
    case datetime, title, url, author, thumbnail
  }
  
  var contents: String {
    "\(author) | \(playTime)회\n\(datetime)"
  }
}

// MARK: - Meta
struct Meta: Codable {
    let pageableCount, totalCount: Int
    let isEnd: Bool

    enum CodingKeys: String, CodingKey {
        case pageableCount = "pageable_count"
        case totalCount = "total_count"
        case isEnd = "is_end"
    }
}

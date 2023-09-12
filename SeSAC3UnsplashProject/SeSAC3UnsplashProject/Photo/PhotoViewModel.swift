//
//  PhotoViewModel.swift
//  SeSAC3UnsplashProject
//
//  Created by walkerhilla on 2023/09/12.
//

import Foundation

// 뷰모델에는 UIKit을 Import하지 않는다. UI와 관련된 기능X
// 연산, 계산 등 비즈니스 로직만 존재
class PhotoViewModel {
  
  var list = Observable(value: Photo(total: 0, total_pages: 0, results: []))
  
  func fetchPhoto() {
    APIService.shared.searchPhoto(query: "Geforce") { photo in
      guard let photo else { return }
      self.list.value = photo
    }
  }
  
  var rowCount: Int {
    return list.value.results?.count ?? 0
  }
  
  func cellForRowAt(at indexPath: IndexPath) -> PhotoResult {
    return list.value.results![indexPath.row]
  }
}

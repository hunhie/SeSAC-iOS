//
//  Extension+UIImageView.swift
//  BOOKWARM
//
//  Created by walkerhilla on 2023/07/31.
//

import UIKit

extension UIImageView {
  // Data가 무조건 메인 스레드에서 실행되기 때문에 동기로 작업하게 됨. tableView 로딩 시 Data를 통해 불러오는 파일이 클 수록 로딩이 지연되는 문제가 야기됨.
  func load(url: URL) {
    DispatchQueue.global().async { [weak self] in
      if let data = try? Data(contentsOf: url) {
        if let image = UIImage(data: data) {
          DispatchQueue.main.async {
            self?.image = image
          }
        }
      }
    }
  }
}

extension UIViewController {
  // async await을 이용한 방법
  func fetchImage(url: URL) async throws -> UIImage {
      let request = URLRequest(url: url)
      let (data, response) = try await URLSession.shared.data(for: request)
          
      guard let statusCode = (response as? HTTPURLResponse)?.statusCode,
                (200...299).contains(statusCode) else { throw NSError(domain: "fetch error", code: 1004) }
      guard let image = UIImage(data: data) else { throw NSError(domain: "image coverting error", code: 999) }

      return image
  }
}

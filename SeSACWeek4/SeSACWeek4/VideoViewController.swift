//
//  VideoViewController.swift
//  SeSACWeek4
//
//  Created by walkerhilla on 2023/08/08.
//

import UIKit
import Alamofire
import SwiftyJSON
import Kingfisher

class VideoViewController: UIViewController {
  
  @IBOutlet weak var searchBar: UISearchBar!
  @IBOutlet weak var videoTableView: UITableView!
  
  var videoList: [Document] = []
  var page = 1
  
  override func viewDidLoad() {
    super.viewDidLoad()
    
    videoTableView.delegate = self
    videoTableView.dataSource = self
    videoTableView.prefetchDataSource = self
    videoTableView.rowHeight = 140
    
    searchBar.delegate = self
  }
  
  func callRequest(query: String, page: Int) {
    print(page)
    KakaoAPIManager.shared.callRequest(type: .video, query: query, page: page) { data in
      data.documents.forEach { item in
        print(item.title)
        self.videoList.append(item)
      }
      self.videoTableView.reloadData()
    } failure: { error in
      print(error)
    }
  }
}

//UITableViewDataSourcePrefetching: iOS10 이상 사용 가능한 프로토콜, cellForRowAt 메서드가 호출되기 전에 미리 호출됨
extension VideoViewController: UITableViewDataSource, UITableViewDelegate, UITableViewDataSourcePrefetching {
  
  // 셀이 화면에 보이기 직전에 필요한 리소스를 미리 다운 받는 기능
  func tableView(_ tableView: UITableView, prefetchRowsAt indexPaths: [IndexPath]) {
    for indexPath in indexPaths {
      if videoList.count - 1 == indexPath.row && page < 15 {
        page += 1
        callRequest(query: searchBar.text!, page: page)
      }
    }
  }
  
  // 취소 기능
  func tableView(_ tableView: UITableView, cancelPrefetchingForRowsAt indexPaths: [IndexPath]) {
    
  }
  
  
  func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
    videoList.count
  }
  
  func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
    guard let cell = tableView.dequeueReusableCell(withIdentifier: "VideoTableViewCell") as? VideoTableViewCell else { return UITableViewCell() }
    let video = videoList[indexPath.row]
    
    cell.titleLabel.text = video.title
    cell.contentLabel.text = video.contents

    if let url = URL(string: video.thumbnail) {
      cell.thumbnailImageView.kf.setImage(with: url)
    }
    
    return cell
  }
}

extension VideoViewController: UISearchBarDelegate {
  func searchBarSearchButtonClicked(_ searchBar: UISearchBar) {
    self.videoList.removeAll()
    guard let query = searchBar.text else { return }
    callRequest(query: query, page: page)
  }
}

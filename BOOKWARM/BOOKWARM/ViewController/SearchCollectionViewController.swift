//
//  SearchCollectionViewController.swift
//  BOOKWARM
//
//  Created by walkerhilla on 2023/07/31.
//

import UIKit
import Kingfisher
import Alamofire
import SwiftyJSON
import RealmSwift

final class SearchCollectionViewController: UICollectionViewController {
  
  var searchedList: [Book] = []
  var page: Int = 1
  let searchbar = UISearchBar()
  
  override func viewDidLoad() {
    super.viewDidLoad()
    
    collectionView.prefetchDataSource = self
    
    setSearchBar()
    registerCell()
    setLayout()
    callRequest(query: "iOS", page: page)
  }
  
  func setSearchBar() {
    let searchbar = searchbar
    searchbar.delegate = self
    navigationItem.titleView = searchbar
    tabBarController?.tabBar.isHidden = true
  }
  
  func registerCell() {
    let nib = UINib(nibName: "BookCollectionViewCell", bundle: nil)
    collectionView.register(nib, forCellWithReuseIdentifier: "BookCollectionViewCell")
  }
  
  func setLayout() {
    // 컬렉션 뷰의 셀 간의 여백
    let spacing: CGFloat = 16
    
    // 여백을 제외한 셀의 너비 계산
    let width = UIScreen.main.bounds.width - (spacing * 3)
    
    // CollectionViewLayout 객체 생성
    let layout = UICollectionViewFlowLayout()
    
    // 표시할 열/행 갯수만큼 셀 너비에서 나누기
    layout.itemSize = CGSize(width: width / 2, height: width / 2)
    
    // 섹션의 주변 여백 설정
    layout.sectionInset = UIEdgeInsets(top: spacing, left: spacing, bottom: spacing, right: spacing)
    
    collectionView.collectionViewLayout = layout
  }
  
  func callRequest(query: String, page: Int) {
    let query = query.addingPercentEncoding(withAllowedCharacters: .urlQueryAllowed)!
    let url = "https://dapi.kakao.com/v3/search/book?query=\(query)&size=50&page=\(page)"
    let header = HTTPHeaders(["Authorization": "KakaoAK \(APIKeys.kakaoKey)"])
    AF.request(url, method: .get, headers: header).validate().responseJSON { response in
      switch response.result {
      case .success(let value):
        let json = JSON(value)
        let data = json["documents"].arrayValue
        
        data.forEach { item in
          let book = Book(title: item["title"].stringValue, authors: item["authors"][0].stringValue, price: item["price"].intValue, contents: item["contents"].stringValue, thumbnail: item["thumbnail"].stringValue)
          self.searchedList.append(book)
        }
        
        self.collectionView.reloadData()
      case .failure(let error):
        print(error)
      }
    }
  }
  
  @objc func back() {
    dismiss(animated: true)
  }
  
  @objc func liekButtonTapped(_ sender: UIButton) {
    
    collectionView.reloadItems(at: [IndexPath(row: sender.tag, section: 0)])
  }
  
  override func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
    // realm 파일에 접근할 수 있도록, 위치를 찾는 코드
    let realm = try! Realm()
    let book = searchedList[indexPath.item]
    let task = BookTable(title: book.title, author: book.authors, price: book.price, contents: book.contents, thumbnail: book.thumbnail)
    try! realm.write {
      realm.add(task)
    }
    
    navigationController?.popViewController(animated: true)
  }
}
extension SearchCollectionViewController: UICollectionViewDataSourcePrefetching {
  override func numberOfSections(in collectionView: UICollectionView) -> Int {
    return 1
  }
  
  override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
    return searchedList.count
  }
  
  override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
    let book = searchedList[indexPath.row]
    let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "BookCollectionViewCell", for: indexPath) as! BookCollectionViewCell
    
    cell.book = book
    cell.configureCell()
    
    return cell
  }
  
  func collectionView(_ collectionView: UICollectionView, prefetchItemsAt indexPaths: [IndexPath]) {
    for indexPath in indexPaths {
      print( self.searchedList.count - 1, indexPath.row)
      if self.searchedList.count - 1 == indexPath.row && page < 50{
        self.page += 1
        print(searchbar.text!)
        callRequest(query: searchbar.text!, page: page)
        self.collectionView.reloadData()
      }
    }
  }
}

extension SearchCollectionViewController: UISearchBarDelegate {
  func searchBarSearchButtonClicked(_ searchBar: UISearchBar) {
    searchedList.removeAll()
    self.callRequest(query: searchBar.text!, page: page)
    collectionView.reloadData()
  }
}

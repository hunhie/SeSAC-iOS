//
//  SearchCollectionViewController.swift
//  BOOKWARM
//
//  Created by walkerhilla on 2023/07/31.
//

import UIKit

final class SearchCollectionViewController: UICollectionViewController {
  
  var searchedList: [Book] = []
  
  override func viewDidLoad() {
    super.viewDidLoad()
    
    setSearchBar()
    registerCell()
    setLayout()
  }
  
  func setSearchBar() {
    let searchbar = UISearchBar()
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

  @objc func back() {
    dismiss(animated: true)
  }
  
  @objc func liekButtonTapped(_ sender: UIButton) {
    BookInfo.bookData[sender.tag].like.toggle()
    collectionView.reloadItems(at: [IndexPath(row: sender.tag, section: 0)])
  }
}
extension SearchCollectionViewController {
  override func numberOfSections(in collectionView: UICollectionView) -> Int {
    return 1
  }
  
  override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
    return searchedList.count
  }
  
  override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
    let book = searchedList[indexPath.row]
    print(#function, book)
    let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "BookCollectionViewCell", for: indexPath) as! BookCollectionViewCell
    
    cell.backView.backgroundColor = .gray
    cell.book = book
    cell.indexPath = indexPath
    cell.configureCell()
    
    cell.likeButton.addTarget(self, action: #selector(liekButtonTapped(_:)), for: .touchUpInside)
    cell.likeButton.setImage(UIImage(systemName: book.like ? "heart.fill" : "heart"), for: .normal)
    // cell 책 표지 이미지 설정
    if let url = book.bookImage {
      cell.bookImageView.load(url: url)
    }
    
    return cell
  }
}

extension SearchCollectionViewController: UISearchBarDelegate {
  func searchBarSearchButtonClicked(_ searchBar: UISearchBar) {
    searchedList.removeAll()
      let searched = BookInfo.bookData.filter({ $0.title.contains(searchBar.text!) })
      searchedList = searched
      print(searchedList)
      collectionView.reloadData()
    }
}

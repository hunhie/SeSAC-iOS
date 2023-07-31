//
//  BookCollectionViewController.swift
//  BOOKWARM
//
//  Created by walkerhilla on 2023/07/31.
//

import UIKit

class BookCollectionViewController: UICollectionViewController {
  
  override func viewDidLoad() {
    super.viewDidLoad()
    
    setLayout()
    registerNib()
  }
  
  func registerNib() {
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
  
  override func numberOfSections(in collectionView: UICollectionView) -> Int {
    return 1
  }
  
  override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
    return BookInfo.dataCount
  }
  
  override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
    let book = BookInfo.bookData[indexPath.row]
    
    guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "BookCollectionViewCell", for: indexPath) as? BookCollectionViewCell else { return UICollectionViewCell() }
    
    cell.backView.backgroundColor = .gray
    cell.backView.layer.cornerRadius = 8
    cell.backView.clipsToBounds = true
    cell.bookTitleLabel.text = book.title
    cell.bookTitleLabel.textColor = .black
    cell.bookTitleLabel.textAlignment = .natural
    
    return cell
  }
  
}

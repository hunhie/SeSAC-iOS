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
  
  override func viewWillAppear(_ animated: Bool) {
    super.viewWillAppear(animated)
    
    collectionView.reloadData()
  }
  
  @IBAction func searchBarButtonTapped(_ sender: UIBarButtonItem) {
    let sb = UIStoryboard(name: "Main", bundle: nil)
    let vc = sb.instantiateViewController(withIdentifier: "SearchTableViewController") as! SearchTableViewController
    
    let nav = UINavigationController(rootViewController: vc)
    nav.modalPresentationStyle = .fullScreen
    
    present(nav, animated: true)
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
  
  //MARK: - CollectionView Delegate, Datasource
  
  // 컬렉션 뷰 섹션 갯수
  override func numberOfSections(in collectionView: UICollectionView) -> Int {
    return 1
  }
  
  // 섹션 내 아이템 갯수
  override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
    return BookInfo.dataCount
  }
  
  // 아이템 Cell 설정
  override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
    let book = BookInfo.bookData[indexPath.row]
    
    guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "BookCollectionViewCell", for: indexPath) as? BookCollectionViewCell else { return UICollectionViewCell() }
    
    // cell 배경 설정
    cell.backView.backgroundColor = .lightGray
    cell.backView.layer.cornerRadius = 8
    cell.backView.clipsToBounds = true
    
    // cell 책 제목 레이블 설정
    cell.bookTitleLabel.text = book.title
    cell.bookTitleLabel.textColor = .white
    cell.bookTitleLabel.textAlignment = .natural
    
    // cell 책 평점 설정
    cell.bookRateLabel.text = "\(book.rate)"
    cell.bookRateLabel.textColor = .white
    
    // cell 좋아요 버튼 설정
    cell.likeButton.setImage(UIImage(systemName: book.like ? "heart.fill" : "heart"), for: .normal)
    cell.likeButton.tag = indexPath.row
    cell.likeButton.tintColor = .white
    cell.likeButton.addTarget(self, action: #selector(liekButtonTapped(_:)), for: .touchUpInside)
    
    // cell 책 표지 이미지 설정
    if let url = book.bookImage {
      cell.bookImageView.load(url: url)
    }
    
    return cell
  }
  
  override func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
    let book = BookInfo.bookData[indexPath.row]
    let sb = UIStoryboard(name: "Main", bundle: nil)
    let vc = sb.instantiateViewController(withIdentifier: "DetailViewController") as! DetailViewController
    BookInfo.appendRecentBook(book)
    vc.book = book
    vc.indexPath = indexPath
    navigationController?.pushViewController(vc, animated: true)
  }
  
  //MARK: - Action
  
  @objc func liekButtonTapped(_ sender: UIButton) {
    BookInfo.bookData[sender.tag].like.toggle()
    collectionView.reloadItems(at: [IndexPath(row: sender.tag, section: 0)])
  }
}

//
//  FinderViewController.swift
//  BOOKWARM
//
//  Created by walkerhilla on 2023/08/02.
//

import UIKit

final class FinderViewController: UIViewController {
  
  @IBOutlet weak var bestTableVIew: UITableView!
  @IBOutlet weak var recentBookCollectionView: UICollectionView!
  @IBOutlet weak var backView: UIView!
  
  override func viewDidLoad() {
    super.viewDidLoad()
    
    setCollectionView()
    setTableView()
  }
  
  override func viewWillAppear(_ animated: Bool) {
    super.viewWillAppear(animated)
    
    recentBookCollectionView.reloadData()
  }
  
  func setTableView() {
    bestTableVIew.delegate = self
    bestTableVIew.dataSource = self
    
    let nib1 = UINib(nibName: "BestBookTableViewCell", bundle: nil)
    bestTableVIew.register(nib1, forCellReuseIdentifier: "BestBookTableViewCell")
  }
  
  func setCollectionView() {
    recentBookCollectionView.delegate = self
    recentBookCollectionView.dataSource = self
    
    let nib2 = UINib(nibName: "RecentBookCollectionViewCell", bundle: nil)
    recentBookCollectionView.register(nib2, forCellWithReuseIdentifier: "RecentBookCollectionViewCell")
    
    let layout = UICollectionViewFlowLayout()
    layout.itemSize = CGSize(width: 100, height: 140)
    layout.scrollDirection = .horizontal
    layout.sectionInset = UIEdgeInsets(top: 0, left: 10, bottom: 0, right: 10)
    recentBookCollectionView.collectionViewLayout = layout
  }
}

extension FinderViewController: UITableViewDelegate, UITableViewDataSource {
  // MARK: - Table view data source
  
  func numberOfSections(in tableView: UITableView) -> Int {
    // #warning Incomplete implementation, return the number of sections
    return 1
  }
  
  func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
    return 90
  }
  
  func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
    // #warning Incomplete implementation, return the number of rows
    return BookInfo.dataCount
  }
  
  func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
    
    let book = BookInfo.bookData[indexPath.row]
    let cell = tableView.dequeueReusableCell(withIdentifier: "BestBookTableViewCell") as! BestBookTableViewCell
    
    if let image = book.bookImage {
      cell.bookImageView.load(url: image)
    }
    cell.bookTitleLabel.text = book.title
    cell.bookRelease.text = "2022"
    cell.bookPlatform.isHidden = true
    
    return cell
  }
  
  func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
    let book = BookInfo.bookData[indexPath.row]
    let vc = storyboard?.instantiateViewController(withIdentifier: "DetailViewController") as! DetailViewController
    let nav = UINavigationController(rootViewController: vc)
    vc.book = book
    vc.type = .modal
    nav.modalPresentationStyle = .fullScreen
    present(nav, animated: true)
  }
}

extension FinderViewController: UICollectionViewDelegate, UICollectionViewDataSource {
  
  func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
    print(#function)
    return BookInfo.recentBookDataCount
  }
  
  func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
    
    guard BookInfo.recentBookData.count > 0 else { return UICollectionViewCell() }
    let book = BookInfo.recentBookData[indexPath.row]
    let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "RecentBookCollectionViewCell", for: indexPath) as! RecentBookCollectionViewCell
    
    if let image = book.bookImage {
      cell.imageView.load(url: image)
    }
    
    return cell
  }
  
  func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
    let book = BookInfo.recentBookData[indexPath.row]
    let vc = storyboard?.instantiateViewController(withIdentifier: "DetailViewController") as! DetailViewController
    let nav = UINavigationController(rootViewController: vc)
    vc.book = book
    vc.type = .modal
    nav.modalPresentationStyle = .fullScreen
    present(nav, animated: true)
  
  }
}

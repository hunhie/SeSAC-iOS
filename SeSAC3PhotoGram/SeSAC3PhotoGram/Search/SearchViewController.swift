//
//  SearchViewController.swift
//  SeSAC3PhotoGram
//
//  Created by walkerhilla on 2023/08/28.
//

import UIKit

class SearchViewController: BaseViewController {
  
  let mainView = SearchView()
  
  let imageList = ["pencil", "star", "person", "star.fill", "xmark", "moon.fill"]
  
  var delegate: PassDataDelegate?
  
  override func loadView() {
    view = mainView
  }
  
  override func viewDidLoad() {
    super.viewDidLoad()

    
    mainView.searchBar.becomeFirstResponder()
  }
  
  override func configureView() {
    super.configureView()
    
    mainView.collectionView.delegate = self
    mainView.collectionView.dataSource = self
    
  }
  
  override func setConstraints() {
    super.setConstraints()
  
  }
  
}

extension SearchViewController: UICollectionViewDelegate, UICollectionViewDataSource {
  
  func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
    return imageList.count
  }
  
  func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
    guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "SearchCollectionViewCell", for: indexPath) as? SearchCollectionViewCell else { return UICollectionViewCell() }
    
    cell.imageView.backgroundColor = .systemBrown
    cell.imageView.image = UIImage(systemName: imageList[indexPath.item])
    
    return cell
  }
  
  func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
    
    //NotificationCenter.default.post(name: NSNotification.Name("SelectImage"), object: nil, userInfo: ["name": imageList[indexPath.item]])
    
    delegate?.receiveData(image: imageList[indexPath.item])
    
    dismiss(animated: true)
  }
}

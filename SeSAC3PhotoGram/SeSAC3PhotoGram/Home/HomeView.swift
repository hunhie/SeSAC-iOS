//
//  HomeView.swift
//  SeSAC3PhotoGram
//
//  Created by walkerhilla on 2023/08/31.
//

import UIKit
import SnapKit

class HomeView: BaseView {
  
  weak var delegate: HomeViewProtocol?
  
  lazy var collectionView = {
    let view = UICollectionView(frame: .zero, collectionViewLayout: collectionViewLayout())
    view.register(SearchCollectionViewCell.self, forCellWithReuseIdentifier: "SearchCollectionViewCell")
    view.collectionViewLayout = collectionViewLayout()
    view.dataSource = self
    view.delegate = self
    return view
  }()
  
  func collectionViewLayout() -> UICollectionViewFlowLayout {
    let layout = UICollectionViewFlowLayout()
    layout.minimumLineSpacing = 8
    layout.minimumInteritemSpacing = 8
    layout.sectionInset = UIEdgeInsets(top: 0, left: 8, bottom: 0, right: 8)
    let size = UIScreen.main.bounds.width - 40
    layout.itemSize = CGSize(width: size / 4, height: size / 4)
    return layout
  }
  
  override init(frame: CGRect) {
    super.init(frame: frame)
  }
  
  required init?(coder: NSCoder) {
    fatalError("init(coder:) has not been implemented")
  }
  
  override func setConstraints() {
    collectionView.snp.makeConstraints { make in
      make.edges.equalTo(self)
    }
  }
  
  override func configureView() {
    super.configureView()
    
    addSubview(collectionView)
  }
}

extension HomeView: UICollectionViewDelegate, UICollectionViewDataSource {
  func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
    100
  }
  
  func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
    guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "SearchCollectionViewCell", for: indexPath) as? SearchCollectionViewCell else { return UICollectionViewCell() }
    cell.imageView.backgroundColor = .systemBlue
    return cell
  }
  
  func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
    delegate?.didSelectItemAt(indexPath: indexPath)
  }
  
}

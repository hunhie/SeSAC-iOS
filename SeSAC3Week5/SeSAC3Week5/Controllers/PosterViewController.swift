//
//  PosterViewController.swift
//  SeSAC3Week5
//
//  Created by walkerhilla on 2023/08/16.
//

import UIKit
import Alamofire
import SwiftyJSON
import Kingfisher

protocol CollectionViewAtrributeProtocol {
  func configureCollectionView() -> Void
  func configureCollectionViewLayout() -> Void
}

class PosterViewController: UIViewController {
  
  @IBOutlet weak var posterCollectionView: UICollectionView!
  var list: Recommendation = Recommendation(totalPages: 0, totalResults: 0, results: [], page: 0)
  var secondlist: Recommendation = Recommendation(totalPages: 0, totalResults: 0, results: [], page: 0)
  
  override func viewDidLoad() {
    super.viewDidLoad()
    
    configureCollectionView()
    configureCollectionViewLayout()

    let group = DispatchGroup()
    
    group.enter()
    callRecommendation(id:673) { data in
      print("1")
      self.list = data
      group.leave()
    }
    
    group.enter()
    callRecommendation(id:479718) { data in
      print("2")
      self.secondlist = data
      group.leave()
    }
    
    group.notify(queue: .main) {
      print("끝")
      self.posterCollectionView.reloadData()
    }
  }
  
  @IBAction func sendNotification(_ sender: UIButton) {
    let content = UNMutableNotificationContent()
    content.title = "다마고치에게 물을 주세요"
    content.body = "아직 레벨 3이에요"
    content.badge = 100
    
    let trigger = UNTimeIntervalNotificationTrigger(timeInterval: 1, repeats: false)
    let request = UNNotificationRequest(identifier: "\(Date())", content: content, trigger: trigger)
    
    UNUserNotificationCenter.current().add(request) { error in
      print(error)
    }
  }
  
  func callRecommendation(id: Int, completion: @escaping (Recommendation) -> Void) {
    let url = "https://api.themoviedb.org/3/movie/\(id)/recommendations?api_key=6ac53a8220689fcbf5936318b3d1dc31&language=ko-KR"
    
    AF.request(url, method: .get).validate().responseDecodable(of: Recommendation.self) { response in
      switch response.result {
      case .success(let value):
        completion(value)
      case .failure(let error):
        print(error)
      }
    }
  }
  
  func dispatchGroupNotify() {
    let group = DispatchGroup()
    DispatchQueue.global().async(group: group) {
      self.callRecommendation(id:673) { data in
        print("1")
        self.list = data
      }
    }
    DispatchQueue.global().async(group: group) {
      self.callRecommendation(id:479718) { data in
        print("2")
        self.secondlist = data
      }
    }
    group.notify(queue: .main) {
      print("이이잉ㅇ")
      self.posterCollectionView.reloadData()
    }
  }
}

extension PosterViewController: UICollectionViewDelegate, UICollectionViewDataSource {
  func numberOfSections(in collectionView: UICollectionView) -> Int {
    4
  }
  
  func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
    if section == 0 {
      return list.results .count
    } else if section == 1 {
      return secondlist.results.count
    } else {
      return 9
    }
  }
  
  func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
    guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: PosterCollectionViewCell.identifier, for: indexPath) as? PosterCollectionViewCell else { return UICollectionViewCell() }
    
    cell.posterImageView.backgroundColor = UIColor(red: CGFloat.random(in: 0...1), green: CGFloat.random(in: 0...1), blue: CGFloat.random(in: 0...1), alpha: 1)
    
    if indexPath.section == 0 {
      let url = "https://image.tmdb.org/t/p/original/\(self.list.results[indexPath.item].posterPath ?? "")"
      cell.posterImageView.kf.setImage(with: URL(string: url))
    } else if indexPath.section == 1 {
      let url = "https://image.tmdb.org/t/p/original/\(self.secondlist.results[indexPath.item].posterPath ?? "")"
      cell.posterImageView.kf.setImage(with: URL(string: url))
    }
    
    return cell
  }
  
  func collectionView(_ collectionView: UICollectionView, viewForSupplementaryElementOfKind kind: String, at indexPath: IndexPath) -> UICollectionReusableView {
    if kind == UICollectionView.elementKindSectionHeader {
      guard let view = collectionView.dequeueReusableSupplementaryView(ofKind: kind, withReuseIdentifier: HeaderPosterCollectionReusableView.identifier, for: indexPath) as? HeaderPosterCollectionReusableView else { return UICollectionReusableView() }
      view.posterLabel.text = "\(indexPath.section). 헤더"
      view.posterLabel.font = UIFont(name: "FiraCode-Regular", size: 17)
      return view
    } else {
      return UICollectionReusableView()
    }
  }
  
}

extension PosterViewController: CollectionViewAtrributeProtocol {
  func configureCollectionView() {
    posterCollectionView.dataSource = self
    posterCollectionView.delegate = self
    
    posterCollectionView.register(UINib(nibName: PosterCollectionViewCell.identifier, bundle: nil), forCellWithReuseIdentifier: PosterCollectionViewCell.identifier)
    posterCollectionView.register(UINib(nibName: HeaderPosterCollectionReusableView.identifier, bundle: nil), forSupplementaryViewOfKind: UICollectionView.elementKindSectionHeader, withReuseIdentifier: HeaderPosterCollectionReusableView.identifier)
    
  }
  
  func configureCollectionViewLayout() {
    let flowLayout = UICollectionViewFlowLayout()
    flowLayout.itemSize = CGSize(width: 100, height: 100)
    flowLayout.minimumLineSpacing = 8
    flowLayout.minimumInteritemSpacing = 8
    flowLayout.scrollDirection = .vertical
    flowLayout.headerReferenceSize = CGSize(width: 300, height: 50)
    posterCollectionView.collectionViewLayout = flowLayout
  }
}

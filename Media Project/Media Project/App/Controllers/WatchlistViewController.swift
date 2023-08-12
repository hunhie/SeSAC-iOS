//
//  WatchlistViewController.swift
//  Media Project
//
//  Created by walkerhilla on 2023/08/12.
//

import UIKit

final class WatchlistViewController: UIViewController {
  
  //MARK: - IBOutlet Property
  
  @IBOutlet weak var subTitle: UILabel!
  @IBOutlet weak var mainTitle: UILabel!
  @IBOutlet weak var watchlistCollectionView: UICollectionView!
  
  //MARK: - Stored Property
  
  lazy var movieData: [Movie] = []
  
  //MARK: - View Controller Life cycle
  
  override func viewDidLoad() {
    super.viewDidLoad()
    
    configureUI()
    callRequest()
  }
  
  //MARK: - UI setup
  
  func configureUI() {
    
    titleLabel()
    setupTabBar()
    setupSearchButton()
    setupCollectionView()
  }
  
  func titleLabel() {
    subTitle.text = Strings.Watchlist.Watchlist.rawValue
    subTitle.textColor = UIColor(hexCode: Colors.text.stringValue)
    mainTitle.text = Strings.Watchlist.Movies.rawValue
    mainTitle.textColor = UIColor(hexCode: Colors.primary.stringValue)
    mainTitle.font = .monospacedDigitSystemFont(ofSize: 27, weight: .bold)
  }
  
  func setupTabBar() {
    tabBarController?.tabBar.tintColor = UIColor(hexCode: Colors.primary.stringValue)
  }
  
  func setupSearchButton() {
    let image = UIImage(systemName: "magnifyingglass")
    let searchBarButtonItem = UIBarButtonItem(image: image, style: .plain, target: self, action: #selector(searchBarButtonTapped))
    searchBarButtonItem.tintColor = UIColor(hexCode: Colors.primary.stringValue)
    navigationItem.rightBarButtonItem = searchBarButtonItem
  }
  
  func setupCollectionView() {
    watchlistCollectionView.dataSource = self
    watchlistCollectionView.delegate = self
    
    let nib = UINib(nibName: MovieCollectionViewCell.identifier, bundle: nil)
    watchlistCollectionView.register(nib, forCellWithReuseIdentifier: MovieCollectionViewCell.identifier)
    
    let layout = UICollectionViewFlowLayout()
    let spacing: CGFloat = 20
    let width = UIScreen.main.bounds.width - spacing * 3
    layout.itemSize = CGSize(width: width/2, height: width/2 * 1.6)
    layout.minimumLineSpacing = spacing
    layout.minimumInteritemSpacing = spacing
    layout.scrollDirection = .vertical
    layout.sectionInset = UIEdgeInsets(top: 3, left: spacing, bottom: spacing, right: spacing)
    
    watchlistCollectionView.collectionViewLayout = layout
  }
  
  //MARK: - API
  
  func callRequest() {
    MovieAPIManager.shared.callRequest(type: .trending(.day)) { json in
      let list = json["results"].arrayValue
      for item in list {
        let id = item["id"].intValue
        let title = item["title"].stringValue
        let overView = item["overView"].stringValue
        let posterURL = item["poster_path"].stringValue
        let releaseDate = item["release_date"].stringValue
        let rate = item["vote_average"].doubleValue
        let adult = item["adult"].boolValue
        
        let movie = Movie(id: id, title: title, overView: overView, posterPath: posterURL, releaseDate: releaseDate, rate: rate, adult: adult)
        self.movieData.append(movie)
      }
      self.watchlistCollectionView.reloadData()
    }
  }
  
  //MARK: - Actions
  
  @objc func searchBarButtonTapped() {
    print(#function)
  }
}

//MARK: - Extenstion

extension WatchlistViewController: UICollectionViewDelegate, UICollectionViewDataSource {
  func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
    movieData.count
  }
  
  func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
    let movie = movieData[indexPath.row]
    guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: MovieCollectionViewCell.identifier , for: indexPath) as? MovieCollectionViewCell else { return UICollectionViewCell() }

    cell.movie = movie
    cell.configureCell()
    
    return cell
  }
}

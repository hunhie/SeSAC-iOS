//
//  MovieDetailViewController.swift
//  Media Project
//
//  Created by walkerhilla on 2023/08/12.
//

import UIKit

final class MovieDetailViewController: UIViewController {
  
  //MARK: - IBOutlet Property
  
  @IBOutlet weak var tableView: UITableView!
  @IBOutlet weak var backImageView: UIImageView!
  @IBOutlet weak var titleLabel: UILabel!
  @IBOutlet weak var posterImageView: UIImageView!
  @IBOutlet weak var overViewTitleLabel: UILabel!
  @IBOutlet weak var divider: UIView!
  @IBOutlet weak var overViewLabel: UILabel!
  
  //MARK: - Stored Property
  
  var movie: Movie?
  lazy var credits: [[Cast]] = []
  lazy var sections: [SectionType] = [.cast, .crew]
  
  //MARK: - View Controller Life cycle
  
  override func viewDidLoad() {
    super.viewDidLoad()
    
    configureUI()
    callRequest()
  }
  
  
  // MARK: - UI Setup
  
  func configureUI() {
    setupNavigationBar()
    setupTableView()
  }
  
  func setupNavigationBar() {
    navigationController?.navigationBar.topItem?.title = ""
    navigationController?.navigationBar.tintColor = UIColor(hexCode: Colors.primary.stringValue)
    
    let label = UILabel()
    label.text = Strings.Details.MovieDetails.rawValue
    label.textColor = UIColor(hexCode: Colors.primary.stringValue)
    label.font = .monospacedDigitSystemFont(ofSize: 19, weight: .bold)
    self.navigationItem.titleView = label
  }
  
  func setupTableView() {
    tableView.dataSource = self
    tableView.delegate = self
    tableView.rowHeight = 100
    
    registerTableViewCell()
    setupTableHeaderView()
  }
  
  func registerTableViewCell() {
    let castCellNib = UINib(nibName: MovieContributorTableViewCell.identifier, bundle: nil)
    tableView.register(castCellNib, forCellReuseIdentifier: MovieContributorTableViewCell.identifier)
  }
  
  func setupTableHeaderView() {
    guard let movie else { return }

    backImageView.contentMode = .scaleAspectFill
    posterImageView.contentMode = .scaleAspectFill

    titleLabel.text = movie.title
    titleLabel.font = .monospacedDigitSystemFont(ofSize: 21, weight: .bold)
    titleLabel.textColor = UIColor(hexCode: Colors.text.stringValue)

    if let url = URL(string: movie.posterImageURL) {
      posterImageView.kf.setImage(with: url)
    }

    if let url = URL(string: movie.backdropImageURL) {
      backImageView.kf.setImage(with: url)
    }

    setupOverView()
  }
  
  func setupOverView(){
    overViewTitleLabel.text = "OverView"
    overViewTitleLabel.font = .monospacedDigitSystemFont(ofSize: 15, weight: .semibold)
    overViewTitleLabel.textColor = .systemGray

    divider.backgroundColor = UIColor(hexCode: Colors.divider.stringValue)

    guard let movie else { return }

    overViewLabel.text = movie.overview
    print(movie.overview)
    overViewLabel.numberOfLines = 0
    overViewLabel.textColor = UIColor(hexCode: Colors.text.stringValue)
  }
  
  //MARK: - API
  
  func callRequest() {
    guard let movie else { return }
    MovieAPIManager.shared.callRequest(type: .credits(movie.id), responseType: MovieContributor.self) { [weak self] data in
      guard let self,
            let data else { return }
      print(data)
      self.credits = [data.cast, data.crew]
      self.tableView.reloadData()
    }
  }
  
  //MARK: - Actions
}

extension MovieDetailViewController: UITableViewDelegate, UITableViewDataSource {
  func numberOfSections(in tableView: UITableView) -> Int {
    credits.count
  }
  
  func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
    let count = credits[section].count
    return count < 10 ? count : 10
  }
  
  func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
    sections[section].stringValue
  }
  
  func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
    let movieContributor = credits[indexPath.section][indexPath.row]
    
    guard let cell = tableView.dequeueReusableCell(withIdentifier: MovieContributorTableViewCell.identifier) as? MovieContributorTableViewCell else { return UITableViewCell() }
    
    cell.cast = movieContributor
    cell.configureCell()
    
    return cell
  }
  
  func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
    print(#function)
  }
}

extension MovieDetailViewController {
  enum SectionType: String {
    case cast = "Cast"
    case crew = "Crew"
    
    var stringValue: String {
      self.rawValue
    }
  }
}

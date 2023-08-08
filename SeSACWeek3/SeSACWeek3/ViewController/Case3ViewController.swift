//
//  Case3TableViewController.swift
//  SeSACWeek3
//
//  Created by walkerhilla on 2023/07/27.
//

import UIKit

class Case3ViewController: UIViewController {
  
  // MARK: - Properties
  
  @IBOutlet weak var tableView: UITableView!
  @IBOutlet weak var searchView: UIView!
  @IBOutlet weak var searchTextField: UITextField!
  @IBOutlet weak var searchButton: UIButton!
  
  // MARK: - Lifecycle Methods
  
  override func viewDidLoad() {
    super.viewDidLoad()
    
    configureUI()
  }
  
  // MARK: - UI Setup
  
  func configureUI() {
    setupSearchView()
    setupTableView()
  }
  
  func setupSearchView() {
    searchView.layer.cornerRadius = 8
    searchView.clipsToBounds = true
    searchTextField.layer.cornerRadius = 8
    searchTextField.clipsToBounds = true
    searchButton.layer.cornerRadius = 8
    searchButton.clipsToBounds = true
  }
  
  // MARK: - IBActions
  
  @IBAction func searchButtonTapped(_ sender: UIButton) {
    guard let text = searchTextField.text,
          text.count > 0 else { return }

    
    tableView.reloadData()
  }

  // MARK: - Private Methods
  
  func setupTableView() {
    tableView.delegate = self
    tableView.dataSource = self
  }
}


// TableView Extension
extension Case3ViewController: UITableViewDelegate, UITableViewDataSource {
  
  // 섹션 개수
  func numberOfSections(in tableView: UITableView) -> Int {
    return 1
  }
  
  // 섹션 내 로우 개수
  func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
    return TodoInfo.todoData.count
  }
  
  // 로우 높이
  func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
    return 60
  }
  
  
  // 로우 별 셀 설정
  func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
    
    let todo = TodoInfo.todoData[indexPath.row]
    let cell = tableView.dequeueReusableCell(withIdentifier: "case3Cell", for: indexPath) as! Case3Cell
    
    cell.layer.cornerRadius = 8
    cell.clipsToBounds = true
    
    cell.backView.layer.cornerRadius = 8
    cell.backView.clipsToBounds = true
    cell.checkboxImageView.image = UIImage(systemName: todo.done ? "checkmark.square.fill" : "checkmark.square")
    cell.likeButton.setImage(UIImage(systemName: todo.like ? "star.fill" : "star"), for: .normal)
    cell.maintitleLabel.text = todo.maintitle
    cell.subtitleLabel.text = todo.subtitle
    
    return cell
  }
}

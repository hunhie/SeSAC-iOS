//
//  Case3TableViewController.swift
//  SeSACWeek3
//
//  Created by walkerhilla on 2023/07/27.
//

import UIKit

class Case3ViewController: UIViewController {
  
  @IBOutlet weak var tableView: UITableView!
  @IBOutlet weak var searchView: UIView!
  @IBOutlet weak var searchTextField: UITextField!
  @IBOutlet weak var searchButton: UIButton!
  
  var tasks: [String] = ["그립톡 구매하기", "맥북 거치대 구매하기", "애플 워치 구매하기", "아이폰 거치대 구매하기"]
  
  override func viewDidLoad() {
    super.viewDidLoad()
    configureUI()
  }
  
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
  
  func setupTableView() {
    tableView.delegate = self
    tableView.dataSource = self
    
  }
}

extension Case3ViewController: UITableViewDelegate, UITableViewDataSource {
  
  func numberOfSections(in tableView: UITableView) -> Int {
    return 1
  }
  
  func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
    print("실행됨")
    return tasks.count
  }
  
  func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
    return 60
  }
  
  func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
    print(#function)
    let cell = tableView.dequeueReusableCell(withIdentifier: "case3Cell", for: indexPath) as! Case3Cell
    
    cell.layer.cornerRadius = 8
    cell.clipsToBounds = true
    cell.leftImageView.image = UIImage(systemName: "checkmark.square")
    cell.leftImageView.contentMode = .scaleAspectFit
    cell.rowLabel.text = tasks[indexPath.row]
    cell.rightImageView.image = UIImage(systemName: "star.fill")
    
    return cell
  }

}

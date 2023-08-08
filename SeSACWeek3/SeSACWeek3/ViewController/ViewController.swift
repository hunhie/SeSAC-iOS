//
//  ViewController.swift
//  SeSACWeek3
//
//  Created by walkerhilla on 2023/07/27.
//

import UIKit

class ViewController: UITableViewController {
  
  let segues = ["toCase1", "toCase2", "toCase3", "toMovie"]
  let sectionData = Section(title: "과제 목록", rows: ["case 1", "case 2", "case 3", "영화 화면 만들기"])

  override func viewDidLoad() {
    super.viewDidLoad()
    // Do any additional setup after loading the view.
  }

  override func numberOfSections(in tableView: UITableView) -> Int {
    return 1
  }
  
  override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
    return sectionData.rows.count
  }
  
  override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
    let cell = tableView.dequeueReusableCell(withIdentifier: "caseCell")!
    
    cell.textLabel?.text = sectionData.rows[indexPath.row]
    
    return cell
  }

  override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
    performSegue(withIdentifier: segues[indexPath.row], sender: nil)
  }
}


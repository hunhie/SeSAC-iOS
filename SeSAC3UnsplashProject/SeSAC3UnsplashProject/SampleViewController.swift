//
//  SampleViewController.swift
//  SeSAC3UnsplashProject
//
//  Created by walkerhilla on 2023/09/12.
//

import UIKit

struct User {
  let name: String
  let age: Int
}

final class SampleViewController: UIViewController {
  
  @IBOutlet weak var tableView: UITableView!
  
  let viewModel = SampleViewModel()
  var number3 = Observable(value: 10)
  var number4 = Observable(value: 3)
  
  override func viewDidLoad() {
    super.viewDidLoad()
    tableView.dataSource = self
    tableView.delegate = self
  }
}

extension SampleViewController: UITableViewDelegate, UITableViewDataSource {
  func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
    viewModel.numberOfRowInSection
  }
  
  func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
    let cell = tableView.dequeueReusableCell(withIdentifier: "sampleCell")!
    let data = viewModel.cellForRowAt(at: indexPath)
    cell.textLabel?.text = data.name
    return cell
  }
  
  
}

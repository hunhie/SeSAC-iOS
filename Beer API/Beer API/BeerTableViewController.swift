//
//  BeerTableViewController.swift
//  Beer API
//
//  Created by walkerhilla on 2023/08/09.
//

import UIKit
import Alamofire
import SwiftyJSON

final class BeerTableViewController: UIViewController {
  
  @IBOutlet weak var beerTableView: UITableView!
  
  var beers: [Beer] = []
  
  override func viewDidLoad() {
    super.viewDidLoad()
    
    beerTableView.delegate = self
    beerTableView.dataSource = self
    let nib = UINib(nibName: BeerTableViewCell.identifier, bundle: nil)
    beerTableView.register(nib, forCellReuseIdentifier: BeerTableViewCell.identifier)
    beerTableView.rowHeight = 80
    callRequest()
  }
  
  func callRequest() {
    let url = "https://api.punkapi.com/v2/beers"
    AF.request(url, method: .get).validate().responseJSON { response in
      switch response.result {
      case .success(let value):
        let json = JSON(value)
        json.arrayValue.forEach { item in
          let beer = Beer(name: item["name"].stringValue, image: item["image_url"].stringValue, description: item["description"].stringValue)
          self.beers.append(beer)
        }
        self.beerTableView.reloadData()
      case .failure(let error):
        print(error)
      }
    }
  }
  
}

extension BeerTableViewController: UITableViewDelegate, UITableViewDataSource {
  func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
    return beers.count
  }
  
  func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
    let beer = beers[indexPath.row]
    let cell = tableView.dequeueReusableCell(withIdentifier: BeerTableViewCell.identifier) as! BeerTableViewCell
    
    cell.beer = beer
    cell.configureCell()
    
    return cell
  }
  
  
}

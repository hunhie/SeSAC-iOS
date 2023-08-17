//
//  ViewController.swift
//  SeSACWeek4
//
//  Created by walkerhilla on 2023/08/07.
//

import UIKit
import SwiftyJSON
import Alamofire

struct Movie {
  var title: String
  var release: String
}

struct BoxOffice: Codable {
    let boxOfficeResult: BoxOfficeResult
}

// MARK: - BoxOfficeResult
struct BoxOfficeResult: Codable {
    let showRange: String
    let dailyBoxOfficeList: [DailyBoxOfficeList]
    let boxofficeType: String
}

// MARK: - DailyBoxOfficeList
struct DailyBoxOfficeList: Codable {
    let rank, openDt, rankInten, salesShare: String
    let scrnCnt, audiCnt, salesAmt, audiChange: String
    let audiInten, movieNm, audiAcc: String
    let rankOldAndNew: RankOldAndNew
    let movieCD, rnum, showCnt, salesAcc: String
    let salesInten, salesChange: String

    enum CodingKeys: String, CodingKey {
        case rank, openDt, rankInten, salesShare, scrnCnt, audiCnt, salesAmt, audiChange, audiInten, movieNm, audiAcc, rankOldAndNew
        case movieCD = "movieCd"
        case rnum, showCnt, salesAcc, salesInten, salesChange
    }
}

enum RankOldAndNew: String, Codable {
    case old = "OLD"
}

class ViewController: UIViewController {
  
  @IBOutlet weak var searchBar: UISearchBar!
  @IBOutlet weak var movieTableView: UITableView!
  @IBOutlet weak var indicatorView: UIActivityIndicatorView!
  
  var movieList: [Movie] = []
  
  override func viewDidLoad() {
    super.viewDidLoad()
  
    
    movieTableView.rowHeight = 60
    movieTableView.delegate = self
    movieTableView.dataSource = self
    indicatorView.isHidden = true
  }

  func callRequest(date: String) {
    indicatorView.startAnimating()
    indicatorView.isHidden = false
    
    let url = "http://kobis.or.kr/kobisopenapi/webservice/rest/boxoffice/searchDailyBoxOfficeList.json?key=\(APIKey.boxOfficeKey)&targetDt=20120101"
    
    AF.request(url, method: .get).validate().responseDecodable(of: BoxOffice.self) { response in
      print(response.value)
    }
  }
}

extension ViewController: UITableViewDelegate, UITableViewDataSource {
  func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
    return movieList.count
  }
  
  func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
    let cell = tableView.dequeueReusableCell(withIdentifier: "movieCell")!
    
    cell.textLabel?.text = movieList[indexPath.row].title
    cell.detailTextLabel?.text = movieList[indexPath.row].release
    
    return cell
  }

}

extension ViewController: UISearchBarDelegate {
  func searchBarSearchButtonClicked(_ searchBar: UISearchBar) {
    callRequest(date: searchBar.text!)
  }
}

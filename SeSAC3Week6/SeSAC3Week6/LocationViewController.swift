//
//  LocationViewController.swift
//  SeSAC3Week6
//
//  Created by walkerhilla on 2023/08/22.
//

import UIKit
import CoreLocation

class LocationViewController: UIViewController {
  
  let locationManager = CLLocationManager()
  
  
  override func viewDidLoad() {
    super.viewDidLoad()
    
    setupLocationManager()
    configureUI()
    checkDeviceLocationAuthorization()
  }
  
  func setupLocationManager() {
    locationManager.delegate = self
    locationManager.requestWhenInUseAuthorization()
  }
  
  func configureUI() {
    view.backgroundColor = .white
  }
  
  func checkDeviceLocationAuthorization() {
    DispatchQueue.global().async { [weak self] in
      guard let self else { return }
      if CLLocationManager.locationServicesEnabled() {
        // 현재 사용자의 위치 상태를 가지고 옴
        let authorization: CLAuthorizationStatus
        if #available(iOS 14.0, *) {
          authorization = locationManager.authorizationStatus
        } else {
          authorization = CLLocationManager.authorizationStatus()
        }
        checkCurrentLocationAuthorization(status: authorization)
      } else {
        print("위치 서빟스가 꺼져 있어서 위치 권한 요청 못함")
      }
    }
  }
  
  func checkCurrentLocationAuthorization(status: CLAuthorizationStatus) {
    switch status {
    case .authorizedAlways: print("authorizedAlways")
      locationManager.startUpdatingLocation()
    case .notDetermined: print("notDetermined")
      locationManager.requestWhenInUseAuthorization()
    case .authorizedWhenInUse: print("authorizedWhenInUse")
      locationManager.startUpdatingLocation()
      locationManager.requestAlwaysAuthorization()
    case .denied: print("denied")
    case .restricted: print("restricted")
    }
  }
}

extension LocationViewController: CLLocationManagerDelegate {
  func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
    print(locations)
  }
  
  func locationManager(_ manager: CLLocationManager, didFailWithError error: Error) {
    print(error)
  }
  
  // iOS 14 이상
  // 사용자의 권한 상태가 바뀔 때를 알려줌
  func locationManagerDidChangeAuthorization(_ manager: CLLocationManager) {
  }
  
  //iOS 14 미만
  // 사용자의 권한 상태가 바뀔 때를 알려줌
  // 거부했다가 설정에서 변경을 했거나, 혹은 notDetermined 상태에서 허용을 했거나
  // 허용해서 위치를 가져오는 도중에 설정에서 거부를 하고 앱으로 다시 돌아올 때 등
  //  func locationManager(_ manager: CLLocationManager, didChangeAuthorization status: CLAuthorizationStatus) {
  //    print(#fcu)
  //  }
}

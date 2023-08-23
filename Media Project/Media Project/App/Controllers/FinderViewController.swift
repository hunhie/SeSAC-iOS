//
//  FinderViewController.swift
//  Media Project
//
//  Created by walkerhilla on 2023/08/23.
//

import UIKit
import MapKit
import CoreLocation
import SnapKit

class FinderViewController: UIViewController {
  
  let locationManager = CLLocationManager()
  let mapView = MKMapView()
  lazy var filterBarButton: UIBarButtonItem = {
    let button = UIBarButtonItem(title: "filter", style: .done, target: self, action: #selector(filterButtonTapped))
    button.tintColor = UIColor(hexCode: Colors.primary.stringValue)
    return button
  }()
  
  let theaterList = TheaterList()
  
  lazy var currentRegionButton: UIButton = {
    let button = UIButton()
    let config = UIImage.SymbolConfiguration(pointSize: 40, weight: .bold, scale: .medium)
    let image = UIImage(systemName: "location.circle.fill", withConfiguration: config)
    button.setImage(image, for: .normal)
    button.tintColor = UIColor(hexCode: Colors.primary.stringValue)
    button.addTarget(self, action: #selector(setCurrentRegionButtonTapped), for: .touchUpInside)
    return button
  }()
  
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
    tabBarController?.tabBar.backgroundColor = .black
    setMapView()
    setNavigationBarButton()
    setCurrentRegionButton()
    filteredTheater(theater: .all)
  }
  
  func setNavigationBarButton() {
    navigationItem.rightBarButtonItem = filterBarButton
  }
  
  func setMapView() {
    view.addSubview(mapView)
    mapView.delegate = self
    mapView.showsUserLocation = true
    mapView.snp.makeConstraints { make in
      make.edges.equalTo(view)
    }
  }
  
  func setCurrentRegionButton() {
    view.addSubview(currentRegionButton)
    currentRegionButton.snp.makeConstraints { make in
      make.leading.equalTo(view.safeAreaLayoutGuide.snp.leading).offset(16)
      make.bottom.equalTo(view.safeAreaLayoutGuide.snp.bottom).offset(-30)
    }
  }
  
  func checkDeviceLocationAuthorization() {
    DispatchQueue.global().async { [weak self] in
      guard let self else { return }
      if CLLocationManager.locationServicesEnabled() {
        let authorization: CLAuthorizationStatus
        if #available(iOS 14.0, *) {
          authorization = locationManager.authorizationStatus
        } else {
          authorization = CLLocationManager.authorizationStatus()
        }
        checkCurrentLocationAuthorization(status: authorization)
      }
    }
  }
  
  func checkCurrentLocationAuthorization(status: CLAuthorizationStatus) {
    switch status {
    case .notDetermined:
      locationManager.desiredAccuracy = kCLLocationAccuracyBest
      locationManager.requestWhenInUseAuthorization()
    case .denied, .restricted:
      mapView.setUserTrackingMode(.none, animated: false)
      let center = CLLocationCoordinate2D(latitude: 37.517829, longitude: 126.886270)
      setRegionAndAnnotation(center: center)
      DispatchQueue.main.async {
        self.showRequestLocationServiceAlert()
      }
    case .authorizedWhenInUse, .authorizedAlways, .authorized:
      locationManager.requestAlwaysAuthorization()
      locationManager.startUpdatingLocation()
      mapView.setUserTrackingMode(.follow, animated: true)
    @unknown default: break
    }
  }
  
  func setRegionAndAnnotation(center: CLLocationCoordinate2D) {
    let region = MKCoordinateRegion(center: center, latitudinalMeters: 600, longitudinalMeters: 600)
    mapView.setRegion(region, animated: true)
  }
  
  func addAnnotation(center: CLLocationCoordinate2D, title: String) {
    let annotation = MKPointAnnotation()
    annotation.title = title
    annotation.coordinate = center
    
    mapView.addAnnotation(annotation)
  }
  
  
  func showRequestLocationServiceAlert() {
    let requestLocationServiceAlert = UIAlertController(title: "위치정보 이용", message: "위치 서비스를 사용할 수 없습니다. 기기의 '설정>개인정보 보호'에서 위치 서비스를 켜주세요.", preferredStyle: .alert)
    let goSetting = UIAlertAction(title: "설정으로 이동", style: .destructive) { _ in
      if let setting = URL(string: UIApplication.openSettingsURLString) {
        UIApplication.shared.open(setting)
      }
    }
    let cancel = UIAlertAction(title: "취소", style: .default)
    requestLocationServiceAlert.addAction(cancel)
    requestLocationServiceAlert.addAction(goSetting)
    
    present(requestLocationServiceAlert, animated: true, completion: nil)
  }
  
  func filteredTheater(theater: TheaterFilter) {
    mapView.removeAnnotations(mapView.annotations)
    let theaterList = theater == .all ? theaterList.mapAnnotations : theaterList.mapAnnotations.filter { $0.type == theater }
    theaterList.forEach { self.addAnnotation(center: CLLocationCoordinate2D(latitude: $0.latitude, longitude: $0.longitude), title: $0.location)
    }
  }
  
  @objc func filterButtonTapped() {
    let alert = UIAlertController(title: nil, message: nil, preferredStyle: .actionSheet)
    TheaterFilter.allCases.forEach { theater in
      let action = UIAlertAction(title: theater.title, style: .default) { _ in
        self.filteredTheater(theater: theater)
      }
      alert.addAction(action)
    }
    let cancel = UIAlertAction(title: "취소", style: .cancel)
    alert.addAction(cancel)
    present(alert, animated: true)
  }
  
  @objc func setCurrentRegionButtonTapped() {
    mapView.setUserTrackingMode(.follow, animated: true)
  }
}


extension FinderViewController: CLLocationManagerDelegate {
  func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
    print(#function)
    print(locations)
  }
  
  func locationManager(_ manager: CLLocationManager, didFailWithError error: Error) {
    print(#function)
    print(error)
  }
  
  func locationManagerDidChangeAuthorization(_ manager: CLLocationManager) {
    checkDeviceLocationAuthorization()
    print(#function)
  }
}

extension FinderViewController: MKMapViewDelegate {
  func mapView(_ mapView: MKMapView, regionDidChangeAnimated animated: Bool) {
    print(#function)
  }
  
  func mapView(_ mapView: MKMapView, didSelect annotation: MKAnnotation) {
    print(#function)
  }
}

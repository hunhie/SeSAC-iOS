//
//  ViewController.swift
//  NewlyCoinedWord
//
//  Created by walkerhilla on 2023/07/20.
//

import UIKit

final class DdayCaculaterViewController: UIViewController {
  //MARK: - View Property
  
  // Date Picker View
  @IBOutlet weak var datePicker: UIDatePicker!
  @IBOutlet var backgroundImages: [UIImageView]!
  @IBOutlet var DdayLabels: [UILabel]!
  @IBOutlet var datelabels: [UILabel]!
  @IBOutlet var shadowViews: [UIView]!
  
  //MARK: - Onother Property
  
  //MARK: - Life Cycle
  
  override func viewDidLoad() {
    super.viewDidLoad()

    designDatePicker()
    setupDdayView()
    updateDdayViewDate(date: datePicker.date)
  }
  
  //MARK: - Private Function
  
  private func designDatePicker() {
    datePicker.tintColor = .systemPink
    
    if #available(iOS 14.0, *) {
      datePicker.preferredDatePickerStyle = .inline
    } else {
      datePicker.preferredDatePickerStyle = .wheels
    }
  }
  
  private func setupDdayView() {
    backgroundImages.enumerated().forEach { (index, image) in
      image.image = [UIImage(named: "bg1"), UIImage(named: "bg2"), UIImage(named: "bg3"), UIImage(named: "bg4"),][index]
      image.layer.cornerRadius = 20
      image.clipsToBounds = true
    }
    
    shadowViews.forEach { view in
      view.layer.shadowRadius = 6
      view.layer.shadowColor = UIColor.black.cgColor
      view.layer.shadowOffset = CGSize(width: 4, height: 4)
      view.layer.shadowOpacity = 0.5
    }
    
    datelabels.forEach { label in
      label.textColor = .white
    }
  }
  
  private func updateDdayViewDate(date: Date) {
    let dateFormatter: DateFormatter = {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "YYYY년 MM월 dd일"
        
        return dateFormatter
    }()
    
    let date100 = Calendar.current.date(byAdding: .day, value: 100, to: date)
    let date200 = Calendar.current.date(byAdding: .day, value: 200, to: date)
    let date300 = Calendar.current.date(byAdding: .day, value: 300, to: date)
    let date400 = Calendar.current.date(byAdding: .day, value: 400, to: date)
  
    datelabels[1].text = "\(dateFormatter.string(from: date100!))"
    datelabels[0].text = "\(dateFormatter.string(from: date200!))"
    datelabels[2].text = "\(dateFormatter.string(from: date300!))"
    datelabels[3].text = "\(dateFormatter.string(from: date400!))"
  }
  
  //MARK: - Action
  
  @IBAction private func datePickerValueChanged(_ sender: UIDatePicker) {
    updateDdayViewDate(date: sender.date)
  }
}

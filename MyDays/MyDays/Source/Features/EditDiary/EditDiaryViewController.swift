//
//  EditDiaryViewController.swift
//  MyDays
//
//  Created by 여성일 on 8/14/25.
//

import UIKit

import Then

class EditDiaryViewController: BaseViewController {
  private let headerView = BaseNavigationView().then {
    $0.translatesAutoresizingMaskIntoConstraints = false
  }
  
  private let bottomModal = SelectEmojiModalViewController()

  private let stackView = UIStackView().then {
    $0.axis = .horizontal
    $0.spacing = 4
    $0.translatesAutoresizingMaskIntoConstraints = false
  }
  
  private let emotionImage = UIImageView().then {
    $0.image = .moved
    $0.contentMode = .scaleAspectFit
    $0.translatesAutoresizingMaskIntoConstraints = false
  }
  
  private let dateLabel = UILabel().then {
    $0.text = "8월 14일 목요일"
    $0.textColor = .g500
    $0.textAlignment = .center
    $0.font = .ownglyphSeoda(size: 18)
  }
  
  override func viewDidAppear(_ animated: Bool) {
    present(bottomModal, animated: true)
  }
  
  override func setViewController() {
    [headerView, stackView].forEach {
      self.view.addSubview($0)
    }
    
    [emotionImage, dateLabel].forEach {
      stackView.addArrangedSubview($0)
    }
    
    self.navigationController?.isNavigationBarHidden = true
  }
  
  override func setAutoLayout() {
    NSLayoutConstraint.activate([
      NSLayoutConstraint.init(item: headerView, attribute: .top, relatedBy: .equal, toItem: view.safeAreaLayoutGuide, attribute: .top, multiplier: 1.0, constant: 60),
      NSLayoutConstraint.init(item: headerView, attribute: .leading, relatedBy: .equal, toItem: view.safeAreaLayoutGuide, attribute: .leading, multiplier: 1.0, constant: 0.0),
      NSLayoutConstraint.init(item: headerView, attribute: .trailing, relatedBy: .equal, toItem: view.safeAreaLayoutGuide, attribute: .trailing, multiplier: 1.0, constant: 0.0),
      NSLayoutConstraint.init(item: headerView, attribute: .height, relatedBy: .equal, toItem: .none, attribute: .notAnAttribute, multiplier: 1.0, constant: 24),
      
      NSLayoutConstraint(item: emotionImage, attribute: .width, relatedBy: .equal, toItem: .none, attribute: .notAnAttribute, multiplier: 1.0, constant: 82.0),
      NSLayoutConstraint(item: emotionImage, attribute: .height, relatedBy: .equal, toItem: .none, attribute: .notAnAttribute, multiplier: 1.0, constant: 82.0),
      
      //NSLayoutConstraint(item: stackView, attribute: .top, relatedBy: .equal, toItem: headerView, attribute: <#T##NSLayoutConstraint.Attribute#>, multiplier: <#T##CGFloat#>, constant: <#T##CGFloat#>)
    ])
  }
}

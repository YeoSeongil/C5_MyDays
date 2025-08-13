//
//  SplashViewController.swift
//  MyDays
//
//  Created by 여성일 on 8/13/25.
//

import UIKit

import Then

class SplashViewController: BaseViewController {
  private let stackView = UIStackView().then {
    $0.axis = .vertical
    $0.spacing = 6
    $0.translatesAutoresizingMaskIntoConstraints = false
  }
  
  private let logoImage = UIImageView().then {
    $0.image = .happy
    $0.translatesAutoresizingMaskIntoConstraints = false
  }
  
  private let splashLabel = UILabel().then {
    $0.text = "오늘의 날씨"
    $0.textColor = .keyColor
    $0.font = .ownglyphSeoda(size: 25)
    $0.translatesAutoresizingMaskIntoConstraints = false
  }
  
  override func setView() {
    [logoImage, splashLabel].forEach {
      stackView.addArrangedSubview($0)
    }
    
    self.view.addSubview(stackView)
  }
  
  override func setAutoLayout() {
    NSLayoutConstraint.activate([
      NSLayoutConstraint(item: stackView, attribute: .centerX, relatedBy: .equal, toItem: view.safeAreaLayoutGuide, attribute: .centerX, multiplier: 1.0, constant: 0.0),
      NSLayoutConstraint(item: stackView, attribute: .centerY, relatedBy: .equal, toItem: view.safeAreaLayoutGuide, attribute: .centerY, multiplier: 1.0, constant: 0.0),
      
      NSLayoutConstraint(item: logoImage, attribute: .height, relatedBy: .equal, toItem: nil, attribute: .notAnAttribute, multiplier: 1.0, constant: 108),
      NSLayoutConstraint(item: logoImage, attribute: .width, relatedBy: .equal, toItem: nil, attribute: .notAnAttribute, multiplier: 1.0, constant: 108)
    ])
  }
}


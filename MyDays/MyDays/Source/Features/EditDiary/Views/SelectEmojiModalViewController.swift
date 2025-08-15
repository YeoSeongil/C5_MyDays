//
//  SelectEmojiModalViewController.swift
//  MyDays
//
//  Created by 여성일 on 8/14/25.
//

import UIKit

import Then

class SelectEmojiModalViewController: BaseViewController {
  private let prefersGabber = UIView().then {
    $0.backgroundColor = .g300
    $0.layer.cornerRadius = 3
    $0.translatesAutoresizingMaskIntoConstraints = false
  }
  
  private let titleLabel = UILabel().then {
    $0.text = "오늘의 감정을 선택해주세요!"
    $0.font = .ownglyphSeoda(size: 24)
    $0.textColor = .g700
    $0.translatesAutoresizingMaskIntoConstraints = false
  }
  
  private let selectButton = UIButton().then {
    $0.setTitle("선택하기", for: .normal)
    $0.setTitleColor(.white, for: .normal)
    $0.titleLabel?.font = .ownglyphSeoda(size: 22)
    $0.backgroundColor = .g300
    $0.layer.cornerRadius = 10
    $0.translatesAutoresizingMaskIntoConstraints = false
  }
  
  override func setViewController() {
    [prefersGabber, titleLabel, selectButton].forEach {
      self.view.addSubview($0)
    }
    
    if let sheet = self.sheetPresentationController {
      sheet.preferredCornerRadius = 15
      sheet.detents = [
        .custom(resolver: { context in
          return context.maximumDetentValue * 0.95
        })
      ]
    }
  }
  
  override func setAutoLayout() {
    NSLayoutConstraint.activate([
      
      NSLayoutConstraint(item: prefersGabber, attribute: .centerX, relatedBy: .equal, toItem: view.safeAreaLayoutGuide, attribute: .centerX, multiplier: 1.0, constant: 0.0),
      NSLayoutConstraint(item: prefersGabber, attribute: .top, relatedBy: .equal, toItem: view.safeAreaLayoutGuide, attribute: .top, multiplier: 1.0, constant: 12.0),
      NSLayoutConstraint(item: prefersGabber, attribute: .width, relatedBy: .equal, toItem: .none, attribute: .notAnAttribute, multiplier: 1.0, constant: 80.0),
      NSLayoutConstraint(item: prefersGabber, attribute: .height, relatedBy: .equal, toItem: .none, attribute: .notAnAttribute, multiplier: 1.0, constant: 6.0),
      
      NSLayoutConstraint(item: titleLabel, attribute: .centerX, relatedBy: .equal, toItem: view.safeAreaLayoutGuide, attribute: .centerX, multiplier: 1.0, constant: 0.0),
      NSLayoutConstraint(item: titleLabel, attribute: .top, relatedBy: .equal, toItem: prefersGabber, attribute: .bottom, multiplier: 1.0, constant: 85.0),
      
      NSLayoutConstraint(item: selectButton, attribute: .leading, relatedBy: .equal, toItem: view.safeAreaLayoutGuide, attribute: .leading, multiplier: 1.0, constant: 16),
      NSLayoutConstraint(item: selectButton, attribute: .trailing, relatedBy: .equal, toItem: view.safeAreaLayoutGuide, attribute: .trailing, multiplier: 1.0, constant: -16),
      NSLayoutConstraint(item: selectButton, attribute: .bottom, relatedBy: .equal, toItem: view.safeAreaLayoutGuide, attribute: .bottom, multiplier: 1.0, constant: -16),
      NSLayoutConstraint(item: selectButton, attribute: .height, relatedBy: .equal, toItem: .none, attribute: .notAnAttribute, multiplier: 1.0, constant: 65)
    ])
  }
}

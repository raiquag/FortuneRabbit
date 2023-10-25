//
//  BonusScreenVIew.swift
//  FortuneRabbit
//
//  Created by apple on 24.10.2023.
//

import UIKit
import SnapKit

class BonusScreenVIew: UIView {
    
    
    
    private(set) lazy var backgroundimageView: UIImageView = {
        let imageView = UIImageView()
        imageView.image = UIImage(named: "bg")
        return imageView
    }()
    
    private(set) lazy var rabbitImage: UIImageView = {
        let imageView = UIImageView()
        imageView.image = UIImage(named: "rabbit")
        imageView.contentMode = .scaleAspectFit
        return imageView
    }()
    
    let thankButton: UIButton = {
        let button = UIButton()
        button.setBackgroundImage(UIImage(named: "thankYouButton"), for: .normal)
        button.layer.cornerRadius = 8
        return button
    }()

    private(set) lazy var pointLabel: UILabel = {
        let label = UILabel()
        label.text = "+ 100"
        label.textColor = .white
        label.font = UIFont(name: "Mont-Black", size: 60)
        label.textAlignment = .center
        return label
    }()
    
    let startBonusLabel: UILabel = {
        let label = UILabel()
        label.text = "START \nBONUS"
        label.textColor = UIColor(named: "textColor")
        label.font = UIFont(name: "Mont-Black", size: 68)
        label.textAlignment = .center
        label.numberOfLines = 0
        return label
    }()
    
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupUI()
        setUpConstraints()
        
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setupUI() {
        addSubview(backgroundimageView)
        addSubview(startBonusLabel)
        addSubview(pointLabel)
        addSubview(rabbitImage)
        addSubview(thankButton)
        
        let screenWidth = UIScreen.main.bounds.size.width
          let isSmallScreen = screenWidth <= 375 // Измените значение на необходимое вам
          
          // Настройте шрифт для startBonusLabel
          if isSmallScreen {
              startBonusLabel.font = UIFont.boldSystemFont(ofSize: 48) // Уменьшите шрифт для маленького экрана
          }
          
          // Уменьшите размер изображения для rabbitImage
          if isSmallScreen {
              rabbitImage.snp.makeConstraints { make in
                  make.left.right.equalToSuperview()
                  make.top.equalTo(startBonusLabel.snp.bottom).offset(4)
                  make.height.equalTo(214) // Установите желаемую высоту для маленького экрана
              }
          }
          else {
              rabbitImage.snp.makeConstraints { make in
                  make.left.right.equalToSuperview()
                  make.top.equalTo(startBonusLabel.snp.bottom).offset(4)
              }
          }
      }
        
    private func setUpConstraints(){
        
        backgroundimageView.snp.makeConstraints { make in
            make.edges.equalToSuperview()
        }
        startBonusLabel.snp.makeConstraints { (make) in
            make.top.equalTo(safeAreaLayoutGuide).offset(20)
            make.left.right.equalToSuperview().inset(24)
        }
        
        rabbitImage.snp.makeConstraints { make in
            make.left.right.equalToSuperview()
//            make.size.equalTo(427)
            make.top.equalTo(startBonusLabel.snp.bottom).offset(4)
        }
        
        pointLabel.snp.makeConstraints { (make) in
            make.top.equalTo(rabbitImage.snp.bottom).offset(4)
            make.left.right.equalToSuperview().inset(24)
        }
      
        thankButton.snp.makeConstraints { (make) in
            make.left.right.equalToSuperview().inset(24)
            make.top.equalTo(pointLabel.snp.bottom).offset(20)
            make.bottom.equalToSuperview().offset(-26)
        }
    }
    
}



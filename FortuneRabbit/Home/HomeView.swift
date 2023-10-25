//
//  HomeView.swift
//  FortuneRabbit
//
//  Created by apple on 24.10.2023.
//

import Foundation
import UIKit

class HomeView: UIView {
    
    var heightScaleFactor: CGFloat { 812 / UIScreen.main.bounds.size.height }

    
    private lazy var backgroundimageView: UIImageView = {
        let imageView = UIImageView()
        imageView.image = UIImage(named: "bgHome")
        return imageView
    }()
    
    let rabbitImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.image = UIImage(named: "rabbitHome")
        imageView.contentMode = .scaleAspectFit
        return imageView
    }()
    
    let infoButton: UIButton = {
        let button = UIButton()
        button.setBackgroundImage(UIImage(named: "infoButton"), for: .normal)
        button.setTitle("INFO", for: .normal)
        button.titleLabel?.font = UIFont.boldSystemFont(ofSize: 24)
        button.setTitleColor(UIColor(named: "lightYellow")?.withAlphaComponent(1.0), for: .normal)
        button.setTitleColor(UIColor(named: "lightYellow")?.withAlphaComponent(0.5), for: .highlighted)
        button.titleEdgeInsets = UIEdgeInsets(top: 150, left: 33, bottom: 0, right: 0 )
        button.layer.cornerRadius = 30
        return button
    }()
    
    let newsButton: UIButton = {
        let button = UIButton()
        button.setBackgroundImage(UIImage(named: "newsButton"), for: .normal)
        button.layer.cornerRadius = 30
        return button
    }()
    
    let gifsButton: UIButton = {
        let button = UIButton()
        button.setBackgroundImage(UIImage(named: "giftsButton"), for: .normal)
        button.layer.cornerRadius = 30
        
        return button
    }()
    
    let bonusCardButton: UIButton = {
        let button = UIButton()
        button.setBackgroundImage(UIImage(named: "cardsButton"), for: .normal)
        button.setTitle("CARD", for: .normal)
        button.titleLabel?.font = UIFont.boldSystemFont(ofSize: 24)
        button.setTitleColor(UIColor(named: "lightGreen")?.withAlphaComponent(1.0), for: .normal)
        button.setTitleColor(UIColor(named: "lightGreen")?.withAlphaComponent(0.5), for: .highlighted)
        button.titleEdgeInsets = UIEdgeInsets(top: 0, left: 0, bottom: -150, right: 33)
        button.layer.cornerRadius = 30
        return button
    }()
    
    let cardTwoImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.image = UIImage(named: "rabbitCard_two")
        return imageView
    }()
    
    let cardOneImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.image = UIImage(named: "rabbitCard_one")
        return imageView
    }()
    
    let rabbitInfoImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.image = UIImage(named: "rabbit_Info")
        return imageView
    }()

    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupUI()
        setupConstraints()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setupUI() {
        [backgroundimageView,rabbitImageView,infoButton,newsButton,gifsButton,bonusCardButton].forEach(addSubview(_:))
        bonusCardButton.addSubview(cardOneImageView)
        bonusCardButton.addSubview(cardTwoImageView)
        infoButton.addSubview(rabbitInfoImageView)
    }
    
    private func setupConstraints() {
        backgroundimageView.snp.makeConstraints { make in
            make.edges.equalToSuperview()
        }
        
        gifsButton.snp.makeConstraints { make in
            make.top.equalToSuperview().offset(60 * heightScaleFactor)
            make.left.equalToSuperview().offset(5 * heightScaleFactor)
            make.bottom.equalTo(rabbitImageView.snp.top).offset(-5 * heightScaleFactor)
        }

        newsButton.snp.makeConstraints { make in
            make.top.equalToSuperview().offset(60 * heightScaleFactor)
            make.right.equalToSuperview()
        }

        rabbitImageView.snp.makeConstraints { make in
            make.left.right.equalToSuperview().inset(24 * heightScaleFactor)
            make.centerY.equalToSuperview()
           }
        
        bonusCardButton.snp.makeConstraints { make in
            make.bottom.equalToSuperview().offset(-60)
            make.left.equalToSuperview()
           }
        
        cardTwoImageView.snp.makeConstraints { make in
            make.right.equalToSuperview().offset(-50 * heightScaleFactor)
            make.top.equalToSuperview().offset(85 * heightScaleFactor)
        }

        cardOneImageView.snp.makeConstraints { make in
            make.left.equalToSuperview().offset(50 * heightScaleFactor)
            make.top.equalToSuperview().offset(85 * heightScaleFactor)
        }

        rabbitInfoImageView.snp.makeConstraints { make in
            make.right.equalToSuperview().offset(-55 * heightScaleFactor)
            make.top.equalToSuperview().offset(85 * heightScaleFactor)
        }
        infoButton.snp.makeConstraints { make in
            make.bottom.equalToSuperview().offset(-60)
            make.right.equalToSuperview()
           }
        
    }

}

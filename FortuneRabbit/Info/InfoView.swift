//
//  InfoView.swift
//  FortuneRabbit
//
//  Created by apple on 24.10.2023.
//


import Foundation
import UIKit

class InfoView: UIView {
    
    private lazy var backgroundimageView: UIImageView = {
        let imageView = UIImageView()
        imageView.image = UIImage(named: "bgHome")
        return imageView
    }()
    
    let subTitleLabel: UILabel = {
        let label = UILabel()
        label.text = "\(Settings.appTitle)"
        label.textColor = .white
        label.font = UIFont(name: "Mont-Black", size: 60)
        label.textAlignment = .center
        label.numberOfLines = 0
        return label
    }()
    
    let backButton: UIButton = {
        let button = UIButton()
        button.setBackgroundImage(UIImage(named: "back"), for: .normal)
        return button
    }()
    
    lazy var contentLabel: UILabel = {
        let label = UILabel()
        label.text = "Fortune Rabbit is an innovative mobile application created specifically for sweets lovers who want to not only enjoy a magnificent assortment of delicious treats, but also receive pleasant bonuses. This application is closely linked to a real candy store, offering users unique privileges and the opportunity to stay up to date with the latest news.\nOne of the key features of Fortune Rabbit is the system of discounts through QR codes. Every time you visit a store, simply scan the QR code using the app to automatically gain access to exclusive discounts and special offers. This not only saves your budget, but also makes shopping for sweet treats even more enjoyable. \nFortune Rabbit also provides constant updates on news and new flavor announcements, so you'll always be up to date with the store's latest trends and offerings. Users can receive notifications about upcoming events, promotions and new product arrivals so they don't miss out on the opportunity to try something new. \nFortune Rabbit is not just an app, but your guide to the world of sweet pleasures, offering unique benefits and an unforgettable experience for true sweet gourmets."
        label.textColor = .white
        label.font = UIFont(name: "Mont-Light", size: 16)
        label.numberOfLines = 0
        return label
    }()
    
    
    let infoConteinerView: UIView = {
        let view = UIView()
        view.backgroundColor = .clear
        view.layer.borderWidth = 2
        view.layer.cornerRadius = 30
        view.layer.borderColor = UIColor(named: "borderTextColor")?.cgColor
        return view
    }()
    
    let infoScrollView: UIScrollView = {
        let scrollView = UIScrollView()
        scrollView.showsVerticalScrollIndicator = false
        scrollView.showsHorizontalScrollIndicator = false
        scrollView.backgroundColor = .clear
        scrollView.isScrollEnabled = true
        scrollView.isDirectionalLockEnabled = true
        scrollView.contentInset = UIEdgeInsets(top: 56, left: 0, bottom: -56, right: 0)
        return scrollView
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
        addSubview(backgroundimageView)
        addSubview(infoScrollView)
        infoScrollView.addSubview(infoConteinerView)
        infoConteinerView.addSubview(subTitleLabel)
        infoConteinerView.addSubview(contentLabel)
        addSubview(backButton)
        
        
    }
    
    
    private func setupConstraints() {
        backgroundimageView.snp.makeConstraints { make in
            make.edges.equalToSuperview()
        }
        
        backButton.snp.makeConstraints { (make) in
            make.left.equalToSuperview().offset(24)
            make.top.equalToSuperview().offset(56)
        }
        
        infoScrollView.snp.makeConstraints { make in
//            make.top.equalTo(backButton.snp.bottom).offset(20)
            make.left.right.equalToSuperview().inset(24)
            make.bottom.top.equalToSuperview()
        }
        
        infoConteinerView.snp.makeConstraints { make in
            make.edges.equalToSuperview()
            make.centerX.equalToSuperview()
        }
        
        subTitleLabel.snp.makeConstraints { make in
            make.top.equalToSuperview().offset(40)
            make.centerX.equalToSuperview()
        }
        
        contentLabel.snp.makeConstraints { make in
            make.top.equalTo(subTitleLabel.snp.bottom).offset(20)
            make.left.right.equalToSuperview().inset(20)
            make.bottom.equalToSuperview().inset(56)
        }
    }
}

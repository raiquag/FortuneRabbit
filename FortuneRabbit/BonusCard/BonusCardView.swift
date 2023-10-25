//
//  BonusCardView.swift
//  FortuneRabbit

import Foundation
import UIKit
class BonusCardView: UIView {
    
    
    var heightScaleFactor: CGFloat { 812 / UIScreen.main.bounds.size.height }
    
    let qrCodeImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.isHidden = true
        imageView.clipsToBounds = true
        imageView.layer.cornerRadius = 30
        return imageView
    }()
    
     var backgroundimageView: UIImageView = {
        let imageView = UIImageView()
        imageView.image = UIImage(named: "bg_bonus")
        return imageView
    }()
    
    let showButton: UIButton = {
        let button = UIButton()
        button.setTitle("SHOW BONUS CARD", for: .normal)
        button.setTitleColor(.black, for: .normal)
        button.backgroundColor = UIColor(named: "Greys")
        button.titleLabel?.font = UIFont(name: "Mont-Regular", size: 16)
        button.layer.cornerRadius = 8
        return button
    }()
    
    let backButton: UIButton = {
        let button = UIButton()
        button.setBackgroundImage(UIImage(named: "back_white"), for: .normal)
        return button
    }()
    
    let bonusCardImage: UIImageView = {
        let imageView = UIImageView()
        imageView.image = UIImage(named: "AppIcon")
        imageView.layer.cornerRadius = 30
        imageView.layer.borderWidth = 2
        imageView.layer.borderColor = UIColor(named: "borderTextColor")?.cgColor
        imageView.clipsToBounds = true
        return imageView
    }()
    
    let accountLabel: UILabel = {
        let label = UILabel()
        label.text = "Account"
        label.textColor = UIColor(named: "colorTextBonus")
        label.font = UIFont(name: "Mulish-Bold", size: 16)
        label.textAlignment = .center
        return label
    }()
    
    let pointLabel: UILabel = {
        let label = UILabel()
        label.text = "\(AppData.shared.balance)"
        label.textColor = UIColor(named: "colorTextBonus")
        label.font = UIFont(name: "Mont-Black", size: 60)
        label.textAlignment = .center
        return label
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
        [backgroundimageView,backButton,accountLabel,pointLabel,bonusCardImage,qrCodeImageView].forEach(addSubview(_:))
        
        
    }
    
    private func setupConstraints() {
        backgroundimageView.snp.makeConstraints { make in
            make.edges.equalToSuperview()
        }
        
        backButton.snp.makeConstraints { (make) in
            make.left.equalToSuperview().offset(24)
            make.top.equalToSuperview().inset(56)
        }
        
        bonusCardImage.snp.makeConstraints { (make) in
            make.centerX.equalToSuperview()
            make.size.equalTo(246)
            make.top.equalTo(backButton.snp.bottom).offset(40)
            
        }
        
            
        accountLabel.snp.makeConstraints { (make) in
            make.centerX.equalToSuperview()
            make.top.equalTo(bonusCardImage.snp.bottom).offset(40)
        }
            
        pointLabel.snp.makeConstraints { (make) in
            make.centerX.equalToSuperview()
            make.top.equalTo(accountLabel.snp.bottom).offset(12)
        }
        
        qrCodeImageView.snp.makeConstraints { (make) in
            make.top.equalTo(pointLabel.snp.bottom).offset(32)
            make.centerX.equalToSuperview()
            make.size.equalTo(290)
        }
        }
    }


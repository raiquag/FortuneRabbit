//
//  GiftsDetailView.swift
//  FortuneRabbit
//


import Foundation
import UIKit

class GiftDetailView: UIView {

    
    private lazy var backgroundimageView: UIImageView = {
        let imageView = UIImageView()
        imageView.image = UIImage(named: "bgHome")
        return imageView
    }()
    
    let backButton: UIButton = {
        let button = UIButton()
        button.setBackgroundImage(UIImage(named: "back"), for: .normal)
        return button
    }()
    
    let giftDetailConteiner: UIView = {
        let view = UIView()
        view.backgroundColor = .clear.withAlphaComponent(0.6)
        view.layer.shadowColor = UIColor(named: "border_details")?.withAlphaComponent(0.6).cgColor
        view.layer.shadowOpacity = 1
        view.layer.shadowRadius = 24
        view.layer.shadowOffset = CGSize(width: 0, height: 0)
        view.layer.borderWidth = 2
        view.layer.borderColor = UIColor(named: "border_details")?.withAlphaComponent(0.6).cgColor
        view.layer.cornerRadius = 30
        return view
    }()
    
    let giftDetailUseConteiner: UIView = {
        let view = UIView()
        return view
    }()
    
    let titleGiftLabel: UILabel = {
        let label = UILabel()
        label.textColor = UIColor(named: "border_details")
        label.font = UIFont(name: "Mont-Heavy", size: 24)
        label.numberOfLines = 0
        return label
    }()
    
    var giftDetailImage: UIImageView = {
        let imageView = UIImageView()
        imageView.layer.cornerRadius = 30
        imageView.clipsToBounds = true
        return imageView
    }()
    
    let volumeLabel: UILabel = {
        let label = UILabel()
        label.text = "Volume"
        label.textColor = .white
        label.font = UIFont(name: "Mont-Heavy", size: 16)
        label.numberOfLines = 0
        return label
    }()
    
    let creditsLabel: UILabel = {
        let label = UILabel()
        label.textColor = .white
        label.text = "Credits"
        label.font = UIFont(name: "Mont-Heavy", size: 16)
        label.numberOfLines = 0
        return label
    }()
    
    let ingredientsLabel: UILabel = {
        let label = UILabel()
        label.text = "Ingredients"
        label.textColor = .white
        label.font = UIFont(name: "Mont-Heavy", size: 16)
        label.numberOfLines = 0
        return label
    }()
    
    let volumeScoreLabel: UILabel = {
        let label = UILabel()
        label.textColor = .white
        label.font = UIFont(name: "Mont-Light", size: 16)
        label.numberOfLines = 0
        return label
    }()
    
    let creditsScoreLabel: UILabel = {
        let label = UILabel()
        label.textColor = .white
        label.font = UIFont(name: "Mont-Light", size: 16)
        label.numberOfLines = 0
        return label
    }()
    
    let ingredientsScoreLabel: UILabel = {
        let label = UILabel()
        label.textColor = .white
        label.font = UIFont(name: "Mont-Light", size: 16)
        label.numberOfLines = 0
        return label
    }()
    
    let payHideButton: UIButton = {
        let button = UIButton()
        button.setTitle("PAY", for: .normal)
        button.setTitleColor(.white, for: .normal)
        button.backgroundColor = .clear.withAlphaComponent(0.5)
        button.titleLabel?.font = UIFont(name: "Mont-SemiBold", size: 24)
        button.layer.cornerRadius = 12
        button.layer.borderWidth = 2
        button.layer.borderColor = UIColor(named: "borderTextColor")?.withAlphaComponent(0.6).cgColor
        button.layer.shadowColor = UIColor(named: "borderTextColor")?.withAlphaComponent(0.6).cgColor
        button.layer.shadowOpacity = 1
        button.layer.shadowRadius = 46
        button.layer.shadowOffset = CGSize(width: 0, height: 0)
        return button
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
        [backgroundimageView,giftDetailUseConteiner,backButton] .forEach(addSubview(_:))
        
        giftDetailUseConteiner.addSubview(giftDetailConteiner)
        
        giftDetailConteiner.addSubview(giftDetailImage)
        giftDetailConteiner.addSubview(titleGiftLabel)
        giftDetailConteiner.addSubview(payHideButton)
        giftDetailConteiner.addSubview(creditsLabel)
        giftDetailConteiner.addSubview(creditsScoreLabel)
        giftDetailConteiner.addSubview(volumeLabel)
        giftDetailConteiner.addSubview(volumeScoreLabel)
        giftDetailConteiner.addSubview(ingredientsLabel)
        giftDetailConteiner.addSubview(ingredientsScoreLabel)
        
    }
    private func setupConstraints() {
        
        backgroundimageView.snp.makeConstraints { make in
            make.edges.equalToSuperview()
        }
        
        backButton.snp.makeConstraints { (make) in
            make.left.equalToSuperview().offset(24)
            make.top.equalToSuperview().inset(56)
        }
        
        giftDetailUseConteiner.snp.makeConstraints { make in
            make.top.equalTo(backButton.snp.bottom).offset(20)
            make.left.right.equalToSuperview().inset(24)
            make.bottom.equalToSuperview().offset(-56)
        }

        giftDetailConteiner.snp.makeConstraints { make in
            make.edges.equalToSuperview()
        }
        
        payHideButton.snp.makeConstraints { make in
            make.left.right.bottom.equalToSuperview().inset(20)
        }
        
        giftDetailImage.snp.makeConstraints { make in
            make.left.right.top.equalToSuperview()
            make.bottom.equalTo(titleGiftLabel.snp.top).offset(-20)
            make.height.equalTo(giftDetailImage.snp.width).multipliedBy(0.7)
        }
        
        titleGiftLabel.snp.makeConstraints { make in
            make.top.equalTo(giftDetailImage.snp.bottom).offset(20)
            make.left.right.equalToSuperview().inset(20)
        }
        
        volumeLabel.snp.makeConstraints { make in
            make.left.equalToSuperview().offset(20)
            make.top.equalTo(titleGiftLabel.snp.bottom).offset(20)
        }
        
        creditsLabel.snp.makeConstraints { make in
            make.left.equalToSuperview().offset(20)
            make.top.equalTo(volumeLabel.snp.bottom).offset(20)
        }
        
        ingredientsLabel.snp.makeConstraints { make in
            make.left.equalToSuperview().offset(20)
            make.top.equalTo(creditsLabel.snp.bottom).offset(20)
        }
        
        volumeScoreLabel.snp.makeConstraints { make in
            make.left.equalTo(volumeLabel.snp.right).offset(12)
            make.top.equalTo(titleGiftLabel.snp.bottom).offset(20)
        }
        
        creditsScoreLabel.snp.makeConstraints { make in
            make.left.equalTo(creditsLabel.snp.right).offset(12)
            make.top.equalTo(volumeScoreLabel.snp.bottom).offset(20)
        }
        
        ingredientsScoreLabel.snp.makeConstraints { make in
            make.left.equalTo(ingredientsLabel.snp.right).offset(12)
            make.top.equalTo(creditsScoreLabel.snp.bottom).offset(20)
        }
        
    }
}

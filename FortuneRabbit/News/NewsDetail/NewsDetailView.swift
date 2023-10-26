//
//  NewsDetailView.swift
//  FortuneRabbit
//

import Foundation
import UIKit

class NewsDetailView: UIView {
    
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
    
    let newsDetailConteiner: UIView = {
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
    
    let titleNewsLabel: UILabel = {
        let label = UILabel()
        label.textColor = UIColor(named: "borderTextColor")
        label.font = UIFont(name: "Mont-Heavy", size: 24)
        label.numberOfLines = 0
        return label
    }()
    
    var newsDetailImage: UIImageView = {
        let imageView = UIImageView()
        imageView.clipsToBounds = true
        return imageView
    }()
    

    
    let bodyTextView: UITextView = {
        let textView = UITextView()
        textView.showsVerticalScrollIndicator = false
        textView.textColor = .white
        textView.isEditable = false
        textView.backgroundColor = .clear
        textView.font = UIFont(name: "Mont-Light", size: 16)
        return textView
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
        [backgroundimageView,backButton,newsDetailConteiner,] .forEach(addSubview(_:))
        newsDetailConteiner.addSubview(titleNewsLabel)
        newsDetailConteiner.addSubview(newsDetailImage)
        newsDetailConteiner.addSubview(bodyTextView)
    }
    
    
    private func setupConstraints() {
        
        backgroundimageView.snp.makeConstraints { make in
            make.edges.equalToSuperview()
        }
        
        backButton.snp.makeConstraints { (make) in
            make.left.equalToSuperview().offset(24)
            make.top.equalToSuperview().inset(56)
        }
        
        newsDetailConteiner.snp.makeConstraints { make in
            make.top.equalTo(backButton.snp.bottom).offset(20)
            make.left.right.equalToSuperview().inset(24)
            make.bottom.equalToSuperview().offset(-56)
        }
        
        newsDetailImage.snp.makeConstraints { make in
            make.left.right.top.equalToSuperview()
            make.width.equalTo(345)
            make.height.equalTo(208)
        }
        
        titleNewsLabel.snp.makeConstraints { make in
            make.left.right.equalToSuperview().inset(20)
            make.top.equalTo(newsDetailImage.snp.bottom).offset(20)
        }
        
        bodyTextView.snp.makeConstraints { make in
            make.top.equalTo(titleNewsLabel.snp.bottom).offset(12)
            make.left.right.equalToSuperview().inset(20)
            make.bottom.equalToSuperview().offset(-20)
        }
    }
}


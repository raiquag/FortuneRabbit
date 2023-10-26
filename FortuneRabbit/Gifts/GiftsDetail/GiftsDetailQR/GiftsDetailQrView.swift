//
//  GiftsDetailQrView.swift
//  FortuneRabbit
//
//  Created by apple on 26.10.2023.
//

import Foundation
import UIKit

class GiftsDetailQrView: UIView {
    

    let backgroundimageView: UIImageView = {
        let imageView = UIImageView()
        imageView.image = UIImage(named: "bgHome")
        return imageView
    }()
    
    let qrCodeImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.layer.cornerRadius = 30
        imageView.clipsToBounds = true
        return imageView
    }()
    
    let hideButton: UIButton = {
        let button = UIButton()
        button.setTitle("HIDE", for: .normal)
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
        addSubview(backgroundimageView)
        addSubview(qrCodeImageView)
        addSubview(hideButton)
            }
    
    private func setupConstraints() {
        
        
        backgroundimageView.snp.makeConstraints { make in
            make.edges.equalToSuperview()
        }
        
        qrCodeImageView.snp.makeConstraints { make in
            make.top.equalToSuperview().offset(80)
            make.left.right.equalToSuperview().inset(20)
            make.height.equalTo(qrCodeImageView.snp.width)
        }
        
        hideButton.snp.makeConstraints { make in
            make.left.right.bottom.equalToSuperview().inset(20)
            make.height.equalTo(46)
        }

        
    }
}

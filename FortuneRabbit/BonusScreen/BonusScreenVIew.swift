//
//  BonusScreenVIew.swift
//  FortuneRabbit
//
//  Created by apple on 24.10.2023.
//

import UIKit
import SnapKit

class BonusScreenVIew: UIView {
    
    var heightScaleFactor: CGFloat { UIScreen.main.bounds.size.height / 812 }
    
    private(set) lazy var backgroundimageView: UIImageView = {
        let imageView = UIImageView()
        imageView.image = UIImage(named: "bg")
        return imageView
    }()
    
    let ImageConteinerView: UIView = {
        let view = UIView()
        view.backgroundColor = .clear
        return view
    }()
    
    private(set) lazy var rabbitImage: UIImageView = {
        let imageView = UIImageView()
        imageView.image = UIImage(named: "rabbit")
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
        [backgroundimageView,startBonusLabel,pointLabel,thankButton,ImageConteinerView].forEach(addSubview(_:))
        ImageConteinerView.addSubview(rabbitImage)
     
      }
        
    private func setUpConstraints(){
        
        backgroundimageView.snp.makeConstraints { make in
            make.edges.equalToSuperview()
        }
        startBonusLabel.snp.makeConstraints { (make) in
            make.top.equalTo(safeAreaLayoutGuide).offset(10)
            make.left.right.equalToSuperview().inset(24)
        }
        
        ImageConteinerView.snp.makeConstraints { make in
            make.centerX.equalToSuperview()
            make.top.equalTo(startBonusLabel.snp.bottom)
            make.bottom.equalTo(pointLabel.snp.top)
        }
        
        rabbitImage.snp.makeConstraints { make in
            make.center.equalToSuperview()
            make.size.equalTo(427 * heightScaleFactor)
        }
        
        pointLabel.snp.makeConstraints { (make) in
            make.bottom.equalTo(thankButton.snp.top).offset(-20)
            make.left.right.equalToSuperview().inset(24)
        }
      
        thankButton.snp.makeConstraints { (make) in
            make.left.right.equalToSuperview().inset(24)
            make.top.equalTo(pointLabel.snp.bottom).offset(20)
            make.bottom.equalTo(safeAreaLayoutGuide).offset(-26)
        }
    }
    
}



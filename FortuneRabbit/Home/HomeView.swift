//
//  HomeView.swift
//  FortuneRabbit
//
//  Created by apple on 24.10.2023.
//

import Foundation
import UIKit

class HomeView: UIView {
    
    var heightScaleFactor: CGFloat { UIScreen.main.bounds.size.height / 812 }
    
    
    private lazy var backgroundimageView: UIImageView = {
        let imageView = UIImageView()
        imageView.image = UIImage(named: "bgHome")
        return imageView
    }()
    
    let rabbitImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.image = UIImage(named: "rabbitHome")
        imageView.contentMode = .scaleAspectFill
        return imageView
    }()
    
//    let rabbitImageView: UIImageView = {
//        let imageView = UIImageView()
//        imageView.image = UIImage(named: "rabbitHome")
//        imageView.contentMode = .scaleAspectFill
//        return imageView
//    }()
    
    let infoButton: UIButton = {
        let button = UIButton()
        button.setTitle("INFO", for: .normal)
        button.setTitleColor(UIColor(named: "lightYellow"), for: .normal)
        button.setTitleColor(UIColor(named: "lightYellow")?.withAlphaComponent(0.5), for: .highlighted)
        button.titleEdgeInsets = UIEdgeInsets(top: 0, left: 0, bottom: -120, right: 0)
        button.backgroundColor = .black.withAlphaComponent(0.6)
        button.titleLabel?.font = UIFont(name: "Mont-Heavy", size: 24)
        button.layer.cornerRadius = 30
    
        return button
    }()
    
    let newsButton: UIButton = {
        let button = UIButton()
        button.setTitle("NEWS", for: .normal)
        button.setTitleColor(UIColor(named: "borderTextColor"), for: .normal)
        button.setTitleColor(UIColor(named: "borderTextColor")?.withAlphaComponent(0.5), for: .highlighted)
        button.titleEdgeInsets = UIEdgeInsets(top: 0, left: 0, bottom: -120, right: 0)
        button.backgroundColor = .black.withAlphaComponent(0.6)
        button.titleLabel?.font = UIFont(name: "Mont-Heavy", size: 24)
        button.layer.cornerRadius = 30
       
        return button
    }()
    
    let gifsButton: UIButton = {
        let button = UIButton()
        button.setTitle("GIFTS", for: .normal)
        button.setTitleColor(UIColor(named: "border_details"), for: .normal)
        button.setTitleColor(UIColor(named: "border_details")?.withAlphaComponent(0.5), for: .highlighted)
        button.titleEdgeInsets = UIEdgeInsets(top: 0, left: 0, bottom: -120, right: 0)
        button.backgroundColor = .black.withAlphaComponent(0.6)
        button.titleLabel?.font = UIFont(name: "Mont-Heavy", size: 24)
        button.layer.cornerRadius = 30

        return button
    }()
    
    let bonusCardButton: UIButton = {
        let button = UIButton()
        button.setTitle("CARD", for: .normal)
        button.setTitleColor(UIColor(named: "lightGreen"), for: .normal)
        button.setTitleColor(UIColor(named: "lightGreen")?.withAlphaComponent(0.5), for: .highlighted)
        button.titleEdgeInsets = UIEdgeInsets(top: 0, left: 0, bottom: -120, right: 0)
        button.backgroundColor = .black.withAlphaComponent(0.6)
        button.titleLabel?.font = UIFont(name: "Mont-Heavy", size: 24)
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
    
    let giftsImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.image = UIImage(named: "gitsButton")
        return imageView
    }()
    
    let newsOneImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.image = UIImage(named: "Group_rabbit")
        return imageView
    }()
    
    let newsTwoImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.image = UIImage(named: "rabbitNews_two")
        return imageView
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupUI()
        setupConstraints()
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        bonusCardButton.dropShadow(color: UIColor(named: "lightGreen"), opacity: 1, offSet: .zero, radius: 10)
        gifsButton.dropShadow(color: UIColor(named: "border_details"), opacity: 1, offSet: .zero, radius: 10)
        newsButton.dropShadow(color: UIColor(named: "borderTextColor"), opacity: 1, offSet: .zero, radius: 10)
        infoButton.dropShadow(color: UIColor(named: "lightYellow"), opacity: 1, offSet: .zero, radius: 10)
    }
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setupUI() {
        [backgroundimageView,gifsButton,newsButton,bonusCardButton,infoButton,rabbitImageView].forEach(addSubview(_:))
        gifsButton.addSubview(giftsImageView)
        newsButton.addSubview(newsOneImageView)
        bonusCardButton.addSubview(cardTwoImageView)
        bonusCardButton.addSubview(cardOneImageView)
        infoButton.addSubview(rabbitInfoImageView)
        
    }
    
    private func setupConstraints() {
        backgroundimageView.snp.makeConstraints { make in
            make.edges.equalToSuperview()
        }
        
        gifsButton.snp.makeConstraints { make in
            make.top.equalToSuperview().offset(60 * heightScaleFactor)
            make.left.equalToSuperview().offset(24 * heightScaleFactor)
            make.width.equalTo(148 * heightScaleFactor)
            make.height.equalTo(220 * heightScaleFactor)
            make.bottom.equalTo(rabbitImageView.snp.top).offset(-5 * heightScaleFactor)
        }
        
        giftsImageView.snp.makeConstraints { make in
            make.left.equalToSuperview().offset(12 * heightScaleFactor)
            make.top.equalToSuperview().offset(7 * heightScaleFactor)
            make.height.equalTo(138 * heightScaleFactor)
            make.width.equalTo(120 * heightScaleFactor)
        }
        
        newsButton.snp.makeConstraints { make in
            make.top.equalToSuperview().offset(60 * heightScaleFactor)
            make.right.equalToSuperview().offset(-24 * heightScaleFactor)
            make.width.equalTo(148 * heightScaleFactor)
            make.height.equalTo(220 * heightScaleFactor)
            make.bottom.equalTo(rabbitImageView.snp.top).offset(-5 * heightScaleFactor)
        }
        
        newsOneImageView.snp.makeConstraints { make in
            make.left.equalToSuperview().offset(15 * heightScaleFactor)
            make.top.equalToSuperview().offset(34 * heightScaleFactor)
            make.height.equalTo(111 * heightScaleFactor)
            make.width.equalTo(117 * heightScaleFactor)
        }
        
        rabbitImageView.snp.makeConstraints { make in
            make.left.right.equalToSuperview().inset(2 * heightScaleFactor)
            make.centerY.equalToSuperview()
        }
        
        bonusCardButton.snp.makeConstraints { make in
            make.bottom.equalToSuperview().offset(-60 * heightScaleFactor)
            make.left.equalToSuperview().offset(24 * heightScaleFactor)
            make.width.equalTo(148 * heightScaleFactor)
            make.height.equalTo(220 * heightScaleFactor)
        }
        
        cardTwoImageView.snp.makeConstraints { make in
            make.right.equalToSuperview().offset(-10 * heightScaleFactor)
            make.bottom.equalToSuperview().offset(-75 * heightScaleFactor)
            make.height.equalTo(112 * heightScaleFactor)
            make.width.equalTo(74 * heightScaleFactor)
        }
        
        cardOneImageView.snp.makeConstraints { make in
            make.left.equalToSuperview().offset(21 * heightScaleFactor)
            make.bottom.equalToSuperview().offset(-75 * heightScaleFactor)
            make.height.equalTo(116 * heightScaleFactor)
            make.width.equalTo(58 * heightScaleFactor)
        }
        
        rabbitInfoImageView.snp.makeConstraints { make in
            make.top.equalToSuperview().offset(36 * heightScaleFactor)
            make.left.equalToSuperview().offset(33 * heightScaleFactor)
            make.width.equalTo(76 * heightScaleFactor)
            make.height.equalTo(112 * heightScaleFactor)
        }
        
        infoButton.snp.makeConstraints { make in
            make.bottom.equalToSuperview().offset(-60 * heightScaleFactor)
            make.right.equalToSuperview().offset(-24 * heightScaleFactor)
            make.width.equalTo(148 * heightScaleFactor)
            make.height.equalTo(220 * heightScaleFactor)
        }
        
        
    }
    
}

extension UIView {

    func dropShadow(color: UIColor?, opacity: Float, offSet: CGSize, radius: CGFloat) {
        let layer = CALayer()
        layer.cornerRadius = 30
        layer.masksToBounds = false
        layer.shadowColor = color?.cgColor
        layer.shadowOpacity = opacity
        layer.shadowOffset = offSet
        layer.shadowRadius = radius
        
        layer.shadowPath = UIBezierPath(rect: self.bounds).cgPath

        let maskLayer = CAShapeLayer()
        maskLayer.frame = bounds
        maskLayer.path = UIBezierPath(roundedRect: bounds, cornerRadius: layer.cornerRadius).cgPath
        
        //
        // Make the mask area bigger than the view, so the shadow itself does not get clipped by the mask
        //
        let shadowBorder:CGFloat = (layer.shadowRadius * 2) + 5;
        maskLayer.frame = maskLayer.frame.insetBy(dx:  -shadowBorder, dy:  -shadowBorder)  // Make bigger
        maskLayer.frame = maskLayer.frame.offsetBy(dx: shadowBorder/2, dy: shadowBorder/2) // Move top and left
        
        // Allow for cut outs in the shape
        maskLayer.fillRule = .evenOdd
        
        
        //
        // Create new path
        //
        let pathMasking = CGMutablePath()
        // Add the outer view frame
        pathMasking.addPath(UIBezierPath(rect: maskLayer.frame).cgPath)
        // Translate into the shape back to the smaller original view's frame start point
        var catShiftBorder = CGAffineTransform(translationX: shadowBorder/2, y: shadowBorder/2)
        // Now add the original path for the cut out the shape of the original view
        pathMasking.addPath(maskLayer.path!.copy(using: &catShiftBorder)!)
        // Set this big rect with a small cutout rect as the mask
        maskLayer.path = pathMasking;
        

        //
        // Set as a mask on the view with the shadow
        //
        layer.mask = maskLayer
        self.layer.addSublayer(layer)
    }
}

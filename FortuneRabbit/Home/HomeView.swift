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
    
    let centerView: UIView = {
        let view = UIView()
        view.backgroundColor = .clear
        view.layer.cornerRadius = 60
        view.layer.borderWidth = 2
        view.layer.borderColor = UIColor(named: "borderTextColor")?.cgColor
        
        return view
    }()
    
    
    let rabbitImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.image = UIImage(named: "bgCenter")
        imageView.clipsToBounds = true
        imageView.layer.cornerRadius = 60
            
        return imageView
    }()
    
    let rabbitImageView2: UIImageView = {
        let imageView = UIImageView()
        imageView.image = UIImage(named: "centerImage")
        imageView.clipsToBounds = true
        imageView.layer.cornerRadius = 60

        return imageView
    }()

    
    let topView1: UIView = {
        let view = UIView()
        view.backgroundColor = .black.withAlphaComponent(0.6)
        view.layer.cornerRadius = 30
        return view
    }()
    
    let topLabel1: UILabel = {
        let label = UILabel()
        label.text = "GIFTS"
        label.textColor = UIColor(named: "border_details")
        label.font = UIFont(name: "Mont-Heavy", size: 24)
        label.textAlignment = .center
        return label
    }()
    
    let giftsImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.image = UIImage(named: "gitsButton")
        return imageView
    }()
    
    let topView2: UIView = {
        let view = UIView()
        view.backgroundColor = .black.withAlphaComponent(0.6)
        view.layer.cornerRadius = 30
        return view
    }()
    
    let newsOneImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.image = UIImage(named: "Group_rabbit")
        return imageView
    }()
    
    let topLabel2: UILabel = {
        let label = UILabel()
        label.text = "NEWS"
        label.textColor = UIColor(named: "borderTextColor")
        label.font = UIFont(name: "Mont-Heavy", size: 24)
        label.textAlignment = .center
        return label
    }()

    
    let bottomView1: UIView = {
        let view = UIView()
        view.backgroundColor = .black.withAlphaComponent(0.6)
        view.layer.cornerRadius = 30
        return view
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
    
    let bottomLabel1: UILabel = {
        let label = UILabel()
        label.text = "CARD"
        label.textColor = UIColor(named: "lightGreen")
        label.font = UIFont(name: "Mont-Heavy", size: 24)
        label.textAlignment = .center
        return label
    }()
    
    let bottomView2: UIView = {
        let view = UIView()
        view.backgroundColor = .black.withAlphaComponent(0.2)
        return view
    }()
    
    let rabbitInfoImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.image = UIImage(named: "rabbit_Info")
        return imageView
    }()
    
    let bottomLabel2: UILabel = {
        let label = UILabel()
        label.text = "INFO"
        label.textColor = UIColor(named: "lightYellow")
        label.font = UIFont(name: "Mont-Heavy", size: 24)
        label.textAlignment = .center
        return label
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupUI()
        setupConstraints()
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        topView1.dropShadow(color: UIColor(named: "border_details"), opacity: 1, offSet: .zero, radius: 10, cornerRadius: 30)
        topView2.dropShadow(color: UIColor(named: "borderTextColor"), opacity: 1, offSet: .zero, radius: 10, cornerRadius: 30)
        bottomView1.dropShadow(color: UIColor(named: "lightGreen"), opacity: 1, offSet: .zero, radius: 10, cornerRadius: 30)
        bottomView2.dropShadow(color: UIColor(named: "lightYellow"), opacity: 1, offSet: .zero, radius: 10, cornerRadius: 30)
        centerView.dropShadow(color: UIColor(named: "borderTextColor"), opacity: 1, offSet: .zero, radius: 46, cornerRadius: 60)
    }
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setupUI() {
        [backgroundimageView,centerView,topView1,topView2,bottomView1,bottomView2].forEach(addSubview(_:))
        
        centerView.addSubview(rabbitImageView)
        centerView.addSubview(rabbitImageView2)
        
        topView1.addSubview(giftsImageView)
        topView1.addSubview(topLabel1)
        
        topView2.addSubview(newsOneImageView)
        topView2.addSubview(topLabel2)
        
        bottomView1.addSubview(cardTwoImageView)
        bottomView1.addSubview(cardOneImageView)
        bottomView1.addSubview(bottomLabel1)
        
        bottomView2.addSubview(rabbitInfoImageView)
        bottomView2.addSubview(bottomLabel2)

        
    }
    
    private func setupConstraints() {
        backgroundimageView.snp.makeConstraints { make in
            make.edges.equalToSuperview()
        }
        
        centerView.snp.makeConstraints { make in
            make.top.equalTo(topView1.snp.bottom).offset(10)
            make.bottom.equalTo(bottomView1.snp.top).offset(-10)
            make.left.right.equalToSuperview().inset(20)
            make.height.equalTo(centerView.snp.width).multipliedBy(0.62)
        }
        
        rabbitImageView.snp.makeConstraints { make in
            make.edges.equalToSuperview()
        }
        
        rabbitImageView2.snp.makeConstraints { make in
            make.edges.equalToSuperview()
        }
        
        topView1.snp.makeConstraints { make in
            make.top.equalTo(safeAreaLayoutGuide.snp.top).offset(10)
            make.left.equalToSuperview().offset(24)
            make.width.equalTo(topView1.snp.height).multipliedBy(0.67)
            make.right.equalToSuperview().offset(-221)
        }
        
        giftsImageView.snp.makeConstraints { make in
            make.centerX.equalToSuperview()
            make.top.equalToSuperview().offset(20)
            make.bottom.equalToSuperview().offset(-75)
            make.width.equalTo(giftsImageView.snp.height).multipliedBy(0.87)
        }
        
        topLabel1.snp.makeConstraints { make in
            make.bottom.equalToSuperview().offset(-32)
            make.centerX.equalToSuperview()
        }
        
        topView2.snp.makeConstraints { make in
            make.top.equalTo(safeAreaLayoutGuide.snp.top).offset(10)
            make.right.equalToSuperview().offset(-24)
            make.width.equalTo(topView2.snp.height).multipliedBy(0.67)
            make.left.equalToSuperview().offset(221)
        }
        
        newsOneImageView.snp.makeConstraints { make in
            make.centerX.equalToSuperview()
            make.top.equalToSuperview().offset(24)
            make.bottom.equalTo(topLabel2.snp.top).offset(-6)
            make.width.equalTo(newsOneImageView.snp.height).multipliedBy(0.65)
        }
        
        topLabel2.snp.makeConstraints { make in
            make.bottom.equalToSuperview().offset(-32)
            make.centerX.equalToSuperview()
        }
        
        bottomView1.snp.makeConstraints { make in
            make.bottom.equalTo(safeAreaLayoutGuide.snp.bottom).offset(-36)
            make.left.equalToSuperview().offset(24)
            make.right.equalToSuperview().offset(-221)
            make.width.equalTo(bottomView1.snp.height).multipliedBy(0.67)
        }
        
        bottomLabel1.snp.makeConstraints { make in
            make.bottom.equalToSuperview().offset(-32)
            make.centerX.equalToSuperview()
        }
        
        cardTwoImageView.snp.makeConstraints { make in
            make.right.equalToSuperview().offset(-10)
            make.top.equalToSuperview().offset(32)
            make.bottom.equalTo(bottomView1.snp.bottom).offset(-75)
            make.width.equalTo(cardTwoImageView.snp.height).multipliedBy(0.66)
        }
        
        cardOneImageView.snp.makeConstraints { make in
            make.right.equalTo(cardTwoImageView.snp.right).offset(-45)
            make.top.equalToSuperview().offset(28)
            make.bottom.equalTo(bottomView1.snp.bottom).offset(-75)
            make.width.equalTo(cardOneImageView.snp.height).multipliedBy(0.5)
           
        }
        
        bottomView2.snp.makeConstraints { make in
            make.top.equalTo(centerView.snp.bottom).offset(10)
            make.bottom.equalTo(safeAreaLayoutGuide.snp.bottom).offset(-36)
            make.right.equalToSuperview().offset(-24)
            make.left.equalToSuperview().offset(221)
            make.width.equalTo(bottomView2.snp.height).multipliedBy(0.67)
        }
        
        rabbitInfoImageView.snp.makeConstraints { make in
            make.top.equalToSuperview().offset(33)
            make.left.right.equalToSuperview().inset(36)
            make.width.equalTo(rabbitInfoImageView.snp.height).multipliedBy(0.62)
        }
        
        bottomLabel2.snp.makeConstraints { make in
            make.bottom.equalToSuperview().offset(-32)
            make.centerX.equalToSuperview()
        }
    }
    
}

extension UIView {
    
    func dropShadow(color: UIColor?, opacity: Float, offSet: CGSize, radius: CGFloat,cornerRadius: CGFloat) {
        let layer = CALayer()
        layer.cornerRadius = cornerRadius
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

//
//  GiftsCell.swift
//  FortuneRabbit

import Foundation
import UIKit
import SnapKit

class GiftCell: UITableViewCell {
    
    static let reuseId = String(describing: GiftCell.self)
    
    let scoreLabel: UILabel = {
        let label = UILabel()
        label.textColor = .white
        label.font = UIFont(name: "Mont-Light", size: 20)
        return label
    }()
    
    let titleLabel: UILabel = {
        let label = UILabel()
        label.textColor = .white
        label.font = UIFont(name: "Mont-Heavy", size: 24)
        label.numberOfLines = 1
        label.adjustsFontSizeToFitWidth = true
        return label
    }()
    
    lazy var giftImage: UIImageView = {
        let imageView = UIImageView()
        imageView.clipsToBounds = true
        imageView.layer.cornerRadius = 8
        return imageView
    }()
    
    lazy var scoreImage: UIImageView = {
        let imageView = UIImageView()
        return imageView
    }()
    
    let giftDetailUseConteiner: UIView = {
        let view = UIView()
        view.backgroundColor = UIColor(named: "colorTextBonus")?.withAlphaComponent(0.8)
        view.layer.shadowColor = UIColor(red: 1, green: 0, blue: 0.898, alpha: 0.6).cgColor
        view.layer.shadowOpacity = 1
        view.layer.shadowRadius = 12
        view.layer.shadowOffset = CGSize(width: 0, height: 0)
        view.layer.borderWidth = 2
        view.layer.borderColor = UIColor(named: "borderTextColor")?.withAlphaComponent(0.6).cgColor
        view.layer.cornerRadius = 30
        view.clipsToBounds = true
        return view
    }()
    
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        setupUI()
        setupConstraints()
    }
    
    func setupUI(){
        selectionStyle = .none
        backgroundColor = .clear
        contentView.addSubview(giftDetailUseConteiner)
        contentView.backgroundColor = .clear
        contentView.layer.cornerRadius = 30
        
        
        [giftImage,titleLabel,scoreImage,scoreLabel].forEach(giftDetailUseConteiner.addSubview(_:))
        
    }
    
    func setupConstraints() {
        giftDetailUseConteiner.snp.makeConstraints { make in
            make.top.equalToSuperview().offset(20)
            make.left.right.bottom.equalToSuperview()
        }
        
        
        giftImage.snp.makeConstraints { make in
            make.left.equalToSuperview()
            make.top.bottom.equalToSuperview()
            make.width.equalTo(120)
            make.height.equalTo(100)
        }
        
        scoreImage.snp.makeConstraints { make in
            make.left.equalTo(giftImage.snp.right).offset(20)
            make.bottom.equalToSuperview().offset(-24)
            
        }
        
        titleLabel.snp.makeConstraints { make in
            make.left.equalTo(giftImage.snp.right).offset(20)
            make.right.equalToSuperview().offset(-10)
            make.top.equalToSuperview().offset(24)
            
        }
        
        scoreLabel.snp.makeConstraints { make in
            make.left.equalTo(scoreImage.snp.right).offset(4)
            make.bottom.equalToSuperview().offset(-24)
            
        }
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func prepareForReuse() {
        super.prepareForReuse()
        
        scoreLabel.text = nil
        titleLabel.text = nil
        giftImage.image = nil
        scoreImage.image = nil
    }
    
    func setupCell(item: GiftsModel) {
        scoreLabel.text = String(item.price)
        titleLabel.text = item.title
        giftImage.image = UIImage(named: item.image)
    }
}

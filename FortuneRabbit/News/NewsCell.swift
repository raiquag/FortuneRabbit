//
//  NewsCell.swift
//  FortuneRabbit


import Foundation
import UIKit
import SnapKit

class NewsCell: UITableViewCell {
    
    static let reuseId = String(describing: NewsCell.self)
    
    
    let tittleLabel: UILabel = {
        let label = UILabel()
        label.textColor = .white
        label.font = UIFont(name: "Mont-Black", size: 24)
        label.numberOfLines = 0
        label.textAlignment = .center
        label.layer.cornerRadius = 8
        return label
    }()
    
    let newsImage: UIImageView = {
        let imageView = UIImageView()
        imageView.contentMode = .scaleAspectFit
        return imageView
    }()
    
    let newsDetailUseConteiner: UIView = {
        let view = UIView()
        view.backgroundColor = UIColor(named: "colorTextBonus")?.withAlphaComponent(0.8)
        view.layer.shadowColor = UIColor(red: 1, green: 0, blue: 0.898, alpha: 0.6).cgColor
        view.layer.shadowOpacity = 1
        view.layer.shadowRadius = 12
        view.layer.shadowOffset = CGSize(width: 0, height: 0)
        view.layer.borderWidth = 2
        view.layer.borderColor = UIColor(named: "borderTextColor")?.withAlphaComponent(0.6).cgColor
        view.layer.cornerRadius = 30
        return view
    }()
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        
        setupUI()
        setupConstraints()
    }
        func setupUI() {
            contentView.addSubview(newsDetailUseConteiner)
            contentView.backgroundColor = .clear
            backgroundColor = .clear
            selectionStyle = .none
            [newsImage,tittleLabel].forEach(newsDetailUseConteiner.addSubview(_:))
        }
        
        func setupConstraints() {
            
            newsDetailUseConteiner.snp.makeConstraints { make in
                make.top.equalToSuperview().offset(20)
                make.left.right.bottom.equalToSuperview()
            }
            
            newsImage.snp.makeConstraints { make in
                make.left.right.top.equalToSuperview()
            }
            
            tittleLabel.snp.makeConstraints { make in
                make.top.equalTo(newsImage.snp.bottom)
                make.left.right.bottom.equalToSuperview()
                make.height.equalTo(48)
            }
        }
        
    
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func prepareForReuse() {
        super.prepareForReuse()
        
        tittleLabel.text = nil
        newsImage.image = nil
    }
    
    func setupCell(item: NewsModel) {
        tittleLabel.text = item.title
        newsImage.image = UIImage(named: item.image)
    }
}

//
//  NewsView.swift
//  FortuneRabbit
//
//  Created by apple on 24.10.2023.
//

import Foundation
import UIKit

class NewsView: UIView {
    
    private lazy var backgroundimageView: UIImageView = {
        let imageView = UIImageView()
        imageView.image = UIImage(named: "bgHome")
        return imageView
    }()
    
    lazy var newsTableView: UITableView = {
        let tableView = UITableView(frame: .zero, style: .grouped)
        tableView.backgroundColor = .clear
        tableView.showsVerticalScrollIndicator = false
        tableView.register(NewsCell.self, forCellReuseIdentifier: NewsCell.reuseId)
        return tableView
    }()
    
    let backButton: UIButton = {
        let button = UIButton()
        button.setBackgroundImage(UIImage(named: "back"), for: .normal)
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
        [backgroundimageView,newsTableView,backButton].forEach(addSubview(_:))
    }
    
    private func setupConstraints() {
        
        backgroundimageView.snp.makeConstraints { make in
            make.edges.equalToSuperview()
        }
        
        backButton.snp.makeConstraints { (make) in
            make.left.equalToSuperview().offset(24)
            make.top.equalToSuperview().inset(56)
        }
        
        newsTableView.snp.makeConstraints { (make) in
            make.top.equalTo(backButton.snp.bottom).offset(8)
            make.left.right.equalToSuperview().inset(24)
            make.bottom.equalToSuperview().offset(-56)
        }
    }
}

//
//  GiftsView.swift
//  FortuneRabbit

import Foundation
import UIKit

class GiftView: UIView {
    
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
    
    lazy var giftTableView: UITableView = {
        let tableView = UITableView(frame: .zero, style: .grouped)
        tableView.backgroundColor = .clear
        tableView.showsVerticalScrollIndicator = false
        tableView.layer.cornerRadius = 8
        tableView.register(GiftCell.self, forCellReuseIdentifier: GiftCell.reuseId)
        return tableView
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
        [backgroundimageView,giftTableView,backButton].forEach(addSubview(_:))
        
    }
    
    
    private func setupConstraints() {
        backgroundimageView.snp.makeConstraints { make in
            make.edges.equalToSuperview()
        }
        
        backButton.snp.makeConstraints { (make) in
            make.left.equalToSuperview().offset(24)
            make.top.equalToSuperview().inset(56)
        }
        
        giftTableView.snp.makeConstraints { (make) in
            make.top.equalTo(backButton.snp.bottom).offset(20)
            make.left.right.equalToSuperview().inset(24)
            make.bottom.equalTo(safeAreaLayoutGuide).offset(-26)
        }
    }
}

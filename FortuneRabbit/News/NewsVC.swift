//
//  NewsVC.swift
//  FortuneRabbit
//
//  Created by apple on 24.10.2023.
//

import Foundation
import UIKit

class NewsVC: UIViewController {
    
    private var indicator: UIActivityIndicatorView!

    var items = [NewsModel]()
    
    
    private var contentView: NewsView {
        view as? NewsView ?? NewsView()
    }
        
    override func loadView() {
        view = NewsView()
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        
        contentView.newsTableView.dataSource = self
        contentView.newsTableView.delegate = self
        setupBackButton()
        configureIndicator()
        newsLoadings()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        navigationController?.setNavigationBarHidden(true, animated: false)
    }
    
    func setupBackButton() {
        contentView.backButton.addTarget(self, action: #selector(buttonTapped), for: .touchUpInside)
    }
    
    private func configureIndicator() {
        indicator = UIActivityIndicatorView(style: .medium)
        indicator.hidesWhenStopped = true
        indicator.color = .borderText
        view.addSubview(indicator)
        indicator.transform = CGAffineTransform(scaleX: 3, y: 3)
        indicator.snp.makeConstraints { make in
            make.centerX.equalToSuperview()
            make.centerY.equalToSuperview()
        }
    }
    @objc func buttonTapped() {
        
        navigationController?.popViewController(animated: true)
    }
    
    func newsLoadings() {
        Task {
            do {
                indicator.startAnimating()
                items = try await ManagerNet.shared.getNews()
                contentView.newsTableView.reloadData()
                indicator.stopAnimating()
            } catch {
                print("Error: \(error.localizedDescription)")
                indicator.stopAnimating()
            }
        }
    }

}

extension NewsVC: UITableViewDataSource, UITableViewDelegate {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        items.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: NewsCell.reuseId, for: indexPath)
        
        guard let newsCell = cell as? NewsCell else {
            return cell
        }
        
        let item = items[indexPath.row]
        
        newsCell.setupCell(item: item)
        
        return newsCell
    }
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
        let item = items[indexPath.row]
        
        let newsDetailVC = NewsDetailVC(newsModel: item)
        
        newsDetailVC.newsModel = item
        
        
        navigationController?.pushViewController(newsDetailVC, animated: true)
    }
    
    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
            let headerView = UIView(frame: CGRect(x: 0, y: 0, width: tableView.bounds.size.width, height: 60))
            headerView.backgroundColor = .clear
            
            let titleLabel = UILabel()
            titleLabel.text = "News"
            titleLabel.font = UIFont(name: "Mont-Black", size: 60)
            titleLabel.textAlignment = .center
            titleLabel.textColor = .white
            titleLabel.frame = headerView.bounds
            headerView.addSubview(titleLabel)
            
            return headerView
        }

        func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
            return 60.0
        }
        
        func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
            return "News"
        }
    }
    

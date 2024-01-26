//
//  GiftsVC.swift
//  FortuneRabbit

import Foundation
import UIKit


class GiftVC: UIViewController {
    
    private var indicator: UIActivityIndicatorView!

    var items = [GiftsModel]()
    
    private var contentView: GiftView {
        view as? GiftView ?? GiftView()
    }
        
    override func loadView() {
        view = GiftView()
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        contentView.giftTableView.dataSource = self
        contentView.giftTableView.delegate = self
        configureIndicator()
        giftsLoadings()
        setupBackButton()
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

    
    func giftsLoadings() {
        Task {
            do {
                indicator.startAnimating()
                items = try await ManagerNet.shared.getGifts()
                contentView.giftTableView.reloadData()
                indicator.stopAnimating()
            } catch {
                print("Error: \(error.localizedDescription)")
                indicator.stopAnimating()
            }
        }
    }

    
    @objc func buttonTapped() {
        
        navigationController?.popViewController(animated: true)
        
    }
}

extension GiftVC: UITableViewDataSource, UITableViewDelegate {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        items.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: GiftCell.reuseId, for: indexPath)
        
        guard let giftCell = cell as? GiftCell else {
            return cell
        }
        
        let item = items[indexPath.row]
        
        giftCell.setupCell(item: item)
        
        return giftCell
    }
    
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
        
        let item = items[indexPath.row]
        
        let giftDetailVC = GiftDetailVC(model: item, uuid: item.id)
        
        giftDetailVC.model = item
        
        navigationController?.pushViewController(giftDetailVC, animated: true)
        
    }
    
    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        
            let headerView = UIView(frame: CGRect(x: 0, y: 0, width: tableView.bounds.size.width, height: 60))
            headerView.backgroundColor = .clear
          
            let titleLabel = UILabel()
            titleLabel.text = "Gifts"
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


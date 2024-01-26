//
//  OnboadrVC.swift
//  FortuneRabbit

import UIKit
import SnapKit

class OnboadrVC: UIViewController {
    
    private var indicator: UIActivityIndicatorView!

    private lazy var backView: UIImageView = {
        let im = UIImageView(image: .bgHome)
        im.contentMode = .scaleAspectFill
        return im
    }()

    private lazy var welcomeLabel: UILabel = {
        let label = UILabel()
        label.text = "Welcome"
        label.textColor = UIColor.lightYellow
        label.font = UIFont.boldSystemFont(ofSize: 40)
        return label
    }()
        
    private lazy var centerImageView: UIImageView = {
        let im = UIImageView(image: .lauch)
        im.contentMode = .scaleAspectFit
        return im
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupViews()
        setupConstraints()
        configureIndicator()
        startAuth()
        
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
    
    private func setupViews() {
        view.addSubview(backView)
        view.addSubview(welcomeLabel)
        view.addSubview(centerImageView)
        
    }
    
    private func setupConstraints() {
        
        backView.snp.makeConstraints { make in
            make.edges.equalToSuperview()
        }

        centerImageView.snp.makeConstraints { make in
            make.centerX.equalToSuperview()
            make.centerY.equalToSuperview()
            make.size.equalTo(427)
        }
        
        welcomeLabel.snp.makeConstraints { make in
            make.centerX.equalToSuperview()
            make.bottom.equalTo(centerImageView.snp.top).offset(-40)
        }
    }
    
    private func startAuth() {
        Task {
            do {
                indicator.startAnimating()
                try await ManagerNet.shared.authenticate()
                indicator.stopAnimating()
                let vc = HomeVC()
                let navigationController = UINavigationController(rootViewController: vc)
                navigationController.modalPresentationStyle = .fullScreen
                present(navigationController, animated: true)
                navigationController.setNavigationBarHidden(true, animated: false)
            } catch {
                print("Error: \(error.localizedDescription)")
                indicator.startAnimating()
            }
        }
    }

}

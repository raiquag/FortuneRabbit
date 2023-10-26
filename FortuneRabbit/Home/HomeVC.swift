//
//  HomeVC.swift
//  FortuneRabbit
//
//  Created by apple on 24.10.2023.
//

import UIKit
import SnapKit

class HomeVC: UIViewController {
    
    
    
    private var contentView: HomeView {
        view as? HomeView ?? HomeView()
    }
    
    override func loadView() {
        view = HomeView()
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        firstLaunch()
        setupButton()
    }
    
    private func firstLaunch() {
        let isFirstLaunch = UserDefaults.isFirstLaunch()
        if isFirstLaunch {
            let vc = BonusScreenVC()
            present(vc, animated: true)
        }
    }
    private func setupButton() {
        contentView.infoButton.addTarget(self, action: #selector(buttonTappedInfo), for: .touchUpInside)
        contentView.newsButton.addTarget(self, action: #selector(buttonTappedNews), for: .touchUpInside)
        contentView.gifsButton.addTarget(self, action: #selector(buttonTappedGift), for: .touchUpInside)
        contentView.bonusCardButton.addTarget(self, action: #selector(buttonTappedBonusCard), for: .touchUpInside)
    }
    
    @objc func buttonTappedInfo() {
        let infoVC = InfoVC()
        navigationController?.pushViewController(infoVC, animated: true)
    }
    
    @objc func buttonTappedNews() {
        let newsVC = NewsVC()
        navigationController?.pushViewController(newsVC, animated: true)
    }
    
    @objc func buttonTappedGift() {
        let giftVC = GiftVC()
        navigationController?.pushViewController(giftVC, animated: true)
    }
    
    @objc func buttonTappedBonusCard() {
        let bonusCardVC = BonusCardVC()
        navigationController?.pushViewController(bonusCardVC, animated: true)
        let qrCodeString = "Google.com"
        if let qrCodeImage = generateQRCode(from: qrCodeString, size: CGSize(width: 300, height: 300)) {
            bonusCardVC.contentView.qrCodeImageView.image = qrCodeImage
//            bonusCardVC.contentView.qrCodeImageView.isHidden = false
        }
    }
}


func generateQRCode(from string: String, size: CGSize) -> UIImage? {
    if let data = string.data(using: .utf8), let qrFilter = CIFilter(name: "CIQRCodeGenerator") {
        qrFilter.setValue(data, forKey: "inputMessage")
        
        if let qrImage = qrFilter.outputImage {
            let extent = qrImage.extent
            let scaleX = size.width / extent.size.width
            let scaleY = size.height / extent.size.height
            let transformedImage = qrImage.transformed(by: CGAffineTransform(scaleX: scaleX, y: scaleY))
            
            if let cgImage = CIContext().createCGImage(transformedImage, from: transformedImage.extent) {
                return UIImage(cgImage: cgImage)
            }
        }
    }
    
    return nil
}

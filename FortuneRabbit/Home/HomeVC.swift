//
//  HomeVC.swift
//  FortuneRabbit
//
//  Created by apple on 24.10.2023.
//

import UIKit
import SnapKit

class HomeVC: UIViewController {
    
    var view1Tapped = false
    
    private var contentView: HomeView {
        view as? HomeView ?? HomeView()
    }
    
    override func loadView() {
        view = HomeView()
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        firstLaunch()
        setupButtonView()
    }
    
    private func firstLaunch() {
        let isFirstLaunch = UserDefaults.isFirstLaunch()
        if isFirstLaunch {
            let vc = BonusScreenVC()
            present(vc, animated: true)
        }
    }
    private func setupButtonView() {
        let tapInfoGestureRecognizer = UITapGestureRecognizer(target: self, action: #selector(buttonTappedInfo))
        contentView.bottomView2.addGestureRecognizer(tapInfoGestureRecognizer)
        let tapNewsGestureRecognizer = UITapGestureRecognizer(target: self, action: #selector(buttonTappedNews))
        contentView.topView2.addGestureRecognizer(tapNewsGestureRecognizer)
        let tapGiftsGestureRecognizer = UITapGestureRecognizer(target: self, action: #selector(buttonTappedGift))
        contentView.topView1.addGestureRecognizer(tapGiftsGestureRecognizer)
        let tapCardGestureRecognizer = UITapGestureRecognizer(target: self, action: #selector(buttonTappedBonusCard))
        contentView.bottomView1.addGestureRecognizer(tapCardGestureRecognizer)
        
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
        let qrCodeString = UUID().uuidString
        if let qrCodeImage = generateQRCode(from: qrCodeString, size: CGSize(width: 300, height: 300)) {
            bonusCardVC.contentView.qrCodeImageView.image = qrCodeImage
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

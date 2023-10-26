//
//  GiftsDetailVC.swift
//  FortuneRabbit


import Foundation
import UIKit

class GiftDetailVC: UIViewController {
    
    var model: GiftsModel
    var uuid: String
    
    private var contentView: GiftDetailView {
        view as? GiftDetailView ?? GiftDetailView()
    }
    
    init(model: GiftsModel, uuid: String) {
        self.model = model
        self.uuid = uuid
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    override func loadView() {
        view = GiftDetailView()
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        //        let uuid = ""
        
        contentView.giftDetailImage.image = UIImage(named: model.imageGifts)
        contentView.titleGiftLabel.text = model.title
        contentView.volumeScoreLabel.text = model.volume
        contentView.creditsScoreLabel.text = model.credits
        contentView.ingredientsScoreLabel.text = model.ingredients
        
        setupBackButton()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        navigationController?.setNavigationBarHidden(true, animated: false)
    }
    
    func setupBackButton() {
        contentView.payHideButton.addTarget(self, action: #selector(showQRCode), for: .touchUpInside)
        contentView.backButton.addTarget(self, action: #selector(buttonTapped), for: .touchUpInside)
    }
    
    @objc func buttonTapped() {
        
        navigationController?.popViewController(animated: true)
    }
    
    @objc func showQRCode() {
        let giftsDetailQrVC = GiftsDetailQrVC()
        giftsDetailQrVC.id = model.id
        present(giftsDetailQrVC, animated: true)
        
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
}

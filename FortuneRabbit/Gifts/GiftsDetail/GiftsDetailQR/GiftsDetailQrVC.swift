//
//  GiftsDetailQrVC.swift
//  FortuneRabbit


import Foundation
import UIKit

class GiftsDetailQrVC: UIViewController {

    var id = ""
    
     var contentView: GiftsDetailQrView {
        view as? GiftsDetailQrView ?? GiftsDetailQrView()
    }
    
    override func loadView() {
        view = GiftsDetailQrView()
    }
    override func viewDidLoad() {
        super.viewDidLoad()
    
        
        if let qrCodeImage = generateQRCode(from: id, size: CGSize(width: 300, height: 300)) {
            contentView.qrCodeImageView.image = qrCodeImage
        }
        contentView.hideButton.addTarget(self, action: #selector(buttonTapped), for: .touchUpInside)
        
    }
    
    @objc func buttonTapped() {
        
        dismiss(animated: true)
        
    }
    
}

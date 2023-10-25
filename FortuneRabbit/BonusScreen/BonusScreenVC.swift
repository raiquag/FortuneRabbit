//
//  BonusScreenVC.swift
//  FortuneRabbit
//
//  Created by apple on 24.10.2023.
//

import UIKit


class BonusScreenVC: UIViewController {
    
    var appData: AppData = .shared
    
    var balanse: Int {
        get {
            return appData.balance
        }
        set {
            appData.balance = newValue
        }
    }
    
    private var contentView: BonusScreenVIew {
        view as? BonusScreenVIew ?? BonusScreenVIew()
    }
    
    override func loadView() {
        view = BonusScreenVIew()
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        
        contentView.thankButton.addTarget(self, action: #selector(buttonTapped), for: .touchUpInside)
        
    }
    
    @objc func buttonTapped() {
        
        dismiss(animated: true)
        balanse += 100
        Settings.points = balanse
        
    }
    
}

//
//  AppData.swift
//  FortuneRabbit

import Foundation

enum UserDefaultKey: String {
    case balance = "balance"
    case hasBeenLaunchedBeforeFlag = "hasBeenLaunchedBeforeFlag"
}

class AppData {
    
    static let shared = AppData()
    private let defaults = UserDefaults.standard
    var balanceClosure: (() -> Void)?
    
    
    private init() {
        if UserDefaults.standard.object(forKey: UserDefaultKey.balance.rawValue) == nil {
            balance = 0
        }
    }
    
    var balance: Int {
        get {
            return UserDefaults.standard.integer(forKey: UserDefaultKey.balance.rawValue)
        }
        set {
            UserDefaults.standard.set(newValue, forKey: UserDefaultKey.balance.rawValue)
            UserDefaults.standard.synchronize()
            balanceClosure?()
        }
    }
}


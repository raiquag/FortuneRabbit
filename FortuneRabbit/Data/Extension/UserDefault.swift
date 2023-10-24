//
//  UserDefault.swift
//  FortuneRabbit
//


import Foundation

extension UserDefaults {
    
    static func isFirstLaunch() -> Bool {
        let isFirstLaunch = !UserDefaults.standard.bool(forKey: UserDefaultKey.hasBeenLaunchedBeforeFlag.rawValue)
        if (isFirstLaunch) {
            UserDefaults.standard.set(true, forKey: UserDefaultKey.hasBeenLaunchedBeforeFlag.rawValue)
            UserDefaults.standard.synchronize()
        }
        return isFirstLaunch
    }
}

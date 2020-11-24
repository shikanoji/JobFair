//
//  AppSetting.swift
//  JobFair
//
//  Created by phan.van.da on 11/20/20.
//

import Foundation

enum AppSetting {    
    static var user: User? {
        get {
            if let data = UserDefaults.standard.value(forKey: #function) as? [String: Any] {
                let user = User(JSON: data)
                return user
            }
            return nil
        }
        set {
            guard let user = newValue else {
                UserDefaults.standard.do {
                    $0.set(nil, forKey: #function)
                    $0.synchronize()
                }
                return
            }
            UserDefaults.standard.do {
                $0.set(user.toJSON(), forKey: #function)
                $0.synchronize()
            }
        }
    }
}

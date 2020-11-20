//
//  AppDelegate.swift
//  JobFair
//
//  Created by Nguyễn Đình Thạch on 11/19/20.
//

import UIKit
import CoreData

@main
class AppDelegate: UIResponder, UIApplicationDelegate {
    var window: UIWindow?
    
    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        setupAppearance()
        
        return true
    }
    
    func setupAppearance() {
        let searchVC = Storyboard.SearchJob.instantiate(SearchJobViewController.self)
        let navigationVC = UINavigationController(rootViewController: searchVC)
        navigationVC.navigationBar.isHidden = true
        window?.rootViewController = navigationVC
        self.window?.makeKeyAndVisible()
        self.window?.frame = UIScreen.main.bounds
    }
}

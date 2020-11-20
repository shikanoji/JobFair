//
//  AppDelegate.swift
//  JobFair
//
//  Created by Nguyễn Đình Thạch on 11/19/20.
//

import UIKit
import CoreData
import Firebase
import GoogleSignIn

@main
class AppDelegate: UIResponder, UIApplicationDelegate {
    var window: UIWindow?
    
    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        setupAppearance()
        FirebaseApp.configure()
        GIDSignIn.sharedInstance()?.clientID = FirebaseApp.app()?.options.clientID
        application.statusBarStyle = .lightContent
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
    
    func application(_ app: UIApplication, open url: URL, options: [UIApplication.OpenURLOptionsKey : Any] = [:]) -> Bool {
        return ((GIDSignIn.sharedInstance()?.handle(url)) != nil)
    }
}

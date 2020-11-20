//
//  LoginViewController.swift
//  JobFair
//
//  Created by phan.van.da on 11/20/20.
//

import UIKit
import FirebaseAnalytics
import AccountKit
import GoogleSignIn
import FirebaseAuth

class LoginViewController: BaseViewController {
    
    @IBOutlet weak var signInButton: GIDSignInButton!
    
    enum AuthProvider {
        case authEmail
        case authFacebook
        case authFirebase
    }
    
    var accountKit: AccountKitManager!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        configView()
    }
    
    func configView() {
//        if accountKit == nil {
//            accountKit = AccountKitManager(responseType: .accessToken)
//        }
        
        GIDSignIn.sharedInstance()?.presentingViewController = self
        GIDSignIn.sharedInstance()?.delegate = self
    }
}

extension LoginViewController: GIDSignInDelegate {
    func sign(_ signIn: GIDSignIn!, didSignInFor user: GIDGoogleUser!, withError error: Error!) {
        if let error = error {
            showAlert(title: "Lỗi", message: error.localizedDescription)
            return
        }
        
        guard let authentication = user.authentication else { return }
        let credential = GoogleAuthProvider.credential(withIDToken: authentication.idToken,
                                                       accessToken: authentication.accessToken)
        
        Auth.auth().signIn(with: credential) { (authResult, error) in
            if let error = error {
                self.showAlert(title: "Lỗi", message: error.localizedDescription)
                return
            }
            
            guard let user = authResult?.user else {
                self.showAlert(title: "Lỗi", message: "Vui lòng đăng nhập lại")
                return
            }
            
            AppSetting.user = User(name: user.displayName ?? "",
                                   email: user.email ?? "",
                                   phone: user.phoneNumber ?? "",
                                   idToken: authentication.idToken)
            self.navigationController?.popViewController(animated: true)
        }
    }
    
    func sign(_ signIn: GIDSignIn!, didDisconnectWith user: GIDGoogleUser!, withError error: Error!) {
        // Perform any operations when the user disconnects from app here.
        // ...
    }
}

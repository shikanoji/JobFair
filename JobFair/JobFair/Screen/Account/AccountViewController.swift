//
//  AccountViewController.swift
//  JobFair
//
//  Created by phan.van.da on 11/20/20.
//

import UIKit

import FirebaseAuth

class AccountViewController: BaseViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    @IBAction func logoutTap(_ sender: Any) {
        let firebaseAuth = Auth.auth()
        do {
            try firebaseAuth.signOut()
            navigationController?.popToRootViewController(animated: false)
        } catch let signOutError as NSError {
            print ("Error signing out: %@", signOutError)
        }
    }
}

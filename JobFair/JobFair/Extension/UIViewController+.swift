//
//  UIViewController+.swift
//  JobFair
//
//  Created by phan.van.da on 11/20/20.
//

import UIKit
extension UIViewController {
    static var defaultNib: String {
        return self.description().components(separatedBy: ".").dropFirst().joined(separator: ".")
    }
    
    static var storyboardIdentifier: String {
        return self.description().components(separatedBy: ".").dropFirst().joined(separator: ".")
    }
    
    @discardableResult
    func showAlert(title: String?, message: String, done: (() -> Void)? = nil) -> UIAlertController {
        return showAlert(title: title, message: message, yesTitle: "Đồng ý", noTitle: nil, done: done)
    }
    
    @discardableResult
    func showAlert(title: String?,
                   message: String,
                   yesTitle: String?,
                   noTitle: String?,
                   done: (() -> Void)?) -> UIAlertController {
        return showAlert(title: title, message: message, yesTitle: yesTitle, noTitle: noTitle, cancel: nil, done: done)
    }
    
    @discardableResult
    func showAlert(title: String?,
                   message: String?,
                   yesTitle: String?,
                   noTitle: String?,
                   style: UIAlertController.Style = .alert,
                   cancel: (() -> Void)?,
                   done: (() -> Void)?) -> UIAlertController {
        let alert = UIAlertController(title: title, message: message, preferredStyle: style)
        
        if let yesTitle = yesTitle {
            alert.addAction(UIAlertAction(title: yesTitle, style: .default, handler: { _ in
                done?()
            }))
        }
        
        if let noTitle = noTitle {
            if style == .actionSheet {
                let cancelAction = UIAlertAction(title: noTitle, style: .cancel, handler: { _ in
                    cancel?()
                })
                cancelAction.setValue(UIColor(white: 0.0, alpha: 0.6), forKey: "titleTextColor")
                alert.addAction(cancelAction)
            } else {
                alert.addAction(UIAlertAction(title: noTitle, style: .cancel, handler: { _ in
                    cancel?()
                }))
            }
        }
        
        present(alert, animated: true, completion: nil)
        
        return alert
    }
}

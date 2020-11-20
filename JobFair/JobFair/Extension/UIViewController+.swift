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
}

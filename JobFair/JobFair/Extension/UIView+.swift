//
//  UIView+.swift
//  JobFair
//
//  Created by phan.van.da on 11/24/20.
//

import UIKit

extension UIView {
    func addBorder(cornerRadius: CGFloat, maskedCorners: CACornerMask = [.layerMaxXMaxYCorner,
                                                                         .layerMaxXMinYCorner,
                                                                         .layerMinXMinYCorner,
                                                                         .layerMinXMaxYCorner]) {
        layer.cornerRadius = cornerRadius
        layer.masksToBounds = true
        layer.maskedCorners = maskedCorners
    }
    
    func setupBackgroundGradient(colorTop: CGColor, colorBottom: CGColor) {
        let gl = CAGradientLayer()
        gl.colors = [colorTop, colorBottom]
        gl.startPoint = CGPoint(x: 0, y: 0.5)
        gl.endPoint = CGPoint(x: 1, y: 0.5)
        gl.frame = self.bounds
        self.layer.insertSublayer(gl, at: 0)
    }
    
}

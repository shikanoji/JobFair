//
//  BaseViewController.swift
//  JobFair
//
//  Created by phan.van.da on 11/20/20.
//

import UIKit
import RxSwift
import RxCocoa

class BaseViewController: UIViewController {
    internal let disposeBag = DisposeBag()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        bindViewModel()
        
        let swipeRight = UISwipeGestureRecognizer(target: self, action: #selector(self.swipedRight))
        swipeRight.direction = UISwipeGestureRecognizer.Direction.right
        
        let swipeLeft = UISwipeGestureRecognizer(target: self, action: #selector(self.swipedLeft))
        swipeLeft.direction = UISwipeGestureRecognizer.Direction.left
        
        self.view.addGestureRecognizer(swipeLeft)
        self.view.addGestureRecognizer(swipeRight)

        setupBackground()
    }
    
    func setupBackground() {
        let gradient = CAGradientLayer()
        let color1 = UIColor(rgb: 0x45425A).cgColor
        let color2 = UIColor(rgb: 0x5B5586).cgColor
        let color3 = UIColor(rgb: 0x454255).cgColor

        gradient.colors = [color1, color2, color3]

        gradient.locations = [0.0, 0.48, 1.0]
        
        gradient.frame = view.bounds
        view.layer.insertSublayer(gradient, at: 0)
    }
    
    func bindViewModel() {
    }
    
    @objc func swipedRight() {
        print("right")
        navigationController?.popViewController(animated: true)
    }
    
    @objc func swipedLeft() {
        print("left")
    }
}

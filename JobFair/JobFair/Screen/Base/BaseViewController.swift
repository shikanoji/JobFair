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

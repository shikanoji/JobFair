//
//  SearchJobViewController.swift
//  JobFair
//
//  Created by phan.van.da on 11/20/20.
//

import UIKit
import RxSwift
import RxCocoa

class SearchJobViewController: BaseViewController {
    
    @IBOutlet weak var accountButton: UIButton!
    @IBOutlet weak var announButton: UIButton!
    @IBOutlet weak var searchView: UIView!
    @IBOutlet weak var searchTextField: UITextField!
    @IBOutlet weak var searchButton: UIButton!
    @IBOutlet weak var infoButton: UIButton!
    
    var viewModel = SearchJobViewModel()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        configView()
    }
    
    override func bindViewModel() {
        super.bindViewModel()
        
        let input = SearchJobViewModel.Input(accountTrigger: accountButton.rx.tap
                                                .debounce(.milliseconds(200), scheduler: MainScheduler.instance)
                                                .asDriverOnErrorJustComplete())
        
        let output = viewModel.transform(input)
        
        output.navigateAccount
            .drive(navigateAccountBinder)
            .disposed(by: disposeBag)
    }
    
    func configView() {
        searchView.backgroundColor = UIColor(rgb: 0xF4EEEE)
        searchView.addBorder(cornerRadius: 10)
        searchTextField.attributedPlaceholder =
            NSAttributedString(string: "Nhập từ khoá công việc bạn quan tâm", attributes: [NSAttributedString.Key.foregroundColor: UIColor.gray])
        searchButton.backgroundColor = UIColor(rgb: 0xF3CA3E)
        searchButton.setTitleColor(.white, for: .normal)
        searchButton.addBorder(cornerRadius: 10)
    }
}

extension SearchJobViewController {
    var navigateAccountBinder: Binder<User?> {
        return Binder(self) { vc, user in
            if user != nil {
                let accountVC = Storyboard.Account.instantiate(AccountViewController.self)
                vc.navigationController?.pushViewController(accountVC, animated: true)
            } else {
                let loginVC = Storyboard.Login.instantiate(LoginViewController.self)
                vc.navigationController?.pushViewController(loginVC, animated: true)
            }
        }
    }
}

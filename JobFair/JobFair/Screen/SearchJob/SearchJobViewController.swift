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
    
    var viewModel = SearchJobViewModel()
    
    override func viewDidLoad() {
        super.viewDidLoad()
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
}

extension SearchJobViewController {
    var navigateAccountBinder: Binder<Bool> {
        return Binder(self) { vc, goAcount in
            if goAcount {
                let accountVC = Storyboard.Account.instantiate(AccountViewController.self)
                vc.navigationController?.pushViewController(accountVC, animated: true)
            } else {
                let loginVC = Storyboard.Login.instantiate(LoginViewController.self)
                vc.navigationController?.pushViewController(loginVC, animated: true)
            }
        }
    }
}

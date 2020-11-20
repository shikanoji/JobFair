//
//  SearchJobViewModel.swift
//  JobFair
//
//  Created by phan.van.da on 11/20/20.
//

import Foundation
import RxSwift
import RxCocoa

struct SearchJobViewModel: ViewModelType {
    struct Input {
        let accountTrigger: Driver<Void>
    }
    
    struct Output {
        let navigateAccount: Driver<Bool>
    }
    
    func transform(_ input: Input) -> Output {
        let acount = input.accountTrigger
            .map { AppSetting.isLogin }
        
        return Output(
            navigateAccount: acount
        )
    }
}

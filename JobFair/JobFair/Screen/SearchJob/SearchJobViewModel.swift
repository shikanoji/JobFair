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
        let searchTrigger: Driver<Void>
    }
    
    struct Output {
        let navigateAccount: Driver<User?>
        let searchJobs: Driver<Void>
        let fetchJobs: Driver<[Job]>
    }
    
    func transform(_ input: Input) -> Output {
        let acount = input.accountTrigger
            .map { AppSetting.user }
        
        let jobsSubject = BehaviorSubject<[Job]>(value: [])
        
        let searchJobs = input.searchTrigger
            .do(onNext: { _ in
                JobHelper.shared.getAllJob { jobs, error in
                    if error == nil && jobs.count > 0 {
                        jobsSubject.onNext(jobs)
                    }
                }
            })
        return Output(
            navigateAccount: acount,
            searchJobs: searchJobs,
            fetchJobs: jobsSubject.asDriverOnErrorJustComplete()
        )
    }
}

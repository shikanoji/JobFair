//
//  JobHelper.swift
//  JobFair
//
//  Created by nguyen.dinh.thach on 12/2/20.
//

import Foundation
import RxCocoa
import RxSwift

class JobHelper {
    static let shared = JobHelper()
    
    init() {
    }
    
    func getAllJob(completionHandler: @escaping ([Job], Error?) -> Void) {
        var jobs: [Job] = []
        let ref = FirestoreConnector.shared.db.collection("orders")
        ref.getDocuments() { (querySnapshot, err) in
            if let err = err {
                print("Error getting documents: \(err)")
                completionHandler(jobs, err)
            } else {
                for document in querySnapshot!.documents {
                    if let job = Job(JSON: document.data()) {
                        jobs.append(job)
                    }
                }
                completionHandler(jobs, nil)
            }
        }
    }
}

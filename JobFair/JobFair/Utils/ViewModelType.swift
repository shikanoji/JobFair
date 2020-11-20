//
//  ViewModelType.swift
//  JobFair
//
//  Created by phan.van.da on 11/20/20.
//

public protocol ViewModelType {
    associatedtype Input
    associatedtype Output
    
    func transform(_ input: Input) -> Output
}

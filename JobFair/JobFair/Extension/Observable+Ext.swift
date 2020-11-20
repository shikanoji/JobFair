//
//  Observable+Ext.swift
//  JobFair
//
//  Created by phan.van.da on 11/20/20.
//

import Foundation
import RxSwift
import RxCocoa

extension SharedSequenceConvertibleType {
    func mapToVoid() -> SharedSequence<SharingStrategy, Void> {
        return map { _ in }
    }
}

extension PrimitiveSequenceType where Trait == SingleTrait {
    func mapToVoid() -> PrimitiveSequence<SingleTrait, Void> {
        return map { _ in }
    }
}

extension ObservableType {
    func asDriverOnErrorJustComplete() -> Driver<Element> {
        return asDriver { _ in
            return Driver.empty()
        }
    }
    
    func mapToVoid() -> Observable<Void> {
        return map { _ in }
    }
}

extension ObservableType {
    func mapConst<U> (_ value: U) -> Observable<U> {
        return map { _ in value }
    }
}

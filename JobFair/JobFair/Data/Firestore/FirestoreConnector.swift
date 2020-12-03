//
//  FirestoreConnector.swift
//  JobFair
//
//  Created by nguyen.dinh.thach on 12/2/20.
//

import Foundation
import FirebaseFirestore
import Firebase

class FirestoreConnector {
    static let shared = FirestoreConnector()
    var db: Firestore
    init() {
        self.db = Firestore.firestore()
    }
}

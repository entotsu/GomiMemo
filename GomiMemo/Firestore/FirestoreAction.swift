//
//  FirestoreAction.swift
//  GomiMemo
//
//  Created by Takuya Okamoto on 9/12/20.
//  Copyright © 2020 TakuyaOkamoto. All rights reserved.
//

import FirebaseCore
import FirebaseAuth
import FirebaseFirestore
import FirebaseFirestoreSwift

class FirestoreAction {

    public static let shared = FirestoreAction()
    
    private init() {
        self.db = Firestore.firestore()
    }

    let db: Firestore
    
    func userDocument(user: User) -> DocumentReference? {
        return db
            .collection("versions").document(FIRESTORE_DB_VERSION.string)
            .collection("users").document(user.uid)
    }
}

enum DBVersion {
    case v1
}

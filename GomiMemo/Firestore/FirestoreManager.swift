//
//  FirestoreManager.swift
//  GomiMemo
//
//  Created by Takuya Okamoto on 9/12/20.
//  Copyright © 2020 TakuyaOkamoto. All rights reserved.
//

import FirebaseCore
import FirebaseAuth
import FirebaseFirestore
import FirebaseFirestoreSwift

class FirestoreManager {

    public static let shared = FirestoreManager()
    
    private init() {
        self.db = Firestore.firestore()
    }

    let db: Firestore
    
    func createUserDocument(user: User, completion: @escaping (Result<DocumentReference?, Error>)->Void) {
        var ref: DocumentReference? = nil

        ref = userDocument(user: user)
        
        ref?.setData(["uid" : user.uid], merge: true) { err in
            if let err = err {
                print("Error adding document: \(err)")
                completion(.failure(err))
            } else {
                print("Document added with ID: \(ref!.documentID)")
                completion(.success(ref))
            }
        }
    }
    
    func userDocument(user: User) -> DocumentReference? {
        return db
            .collection("versions").document(FIRESTORE_DB_VERSION.string)
            .collection("user").document(user.uid)
    }
}

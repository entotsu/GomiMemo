//
//  AuthManager.swift
//  GomiMemo
//
//  Created by Takuya Okamoto on 2020/09/12.
//  Copyright © 2020 TakuyaOkamoto. All rights reserved.
//

import Foundation
import FirebaseAuth

class AuthManager {
    
    public static let shared = AuthManager()
    private init() {}
    
    var isExistAccount: Bool {
        return Auth.auth().currentUser != nil
    }

    var currentUser: User? {
        return Auth.auth().currentUser
    }
    
    func createNewAnonymousAccount(completion: @escaping (Result<User, Error>) -> Void) {
        
        Auth.auth().signInAnonymously() { result, error in

            if let error = error {
                // TODO: ErrorLog
                completion(.failure(error))
                return
            }
            
            if let result = result {
                completion(.success(result.user))
                return
            }
            
            completion(.failure(AuthError.invalidReturnValue))
        }
    }
}

// MARK: - Error

enum AuthError: Error {
    case invalidReturnValue
}

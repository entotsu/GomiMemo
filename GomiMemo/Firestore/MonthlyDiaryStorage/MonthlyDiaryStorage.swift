//
//  MonthlyDiaryStorage.swift
//  GomiMemo
//
//  Created by Takuya Okamoto on 2020/09/12.
//  Copyright © 2020 TakuyaOkamoto. All rights reserved.
//

import FirebaseCore
import FirebaseAuth
import FirebaseFirestore
import FirebaseFirestoreSwift

class MonthlyDiaryStorage {
    
    public static let shared = MonthlyDiaryStorage()
    
    private init() {
        self.db = Firestore.firestore()
    }
        
    let db: Firestore
    
    func getListener() {
    
    }
    
    func update(month: MonthID) {
        
    }
}


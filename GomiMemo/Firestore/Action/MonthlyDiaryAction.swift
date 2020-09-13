//
//  MonthlyDiaryAction.swift
//  GomiMemo
//
//  Created by Takuya Okamoto on 2020/09/12.
//  Copyright © 2020 TakuyaOkamoto. All rights reserved.
//

import FirebaseCore
import FirebaseAuth
import FirebaseFirestore
import FirebaseFirestoreSwift

extension FirestoreAction {

    var monthlyDiary: MonthlyDiaryAction { return MonthlyDiaryAction.shared }
    
    class MonthlyDiaryAction {
        
        public static let shared = MonthlyDiaryAction()
        
        private init() {
            self.db = Firestore.firestore()
        }
            
        let db: Firestore
            
        func updateDiary(user: User, year: Int, month: Month, content: MonthlyDiary) {
            FirestoreAction.shared.userDocument(user: user)?
                    .collection("monthly-diary").document("diary")
                    .collection("year").document("\(year)")
                    .collection("month").document("\(month.rawValue)")
                    .setData(content.toFirestoreData())
        }
        
        func getListener() {
            
        }
    }
}


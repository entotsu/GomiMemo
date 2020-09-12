//
//  MonthlyDiary.swift
//  GomiMemo
//
//  Created by Takuya Okamoto on 9/12/20.
//  Copyright © 2020 TakuyaOkamoto. All rights reserved.
//

import UIKit

class MonthlyDiary {

    let title: String
    let text: String
    
    init(title: String, text: String) {
        self.title = title
        self.text = text
    }
    
    func toFirestoreData() -> [String : Any] {
        return [
            "title": self.title,
            "text": self.text
        ]
    }
}

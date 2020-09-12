//
//  FirestoreDBVersion.swift
//  GomiMemo
//
//  Created by Takuya Okamoto on 9/12/20.
//  Copyright © 2020 TakuyaOkamoto. All rights reserved.
//

import Foundation

enum FirestoreDBVersion {

    case v1
    
    var string: String {
        switch self {
        case .v1: return "v1"
        }
    }
    
    var number: Int {
        switch self {
        case .v1: return 1
        }
    }
}

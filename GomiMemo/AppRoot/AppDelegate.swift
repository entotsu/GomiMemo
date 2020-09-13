//
//  AppDelegate.swift
//  GomiMemo
//
//  Created by Takuya Okamoto on 2020/09/12.
//  Copyright © 2020 TakuyaOkamoto. All rights reserved.
//

import UIKit
import FirebaseCore

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {

    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        
        FirebaseApp.configure()
        
        if !AuthManager.shared.isExistAccount {
            AuthManager.shared.createNewAnonymousAccount { result in
                switch result {
                case .success(_):
                    print("scceed to create new account.")
                case .failure(let authErr):
                    print(authErr)
                }
            }
        } else {
            print("account is existing: \(AuthManager.shared.user!)")
            
            //🚧
            Timer.schedule(delay: 4) { timer in
                
                let content = MonthlyDiary(
                    title: "Ending lab, Creating GomiMemo, Improving&Prototyping UI",
                    text: "lab is enddddddddddd"
                )
                
                FirestoreAction.shared.monthlyDiary.updateDiary(user: AuthManager.shared.user!, year: 2020, month: .sep, content: content)
            }
        }
                
        return true
    }

    // MARK: UISceneSession Lifecycle

    func application(_ application: UIApplication, configurationForConnecting connectingSceneSession: UISceneSession, options: UIScene.ConnectionOptions) -> UISceneConfiguration {
        // Called when a new scene session is being created.
        // Use this method to select a configuration to create the new scene with.
        return UISceneConfiguration(name: "Default Configuration", sessionRole: connectingSceneSession.role)
    }

    func application(_ application: UIApplication, didDiscardSceneSessions sceneSessions: Set<UISceneSession>) {
        // Called when the user discards a scene session.
        // If any sessions were discarded while the application was not running, this will be called shortly after application:didFinishLaunchingWithOptions.
        // Use this method to release any resources that were specific to the discarded scenes, as they will not return.
    }
}


//
//  AppDelegate.swift
//  HenriPotierSwift
//
//  Created by Sandy on 2019-06-10.
//  Copyright © 2019 Sandy. All rights reserved.
//

import UIKit

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?


    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
       
        guard NetworkManager.isConnected else {
            window?.rootViewController?.view.makeToast(message: ErrorHandler.noNetwork.description, duration: HRToastDefaultDuration, position: .bottom)
            return false
        }
        
        return true
    }
    
    func alert() {
        
    }
}


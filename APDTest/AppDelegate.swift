//
//  AppDelegate.swift
//  APDTest
//
//  Created by Yaroslav Skachkov on 20.08.2018.
//  Copyright © 2018 Yaroslav Skachkov. All rights reserved.
//

import UIKit
import Appodeal

let appKeySandbox = "dee74c5129f53fc629a44a690a02296694e3eef99f2d3a5f"

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?


    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplicationLaunchOptionsKey: Any]?) -> Bool {
        
        Appodeal.setTestingEnabled(true)
        let adTypes: AppodealAdType = [.nativeAd, .banner, .rewardedVideo]
        Appodeal.initialize(withApiKey: appKeySandbox, types: adTypes)
        
        return true
    }

}


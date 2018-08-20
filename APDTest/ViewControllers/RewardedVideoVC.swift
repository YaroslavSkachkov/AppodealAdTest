//
//  RewardedVideoVC.swift
//  APDTest
//
//  Created by Yaroslav Skachkov on 20.08.2018.
//  Copyright © 2018 Yaroslav Skachkov. All rights reserved.
//

import UIKit
import Appodeal
import Toast_Swift

class RewardedVideoVC: UIViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        Appodeal.setRewardedVideoDelegate(self)
    }
    
    @IBAction func showRVButtonPressed(_ sender: UIButton) {
        Appodeal.showAd(.rewardedVideo, rootViewController: self)
    }
}

extension RewardedVideoVC: AppodealRewardedVideoDelegate {
    func rewardedVideoDidLoadAd() {
        NSLog("video ad was loaded")
        self.view.makeToast("Video ad was loaded")
    }
    func rewardedVideoDidFailToLoadAd() {
        NSLog("video ad failed to load")
        self.view.makeToast("Video ad failed to load")
    }
    func rewardedVideoDidPresent() {
        NSLog("video ad was presented")
        self.view.makeToast("Video ad was presented")
    }
    func rewardedVideoWillDismiss() {
        NSLog("video ad was closed")
        self.view.makeToast("Video ad was closed")
    }
    func rewardedVideoDidFinish(_ rewardAmount: UInt, name rewardName: String!) {
        NSLog("video ad was fully watched");
        self.view.makeToast("Video ad was fully watched")
    }
}

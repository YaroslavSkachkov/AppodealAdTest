//
//  BannerAdVC.swift
//  APDTest
//
//  Created by Yaroslav Skachkov on 20.08.2018.
//  Copyright © 2018 Yaroslav Skachkov. All rights reserved.
//

import UIKit
import Appodeal
import Toast_Swift

class BannerAdVC: UIViewController {
    
    var banner: AppodealBannerView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        addBannerView()
    }
    
    func addBannerView() -> AppodealBannerView {
        banner = AppodealBannerView(size: CGSize(width: 375, height: 80), rootViewController: self)!
        banner.isHidden = true
        banner.setDelegate(self)
        self.view.addSubview(banner)
        return banner
    }
    
    @IBAction func loadBannerAdButtonPressed(_ sender: UIButton) {
        banner.loadAd()
    }
    
    @IBAction func showBannerAdButtonPressed(_ sender: UIButton) {
        banner.isHidden = false
    }
    
    @IBAction func hideBannerAdButtonPressed(_ sender: UIButton) {
        banner.isHidden = true
    }
}

extension BannerAdVC: AppodealBannerViewDelegate  {
    func bannerViewDidLoadAd(_ bannerView: APDBannerView!){
        NSLog("Banner view was loaded")
        self.view.makeToast("Banner view was loaded")
    }
    
    func bannerViewDidRefresh(_ bannerView: APDBannerView!){
        NSLog("banner view was refreshed")
        self.view.makeToast("Banner view was refreshed")
    }
    func bannerView(_ bannerView: APDBannerView!, didFailToLoadAdWithError error: Error!){
        NSLog("banner view failed to load")
        self.view.makeToast("Banner view failed to load")
    }
    func bannerViewDidInteract(_ bannerView: APDBannerView!){
        NSLog("banner view was clicked")
        self.view.makeToast("Banner view was clicked")
    }
}

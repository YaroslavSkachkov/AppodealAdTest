//
//  ViewController.swift
//  APDTest
//
//  Created by Yaroslav Skachkov on 20.08.2018.
//  Copyright © 2018 Yaroslav Skachkov. All rights reserved.
//

import UIKit
import Appodeal
import SDWebImage
import Toast_Swift

class NativeAdVC: UIViewController {
    
    @IBOutlet weak var nativeAdView: UIView!
    
    @IBOutlet weak var descriptionLabel: UILabel!
    @IBOutlet weak var iconImageView: UIImageView!
    @IBOutlet weak var mainImageView: UIImageView!
    @IBOutlet weak var appNameLabel: UILabel!
    @IBOutlet weak var callToActionLabel: UILabel!
    
    var apdLoader: APDNativeAdLoader!
    var nativeAds: [APDNativeAd] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        apdLoader = APDNativeAdLoader()
        apdLoader.delegate = self
        apdLoader.loadAd(with: .noVideo, capacity: 1)
        callToActionLabel.layer.borderWidth = 1
        callToActionLabel.layer.borderColor = UIColor.black.cgColor
        callToActionLabel.layer.cornerRadius = 10
        nativeAdView.isHidden = true
    }
    
    @IBAction func showNativeAdButtonPressed(_ sender: UIButton) {
        nativeAdView.isHidden = false
    }
    
    @IBAction func hideNativeAdButtonPressed(_ sender: UIButton) {
        nativeAdView.isHidden = true
    }
    
}

extension NativeAdVC: APDNativeAdLoaderDelegate {
    func nativeAdLoader(_ loader: APDNativeAdLoader!, didLoad nativeAds: [APDNativeAd]!) {
        let ad = nativeAds[0]
        appNameLabel.text = ad.title
        descriptionLabel.text = ad.descriptionText
        iconImageView.sd_setImage(with: ad.iconImage.url, completed: nil)
        mainImageView.sd_setImage(with: ad.mainImage.url, completed: nil)
        callToActionLabel.text = ad.callToActionText
        if let adChoicesView = ad.adChoicesView {
            nativeAdView.addSubview(adChoicesView)
            adChoicesView.topAnchor.constraint(equalTo: nativeAdView.topAnchor, constant: 8).isActive = true
            adChoicesView.rightAnchor.constraint(equalTo: nativeAdView.rightAnchor, constant: 8).isActive = true
        }
        ad.attach(to: nativeAdView, viewController: self)
        self.view.makeToast("Native ad was loaded automatically by APDNativeLoader. Tap on Show button.", position: .center)
    }
    
    func nativeAdLoader(_ loader: APDNativeAdLoader!, didFailToLoadWithError error: Error!) {
        self.view.makeToast("Native ad failed to load.")
    }
}

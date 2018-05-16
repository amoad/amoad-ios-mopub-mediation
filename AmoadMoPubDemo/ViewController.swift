//
//  ViewController.swift
//  AmoadMoPubDemo
//
//  Created by 菅原 清吾 on 2018/05/16.
//  Copyright © 2018年 Amoad. All rights reserved.
//

import UIKit

class ViewController: UIViewController, MPAdViewDelegate {

    func viewControllerForPresentingModalView() -> UIViewController! {
        return self
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        let adUnitIDs = "f856a200dc57449e81c5a6edddb656c0"
        
        let adView = MPAdView(adUnitId: adUnitIDs, size: CGSize(width: 0, height: 0))
        adView?.delegate = self
        adView?.isHidden = true
        self.view.addSubview(adView!)
        adView?.loadAd()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    func adViewDidLoadAd(_ view: MPAdView!) {
        
    }
}


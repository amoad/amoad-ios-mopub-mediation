//
//  BannerViewController.swift
//  AmoadMoPubDemo
//
//  Created by 菅原 清吾 on 2018/05/16.
//  Copyright © 2018年 Amoad. All rights reserved.
//

import UIKit

class BannerViewController: UIViewController, MPAdViewDelegate {

    let adUnitIDs = "f856a200dc57449e81c5a6edddb656c0"
    let bannerSize = CGSize(width: 320, height: 50)
    var mpAdView: MPAdView?
    var adViewSize: CGSize?

    func viewControllerForPresentingModalView() -> UIViewController! {
        return self
    }

    func adViewDidLoadAd(_ view: MPAdView!) {
        if self.mpAdView == nil {
            self.mpAdView = view
        }
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        let adView = MPAdView(adUnitId: self.adUnitIDs, size: self.bannerSize)
        if let adView = adView {
            adView.delegate = self
            //        adView?.isHidden = true
            self.view.addSubview(adView)
            adView.loadAd()
        }
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}

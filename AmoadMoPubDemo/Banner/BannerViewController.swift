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
    let bannerSize = AmoadMoPubUtil.getBannerSize(bannerSize: AMoAdBannerSize.b320x50)

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        let adView = MPAdView(adUnitId: self.adUnitIDs, size: self.bannerSize)
        if let adView = adView {
            adView.delegate = self
            adView.frame = CGRect(x:0, y:self.view.bounds.size.height - MOPUB_BANNER_SIZE.height, width:MOPUB_BANNER_SIZE.width, height:MOPUB_BANNER_SIZE.height)
            self.view.addSubview(adView)
            adView.loadAd()
        }
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    // Function for failed "loading" of an ad.
    func adViewDidFail(toLoadAd view: MPAdView!) {
        print("Failed to load ad")
    }
    
    // Function for successful loading of ad.
    func adViewDidLoadAd(_ view: MPAdView!) {
        print("The ad loaded")
    }
    
    func viewControllerForPresentingModalView() -> UIViewController {
        return self
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

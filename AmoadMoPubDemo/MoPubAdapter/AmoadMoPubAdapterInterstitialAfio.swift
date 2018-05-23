//
//  AmoadMoPubAdapterInterstitialAfio.swift
//  AmoadMoPubDemo
//
//  Created by 菅原 清吾 on 2018/05/23.
//  Copyright © 2018年 Amoad. All rights reserved.
//

import Foundation
import UIKit

@objc(AmoadMoPubAdapterInterstitialAfio)
class AmoadMoPubAdapterInterstitialAfio: MPInterstitialCustomEvent, AMoAdInterstitialVideoDelegate {
    
    var customEventClassData: AmoadCustomEventClassDataForDisplay?
    
    public override func requestInterstitial(withCustomEventInfo info: [AnyHashable: Any]!) {
        
        // Decording data from server
        self.customEventClassData = AmoadMoPubUtil.extractCustomEventClassDataForDisplay(info: info)
        
        guard let _customEventClassData = self.customEventClassData else {
            return
        }
        
        // Sending adData to amoadSDK
        self.preparedInterstitialAfio(customEventClassData: _customEventClassData)
    }
    
    fileprivate func preparedInterstitialAfio(customEventClassData: AmoadCustomEventClassDataForDisplay) {
        
        AMoAdNativeViewManager.shared().setEnvStaging(true)
        
        AMoAdInterstitialVideo.sharedInstance(withSid: customEventClassData.sid, tag: "").delegate = self
        
        // 広告ダウンロード
        AMoAdInterstitialVideo.sharedInstance(withSid: customEventClassData.sid, tag: "").load()
    }
    
//    public override func showInterstitial(fromRootViewController rootViewController: UIViewController!) {
//
//        guard let _customEventClassData = self.customEventClassData else {
//            return
//        }
//
//    }
    
    func amoadInterstitialVideo(_ amoadInterstitialVideo: AMoAdInterstitialVideo!, didLoadAd result: AMoAdResult) {
        // 広告ダウンロードが完了したら View を表示する
        if (result == .success) {
            amoadInterstitialVideo.show()
            self.delegate.interstitialCustomEventWillAppear(self)
            self.delegate.interstitialCustomEventDidAppear(self)
        }
    }
}

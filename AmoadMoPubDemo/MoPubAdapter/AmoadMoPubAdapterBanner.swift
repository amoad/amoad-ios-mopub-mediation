//
//  AmoadMoPubAdapterBanner.swift
//  AmoadMoPubDemo
//
//  Created by 菅原 清吾 on 2018/05/16.
//  Copyright © 2018年 Amoad. All rights reserved.
//

import Foundation
import UIKit

@objc(AmoadMoPubAdapterBanner)
class AmoadMoPubAdapterBanner: MPBannerCustomEvent {
    
    public override func requestAd(with size: CGSize, customEventInfo info: [AnyHashable: Any]!) {

        // Decording data from server
        let customEventClassData = AmoadMoPubUtil.extractCustomEventClassDataForDisplay(info: info)
        guard let _customEventClassData = customEventClassData else {
            return
        }
        
        // Sending adData to amoadSDK
        self.preparedBanner(customEventClassData: _customEventClassData)
    }
    
    fileprivate func preparedBanner(customEventClassData: AmoadCustomEventClassDataForDisplay) {
        
        AMoAdView.setEnvStaging(true)
        
        guard let amoadView = AMoAdView.init(frame: CGRect.zero) else {
            self.delegate.bannerCustomEvent(self, didFailToLoadAdWithError: nil)
            return
        }

        // デリゲートを設定する
        amoadView.delegate = self
        
        // 広告ID（sid）を設定する
        amoadView.sid = customEventClassData.sid
        
        self.delegate.bannerCustomEvent(self, didLoadAd: amoadView)
    }
}

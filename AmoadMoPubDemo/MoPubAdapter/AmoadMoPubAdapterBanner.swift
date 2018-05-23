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
class AmoadMoPubAdapterBanner: MPBannerCustomEvent, AMoAdViewDelegate {
    
    public override func requestAd(with size: CGSize, customEventInfo info: [AnyHashable: Any]!) {

        // Decording data from server
        let customEventClassData = AmoadMoPubUtil.extractCustomEventClassDataForDisplay(info: info)
        guard let _customEventClassData = customEventClassData else {
            return
        }
        
        // Sending adData to amoadSDK
        self.preparedBanner(size: size, customEventClassData: _customEventClassData)
    }
    
    fileprivate func preparedBanner(size: CGSize, customEventClassData: AmoadCustomEventClassDataForDisplay) {
        
        AMoAdView.setEnvStaging(true)
        
        let frameSize = CGRect(x:0,y:0,width:size.width,height:size.height)
        
        if let amoadView = AMoAdView.init(frame: frameSize) {
            
            // デリゲートを設定する
            amoadView.delegate = self
            
            // 広告ID（sid）を設定する
            amoadView.sid = customEventClassData.sid
            
            self.delegate.bannerCustomEvent(self, didLoadAd: amoadView)
        }
    }
    
    func aMoAdViewDidReceiveAd(_ amoadView: AMoAdView!) {
        print("正常に広告を受信した")
        self.delegate.bannerCustomEvent(self, didLoadAd: amoadView)
    }
    
    func aMoAdViewDidFail(toReceiveAd amoadView: AMoAdView!, error: Error!) {
        print("広告の取得に失敗した（error:\(error)）")
        self.delegate.bannerCustomEvent(self, didFailToLoadAdWithError: nil)
    }
    
    func aMoAdViewDidReceiveEmptyAd(_ amoadView: AMoAdView!) {
        print("空の広告を受信した")
        self.delegate.bannerCustomEvent(self, didFailToLoadAdWithError: nil)
    }
}

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
        let customEventClassData = AmoadMoPubUtil.extractCustomEventClassData(info: info)
        guard let _customEventClassData = customEventClassData else {
            return
        }
        
        // Sending adData to amoadSDK
        self.setBannerAd(size: size, customEventClassData: _customEventClassData)
    }
    
    fileprivate func setBannerAd(size: CGSize, customEventClassData: AmoadCustomEventClassData) {
        
        AMoAdLogger.shared().logging = true
        AMoAdLogger.shared().trace = true
        AMoAdView.setEnvStaging(true)
        
        let frameSize = CGRect(x:0,y:0,width:size.width,height:size.height)
        
        if let amoadView = AMoAdView.init(frame: frameSize) {
            
            // デリゲートを設定する
            amoadView.delegate = self
            
            // 横方向を中央寄せ(AMoAdHorizontalAlignCenter)に指定
            amoadView.horizontalAlign = .center

            // 縦方向を下寄せ(AMoAdVerticalAlignBottom) に指定
            amoadView.verticalAlign = .bottom

            // ローテーション時のアニメーションを設定する
            amoadView.rotateTransition = .flipFromLeft

            // クリック時のアニメーションを設定する
            amoadView.clickTransition = .jump
            
            // 広告ID（sid）を設定する
            amoadView.sid = customEventClassData.sid
        }
    }
    
    func AMoAdViewDidReceiveAd(_ amoadView: AMoAdView!) {
        print("正常に広告を受信した")
        self.delegate.bannerCustomEvent(self, didLoadAd: amoadView)
    }
    
    func AMoAdViewDidFailToReceiveAd(_ amoadView: AMoAdView!, error: NSError!) {
        print("広告の取得に失敗した（error:\(error)）")
        self.delegate.bannerCustomEvent(self, didFailToLoadAdWithError: nil)
    }
    
    func AMoAdViewDidReceiveEmptyAd(_ amoadView: AMoAdView!) {
        print("空の広告を受信した")
        self.delegate.bannerCustomEvent(self, didFailToLoadAdWithError: nil)
    }
}

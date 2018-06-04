//
//  AMoAdMoPubAdapterBanner.swift
//  AMoAdMoPubDemo
//

import Foundation
import UIKit

@objc(AMoAdMoPubAdapterBanner)
class AMoAdMoPubAdapterBanner: MPBannerCustomEvent {
    
    public override func requestAd(with size: CGSize, customEventInfo info: [AnyHashable: Any]!) {
        
        let customEventClassData = AMoAdMoPubUtil.extractCustomEventClassDataForDisplay(info: info)
        guard let _customEventClassData = customEventClassData else {
            return
        }
        
        self.preparedBanner(customEventClassData: _customEventClassData)
    }
    
    fileprivate func preparedBanner(customEventClassData: AMoAdCustomEventClassDataForDisplay) {
        
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

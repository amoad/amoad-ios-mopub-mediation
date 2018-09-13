//
//  AMoAdMoPubAdapterBanner.swift
//  AMoAdMoPubDemo
//

import Foundation
import UIKit

@objc(AMoAdMoPubAdapterBanner)
class AMoAdMoPubAdapterBanner: MPBannerCustomEvent {
    
    public override func requestAd(with size: CGSize, customEventInfo info: [AnyHashable: Any]!) {

        let customEventClassData = AMoAdMoPubUtil.extractBannerCustomEventClassData(info: info)
        guard let _customEventClassData = customEventClassData else {
            return
        }
        initBanner(customEventClassData: _customEventClassData, size: size)
    }
    
    fileprivate func initBanner(customEventClassData: BannerCustomEventClassData, size: CGSize) {
        if let amoadView = AMoAdView.init() {
            amoadView.frame.size = size
            amoadView.delegate = self
            /// 任意でpropertyの割り当てをしてください。
            //            amoadView.horizontalAlign = .center
            //            amoadView.verticalAlign = .bottom
            //            amoadView.rotateTransition = .flipFromLeft
            //            amoadView.clickTransition = .jump
            amoadView.sid = customEventClassData.sid
            delegate.bannerCustomEvent(self, didLoadAd: amoadView)
        }
    }
}

extension AMoAdMoPubAdapterBanner: AMoAdViewDelegate {
    
    func aMoAdViewDidReceiveAd(_ amoadView: AMoAdView!) {
        print("正常に広告を受信した")
//        delegate.bannerCustomEvent(self, didLoadAd: amoadView)
    }
    
    func aMoAdViewDidFail(toReceiveAd amoadView: AMoAdView!, error: Error!) {
        print("広告の取得に失敗した（error:\(String(describing: error))")
        delegate.bannerCustomEvent(self, didFailToLoadAdWithError: nil)
    }
    
    func aMoAdViewDidReceiveEmptyAd(_ amoadView: AMoAdView!) {
        print("空の広告を受信した")
        delegate.bannerCustomEvent(self, didFailToLoadAdWithError: nil)
    }
    
    func aMoAdViewDidClick(_ amoadView: AMoAdView!) {
        print("広告がクリックされた")
        delegate.bannerCustomEventWillLeaveApplication(self)
    }
    
    func aMoAdViewWillClickBack(_ amoadView: AMoAdView!) {
        print("広告がクリックされた後、戻ってくる")
    }
    
    func aMoAdViewDidClickBack(_ amoadView: AMoAdView!) {
        print("広告がクリックされた後、戻ってきた")
    }
}

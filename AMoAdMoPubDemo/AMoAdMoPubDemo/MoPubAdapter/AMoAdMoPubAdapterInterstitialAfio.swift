//
//  AMoAdMoPubAdapterInterstitialAfio.swift
//  AMoAdMoPubDemo
//

import Foundation
import UIKit

@objc(AMoAdMoPubAdapterInterstitialAfio)
class AMoAdMoPubAdapterInterstitialAfio: MPInterstitialCustomEvent {
    
    var customEventClassData: InterstitialAfioCustomEventClassData?
    
    public override func requestInterstitial(withCustomEventInfo info: [AnyHashable: Any]!) {
        
        self.customEventClassData = AMoAdMoPubUtil.extractInterstitialAfioCustomEventClassData(info: info)
        
        guard let _customEventClassData = self.customEventClassData else {
            return
        }
        
        initInterstitialAfio(customEventClassData: _customEventClassData)
    }
    
    fileprivate func initInterstitialAfio(customEventClassData: InterstitialAfioCustomEventClassData) {

        AMoAdInterstitialVideo.sharedInstance(withSid: customEventClassData.sid, tag: "").delegate = self
//        AMoAdInterstitialVideo.sharedInstance(withSid: sid, tag: "").isCancellable = false // 任意でisCancellableの割り当てをしてください。
        AMoAdInterstitialVideo.sharedInstance(withSid: customEventClassData.sid, tag: "").load()
    }
    
    public override func showInterstitial(fromRootViewController rootViewController: UIViewController!) {
        guard let _customEventClassData = self.customEventClassData else {
            return
        }
        
        if AMoAdInterstitialVideo.sharedInstance(withSid: _customEventClassData.sid, tag: "").isLoaded {
            self.delegate.interstitialCustomEventWillAppear(self)
            AMoAdInterstitialVideo.sharedInstance(withSid: _customEventClassData.sid, tag: "").show()
            self.delegate.interstitialCustomEventDidAppear(self)
        } else {
            print("Interstitial Afio Ad wasn't loaded")
        }
    }
}

extension AMoAdMoPubAdapterInterstitialAfio: AMoAdInterstitialVideoDelegate {

    func amoadInterstitialVideo(_ amoadInterstitialVideo: AMoAdInterstitialVideo!, didLoadAd result: AMoAdResult) {
        // 広告ダウンロードが完了したら View を表示する
        switch result {
        case .success:
            print("広告ロード成功")
            self.delegate.interstitialCustomEvent(self, didLoadAd: nil)
        case .empty:
            print("広告ロード失敗")
            self.delegate.interstitialCustomEvent(self, didFailToLoadAdWithError: nil)
        case .failure:
            print("配信する広告がない")
            self.delegate.interstitialCustomEvent(self, didFailToLoadAdWithError: nil)
        }
    }

    func amoadInterstitialVideoDidStart(_ amoadInterstitialVideo: AMoAdInterstitialVideo!) {
        // 動画の再生を開始した
        print("amoadInterstitialVideoDidStart")
    }
    func amoadInterstitialVideoDidComplete(_ amoadInterstitialVideo: AMoAdInterstitialVideo!) {
        // 動画を最後まで再生完了した
        print("amoadInterstitialVideoDidComplete")
    }
    func amoadInterstitialVideoDidFailToPlay(_ amoadInterstitialVideo: AMoAdInterstitialVideo!) {
        // 動画の再生に失敗した
        print("amoadInterstitialVideoDidFailToPlay")
    }
    func amoadInterstitialVideoDidShow(_ amoadInterstitialVideo: AMoAdInterstitialVideo!) {
        // 広告を表示した
        print("amoadInterstitialVideoDidShow")
    }
    func amoadInterstitialVideoWillDismiss(_ amoadInterstitialVideo: AMoAdInterstitialVideo!) {
        // 広告を閉じた
        print("amoadInterstitialVideoWillDismiss")
        self.delegate.interstitialCustomEventWillDisappear(self)
        self.delegate.interstitialCustomEventDidDisappear(self)
    }
    func amoadInterstitialVideoDidClickAd(_ amoadInterstitialVideo: AMoAdInterstitialVideo!) {
        // 広告がクリックされた
        print("amoadInterstitialVideoDidClickAd")
        self.delegate.interstitialCustomEventDidReceiveTap(self)
        self.delegate.interstitialCustomEventWillLeaveApplication(self)
    }
}

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
        
        self.customEventClassData = AmoadMoPubUtil.extractCustomEventClassDataForDisplay(info: info)
        
        guard let _customEventClassData = self.customEventClassData else {
            return
        }
        
        self.preparedInterstitialAfio(customEventClassData: _customEventClassData)
    }
    
    fileprivate func preparedInterstitialAfio(customEventClassData: AmoadCustomEventClassDataForDisplay) {
        
        AMoAdNativeViewManager.shared().setEnvStaging(true)
        
        AMoAdInterstitialVideo.sharedInstance(withSid: customEventClassData.sid, tag: "").delegate = self
        
        // 広告ダウンロード
        AMoAdInterstitialVideo.sharedInstance(withSid: customEventClassData.sid, tag: "").load()
    }
    
    public override func showInterstitial(fromRootViewController rootViewController: UIViewController!) {
        guard let _customEventClassData = self.customEventClassData else {
            return
        }
        self.delegate.interstitialCustomEventWillAppear(self)
        AMoAdInterstitialVideo.sharedInstance(withSid: _customEventClassData.sid, tag: "").show()
        self.delegate.interstitialCustomEventDidAppear(self)
    }
    
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
        self.delegate.interstitialCustomEventWillDisappear(self)
        self.delegate.interstitialCustomEventDidDisappear(self)
    }
    func amoadInterstitialVideoDidFailToPlay(_ amoadInterstitialVideo: AMoAdInterstitialVideo!) {
        // 動画の再生に失敗した
        print("amoadInterstitialVideoDidFailToPlay")
        self.delegate.interstitialCustomEventWillDisappear(self)
        self.delegate.interstitialCustomEventDidDisappear(self)
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
        self.delegate.interstitialCustomEventWillDisappear(self)
        self.delegate.interstitialCustomEventDidDisappear(self)
    }
}

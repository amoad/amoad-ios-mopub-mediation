//
//  AmoadMoPubAdapterInterstitial.swift
//  AmoadMoPubDemo
//
//  Created by 菅原 清吾 on 2018/05/21.
//  Copyright © 2018年 Amoad. All rights reserved.
//

import Foundation
import UIKit

@objc(AmoadMoPubAdapterInterstitial)
class AmoadMoPubAdapterInterstitial: MPInterstitialCustomEvent {
    
    var customEventClassData: AmoadCustomEventClassDataForDisplay?
    
    public override func requestInterstitial(withCustomEventInfo info: [AnyHashable: Any]!) {
        
        self.customEventClassData = AmoadMoPubUtil.extractCustomEventClassDataForDisplay(info: info)
        
        guard let _customEventClassData = self.customEventClassData else {
            return
        }
        
        self.preparedInterstitial(customEventClassData: _customEventClassData)
    }
    
    fileprivate func preparedInterstitial(customEventClassData: AmoadCustomEventClassDataForDisplay) {
        
        AMoAdView.setEnvStaging(true)

        AMoAdInterstitial.registerAd(withSid: customEventClassData.sid)
        AMoAdInterstitial.setAutoReloadWithSid(customEventClassData.sid, autoReload: true)
        AMoAdInterstitial.loadAd(withSid: customEventClassData.sid) { (sid, result, err) in
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
    }

    public override func showInterstitial(fromRootViewController rootViewController: UIViewController!) {
        
        guard let _customEventClassData = self.customEventClassData else {
            return
        }

        self.delegate.interstitialCustomEventWillAppear(self)
        
        AMoAdInterstitial.showAd(withSid: _customEventClassData.sid, completion: { (sid, result, err) in
            switch result {
            case .click:
                print("リンクボタンがクリックされたので閉じました")
                self.delegate.interstitialCustomEventWillDisappear(self)
                self.delegate.interstitialCustomEventDidDisappear(self)
            case .close:
                print("閉じるボタンがクリックされたので閉じました")
                self.delegate.interstitialCustomEventWillDisappear(self)
                self.delegate.interstitialCustomEventDidDisappear(self)
            case .closeFromApp:
                print("既に開かれているので開きませんでした")
                self.delegate.interstitialCustomEventWillDisappear(self)
                self.delegate.interstitialCustomEventDidDisappear(self)
            case .duplicated:
                print("アプリから閉じられました")
                self.delegate.interstitialCustomEventWillDisappear(self)
                self.delegate.interstitialCustomEventDidDisappear(self)
            case .failure:
                print("広告の取得に失敗しました:\(String(describing: err))")
                self.delegate.interstitialCustomEventWillDisappear(self)
                self.delegate.interstitialCustomEventDidDisappear(self)
            }
        })

        self.delegate.interstitialCustomEventDidAppear(self)
    }
}

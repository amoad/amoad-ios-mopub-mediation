//
//  AmoadMoPubAdapterInfeedAfio.swift
//  AmoadMoPubDemo
//
//  Created by 菅原 清吾 on 2018/05/22.
//  Copyright © 2018年 Amoad. All rights reserved.
//

import Foundation
import UIKit

@objc(AmoadMoPubAdapterInfeedAfio)
class AmoadMoPubAdapterInfeedAfio: MPBannerCustomEvent, AMoAdNativeAppDelegate {
    
    public override func requestAd(with size: CGSize, customEventInfo info: [AnyHashable: Any]!) {
        // Decording data from server
        let customEventClassData = AmoadMoPubUtil.extractCustomEventClassDataForInfeedAfio(info: info)
        guard let _customEventClassData = customEventClassData else {
            return
        }
        
        // Sending adData to amoadSDK
        self.preparedInfeedAfio(size:size, customEventClassData: _customEventClassData)
    }
    
    fileprivate func preparedInfeedAfio(size: CGSize, customEventClassData: AmoadCustomEventClassDataForInfeedAfio) {
        
        AMoAdNativeViewManager.shared().setEnvStaging(true)

        // 広告 View を xib から生成する
        let view = Bundle.main.loadNibNamed(customEventClassData.file, owner: nil, options: nil)?.first as! UIView
        view.frame.size = size
        
        // 広告準備
        AMoAdNativeViewManager.shared().prepareAd(withSid: customEventClassData.sid, iconPreloading: true, imagePreloading: true)
        
        // 広告取得
        AMoAdNativeViewManager.shared().renderAd(withSid: customEventClassData.sid, tag: "", view: view, delegate: self)

        self.delegate.bannerCustomEvent(self, didLoadAd: view)
    }
}

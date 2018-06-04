//
//  AMoAdMoPubAdapterInfeedAfio.swift
//  AMoAdMoPubDemo
//

import Foundation
import UIKit

@objc(AMoAdMoPubAdapterInfeedAfio)
class AMoAdMoPubAdapterInfeedAfio: MPBannerCustomEvent, AMoAdNativeAppDelegate {
    
    public override func requestAd(with size: CGSize, customEventInfo info: [AnyHashable: Any]!) {
        
        let customEventClassData = AMoAdMoPubUtil.extractCustomEventClassDataForInfeedAfio(info: info)
        guard let _customEventClassData = customEventClassData else {
            return
        }
        
        self.preparedInfeedAfio(size:size, customEventClassData: _customEventClassData)
    }
    
    fileprivate func preparedInfeedAfio(size: CGSize, customEventClassData: AMoAdCustomEventClassDataForInfeedAfio) {
        
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

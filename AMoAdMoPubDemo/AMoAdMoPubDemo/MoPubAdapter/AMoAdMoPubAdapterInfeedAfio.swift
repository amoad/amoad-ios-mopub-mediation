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
        
        self.initInfeedAfio(size:size, customEventClassData: _customEventClassData)
    }
    
    fileprivate func initInfeedAfio(size: CGSize, customEventClassData: AMoAdCustomEventClassDataForInfeedAfio) {

        // 広告 View を xib から生成する
        let view = Bundle.main.loadNibNamed(customEventClassData.file, owner: nil, options: nil)?.first as! UIView
        view.frame.size = size
        
        // 広告準備・取得
        AMoAdNativeViewManager.shared().prepareAd(withSid: customEventClassData.sid, iconPreloading: true, imagePreloading: true)
        AMoAdNativeViewManager.shared().renderAd(withSid: customEventClassData.sid, tag: "", view: view, delegate: self)
    }
}

extension AMoAdMoPubAdapterInfeedAfio {
    
    func amoadNativeDidReceive(_ sid: String!, tag: String!, view: UIView!, state: AMoAdResult) {
        switch state {
        case .success:
            print("広告ロード成功")
            self.delegate.bannerCustomEvent(self, didLoadAd: view)
        case .failure:
            print("広告ロード失敗")
            self.delegate.bannerCustomEvent(self, didFailToLoadAdWithError: nil)
        case .empty:
            print("配信する広告がない")
            self.delegate.bannerCustomEvent(self, didFailToLoadAdWithError: nil)
        }
    }
    
    func amoadNativeIconDidReceive(_ sid: String!, tag: String!, view: UIView!, state: AMoAdResult) {
        switch state {
        case .success:
            print("アイコン取得成功")
        case .failure:
            print("アイコン取得失敗")
        case .empty:
            print("配信するアイコンがない")
        }
    }
    
    func amoadNativeImageDidReceive(_ sid: String!, tag: String!, view: UIView!, state: AMoAdResult) {
        switch state {
        case .success:
            print("メイン画像取得成功")
        case .failure:
            print("メイン画像取得失敗")
        case .empty:
            print("配信するメイン画像がない")
        }
    }
    
    func amoadNativeDidClick(_ sid: String!, tag: String!, view: UIView!) {
        print("広告クリック")
        self.delegate.bannerCustomEventWillLeaveApplication(self)
    }
}

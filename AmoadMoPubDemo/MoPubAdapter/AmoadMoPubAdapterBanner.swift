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
        print("hoge:\(info)")
    }
}

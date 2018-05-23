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
class AmoadMoPubAdapterInterstitialAfio: MPInterstitialCustomEvent {
    public override func requestInterstitial(withCustomEventInfo info: [AnyHashable: Any]!) {
        print("hoge")
    }
}

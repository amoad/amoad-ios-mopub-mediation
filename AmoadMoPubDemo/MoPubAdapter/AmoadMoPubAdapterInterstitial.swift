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
    
    public override func requestInterstitial(withCustomEventInfo info: [AnyHashable: Any]!) {
        
        // Decording data from server
        let customEventClassData = AmoadMoPubUtil.extractCustomEventClassData(info: info)
        
        guard let _customEventClassData = customEventClassData else {
            return
        }        
    }

}

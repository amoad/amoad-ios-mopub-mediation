//
//  AmoadMoPubUtil.swift
//  AmoadMoPubDemo
//
//  Created by 菅原 清吾 on 2018/05/16.
//  Copyright © 2018年 Amoad. All rights reserved.
//

import Foundation
import UIKit

class AmoadMoPubUtil {
    
    static func getBannerSize(bannerSize: AMoAdBannerSize) -> CGSize {
        switch bannerSize {
        case .b320x50:
            return AMoAdView.size(with: .b320x50)
        case .b320x100:
            return AMoAdView.size(with: .b320x100)
        case .b300x250:
            return AMoAdView.size(with: .b300x250)
        case .b300x100:
            return AMoAdView.size(with: .b320x100)
        case .b728x90:
            return AMoAdView.size(with: .b728x90)
        }
    }

    /// - Parameter info: MoPub CustomEventInfo Object
    /// - Returns: AmoadCustomEventClassDataForDisplay
    static func extractCustomEventClassDataForDisplay(info: [AnyHashable: Any]) -> AmoadCustomEventClassDataForDisplay? {
        
        let decoder = JSONDecoder()
        
        do {
            let jsonData = try JSONSerialization.data(withJSONObject: info, options: .prettyPrinted)
            let customEventClassData = try decoder.decode(AmoadCustomEventClassDataForDisplay.self, from: jsonData)
            return customEventClassData
        } catch {
            return nil
        }
    }
    
    /// - Parameter info: MoPub CustomEventInfo Object
    /// - Returns: AmoadCustomEventClassDataForInfeedAfio
    static func extractCustomEventClassDataForInfeedAfio(info: [AnyHashable: Any]) -> AmoadCustomEventClassDataForInfeedAfio? {
        
        let decoder = JSONDecoder()
        
        do {
            let jsonData = try JSONSerialization.data(withJSONObject: info, options: .prettyPrinted)
            let customEventClassData = try decoder.decode(AmoadCustomEventClassDataForInfeedAfio.self, from: jsonData)
            return customEventClassData
        } catch {
            return nil
        }
    }
}

struct AmoadCustomEventClassDataForDisplay: Codable {
    var sid: String
}

struct AmoadCustomEventClassDataForInfeedAfio: Codable {
    var sid: String
    var file: String
}


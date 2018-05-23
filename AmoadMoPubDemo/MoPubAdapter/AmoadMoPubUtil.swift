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
    
    static func getAdSize(bannerSize: AMoAdBannerSize) -> CGSize {
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
    /// - Returns: AmoadCustomEventClassData
    static func extractCustomEventClassData(info: [AnyHashable: Any]) -> AmoadCustomEventClassData? {
        
        let decoder = JSONDecoder()
        
        do {
            let jsonData = try JSONSerialization.data(withJSONObject: info, options: .prettyPrinted)
            let customEventClassData = try decoder.decode(AmoadCustomEventClassData.self, from: jsonData)
            return customEventClassData
        } catch {
            return nil
        }
    }
    
    /// - Parameter info: MoPub CustomEventInfo Object
    /// - Returns: AmoadCustomEventClassDataAfio
    static func extractCustomEventClassDataAfio(info: [AnyHashable: Any]) -> AmoadCustomEventClassDataAfio? {
        
        let decoder = JSONDecoder()
        
        do {
            let jsonData = try JSONSerialization.data(withJSONObject: info, options: .prettyPrinted)
            let customEventClassData = try decoder.decode(AmoadCustomEventClassDataAfio.self, from: jsonData)
            return customEventClassData
        } catch {
            return nil
        }
    }
}

struct AmoadCustomEventClassData: Codable {
    var sid: String
}

struct AmoadCustomEventClassDataAfio: Codable {
    var sid: String
    var file: String
}


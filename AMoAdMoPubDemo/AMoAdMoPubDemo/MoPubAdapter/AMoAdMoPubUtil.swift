//
//  AMoAdMoPubUtil.swift
//  AMoAdMoPubDemo
//

import Foundation
import UIKit

class AMoAdMoPubUtil {
    
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
    /// - Returns: AMoAdCustomEventClassDataForDisplay
    static func extractCustomEventClassDataForDisplay(info: [AnyHashable: Any]) -> AMoAdCustomEventClassDataForDisplay? {
        
        let decoder = JSONDecoder()
        
        do {
            let jsonData = try JSONSerialization.data(withJSONObject: info, options: .prettyPrinted)
            let customEventClassData = try decoder.decode(AMoAdCustomEventClassDataForDisplay.self, from: jsonData)
            return customEventClassData
        } catch {
            return nil
        }
    }
    
    /// - Parameter info: MoPub CustomEventInfo Object
    /// - Returns: AMoAdCustomEventClassDataForInfeedAfio
    static func extractCustomEventClassDataForInfeedAfio(info: [AnyHashable: Any]) -> AMoAdCustomEventClassDataForInfeedAfio? {
        
        let decoder = JSONDecoder()
        
        do {
            let jsonData = try JSONSerialization.data(withJSONObject: info, options: .prettyPrinted)
            let customEventClassData = try decoder.decode(AMoAdCustomEventClassDataForInfeedAfio.self, from: jsonData)
            return customEventClassData
        } catch {
            return nil
        }
    }
}

struct AMoAdCustomEventClassDataForDisplay: Codable {
    var sid: String
}

struct AMoAdCustomEventClassDataForInfeedAfio: Codable {
    var sid: String
    var file: String
}

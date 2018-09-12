//
//  AMoAdMoPubUtil.swift
//  AMoAdMoPubDemo
//

import Foundation
import UIKit

class AMoAdMoPubUtil {

    /// - Parameter info: MoPub CustomEventInfo Object
    /// - Returns: BannerCustomEventClassData
    static func extractBannerCustomEventClassData(info: [AnyHashable: Any]) -> BannerCustomEventClassData? {
        
        let decoder = JSONDecoder()
        
        do {
            let jsonData = try JSONSerialization.data(withJSONObject: info, options: .prettyPrinted)
            let customEventClassData = try decoder.decode(BannerCustomEventClassData.self, from: jsonData)
            return customEventClassData
        } catch {
            return nil
        }
    }

    /// - Parameter info: MoPub CustomEventInfo Object
    /// - Returns: InterstitialCustomEventClassData
    static func extractInterstitialCustomEventClassData(info: [AnyHashable: Any]) -> InterstitialCustomEventClassData? {
        
        let decoder = JSONDecoder()
        
        do {
            let jsonData = try JSONSerialization.data(withJSONObject: info, options: .prettyPrinted)
            let customEventClassData = try decoder.decode(InterstitialCustomEventClassData.self, from: jsonData)
            return customEventClassData
        } catch {
            return nil
        }
    }

    /// - Parameter info: MoPub CustomEventInfo Object
    /// - Returns: InfeedAfioCustomEventClassData
    static func extractInfeedAfioCustomEventClassData(info: [AnyHashable: Any]) -> InfeedAfioCustomEventClassData? {
        
        let decoder = JSONDecoder()
        
        do {
            let jsonData = try JSONSerialization.data(withJSONObject: info, options: .prettyPrinted)
            let customEventClassData = try decoder.decode(InfeedAfioCustomEventClassData.self, from: jsonData)
            return customEventClassData
        } catch {
            return nil
        }
    }

    /// - Parameter info: MoPub CustomEventInfo Object
    /// - Returns: InterstitialAfioCustomEventClassData
    static func extractInterstitialAfioCustomEventClassData(info: [AnyHashable: Any]) -> InterstitialAfioCustomEventClassData? {
        
        let decoder = JSONDecoder()
        
        do {
            let jsonData = try JSONSerialization.data(withJSONObject: info, options: .prettyPrinted)
            let customEventClassData = try decoder.decode(InterstitialAfioCustomEventClassData.self, from: jsonData)
            return customEventClassData
        } catch {
            return nil
        }
    }
}

struct BannerCustomEventClassData: Codable {
    var sid: String
}

struct InterstitialCustomEventClassData: Codable {
    var sid: String
}

struct InfeedAfioCustomEventClassData: Codable {
    var sid: String
    var file: String
}

struct InterstitialAfioCustomEventClassData: Codable {
    var sid: String
}

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
    
    /// - Parameter info: MoPub CustomEventInfo Object
    /// - Returns: LDOCustomEventClassData
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
}

struct AmoadCustomEventClassData: Codable {
    var sid: String
}


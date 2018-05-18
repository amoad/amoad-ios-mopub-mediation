//
//  AmoadMoPubBridgeAdapterView.swift
//  AmoadMoPubDemo
//
//  Created by 菅原 清吾 on 2018/05/18.
//  Copyright © 2018年 Amoad. All rights reserved.
//

import Foundation
import UIKit

class AmoadMoPubBridgeAdapterView: UIView {
    
    var ad: AMoAdView?
    
    init(frame: CGRect, ad: AMoAdView) {
        self.ad = ad
        
        super.init(frame: frame)
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

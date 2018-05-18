//
//  BannerViewController.swift
//  AmoadMoPubDemo
//
//  Created by 菅原 清吾 on 2018/05/16.
//  Copyright © 2018年 Amoad. All rights reserved.
//

import UIKit

class BannerViewController: UIViewController, MPAdViewDelegate {

    let adUnitIDs = "f856a200dc57449e81c5a6edddb656c0"
    let bannerSize = CGSize(width: 320, height: 50)
    var mpAdView: MPAdView?
    var adViewSize: CGSize?

    func viewControllerForPresentingModalView() -> UIViewController! {
        return self
    }

    func adViewDidLoadAd(_ view: MPAdView!) {
        if self.mpAdView == nil {
            self.mpAdView = view
        }
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
//        let adView = MPAdView(adUnitId: self.adUnitIDs, size: self.bannerSize)
//        if let adView = adView {
//            adView.delegate = self
//            //        adView?.isHidden = true
//            self.view.addSubview(adView)
//            adView.loadAd()
//        }
        
        AMoAdLogger.shared().logging = true
        AMoAdLogger.shared().trace = true
        AMoAdView.setEnvStaging(true)
        
        if let amoadView = AMoAdView.init(frame: CGRect(x:0,y:0,width:320,height:50)) {

            // デリゲートを設定する
            amoadView.delegate = self
            
            // 横方向を中央寄せ(AMoAdHorizontalAlignCenter)に指定
            amoadView.horizontalAlign = .center

            // 縦方向を下寄せ(AMoAdVerticalAlignBottom) に指定
            amoadView.verticalAlign = .bottom

            // ローテーション時のアニメーションを設定する
            amoadView.rotateTransition = .flipFromLeft

            // クリック時のアニメーションを設定する
            amoadView.clickTransition = .jump
            
            // 広告ID（sid）を設定する
            amoadView.sid = "62056d310111552ca132e1f02a781392cef6f913109aef0a6d68bb82cb654bc5"
            
            self.view.addSubview(amoadView)
        }

    }

    func AMoAdViewDidReceiveAd(_ amoadView: AMoAdView!) {
        print("正常に広告を受信した")
    }
    
    func AMoAdViewDidFailToReceiveAd(_ amoadView: AMoAdView!, error: NSError!) {
        print("広告の取得に失敗した（error:\(error)）")
    }
    
    func AMoAdViewDidReceiveEmptyAd(_ amoadView: AMoAdView!) {
        print("空の広告を受信した")
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}

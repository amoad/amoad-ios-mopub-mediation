//
//  AfioViewController.swift
//  AmoadMoPubDemo
//
//  Created by 菅原 清吾 on 2018/05/21.
//  Copyright © 2018年 Amoad. All rights reserved.
//

import UIKit

class AfioViewController: UIViewController, MPAdViewDelegate {

    let adUnitIDs = "405dd5d3f5444d9db8224b1db6e168e6"
    let bannerSize = CGSize(width: 320, height: 500)
    @IBOutlet weak var adView: UIView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        let view = MPAdView(adUnitId: self.adUnitIDs, size: self.bannerSize)
        if let view = view {
            view.delegate = self
            view.translatesAutoresizingMaskIntoConstraints = false
            self.adView.addSubview(view)
            self.adView.addConstraints(NSLayoutConstraint.constraints(withVisualFormat: "V:|-(1)-[view]-(1)-|", options:.alignAllCenterX, metrics: nil, views: ["view": view]))
            self.adView.addConstraints(NSLayoutConstraint.constraints(withVisualFormat: "H:|-(1)-[view]-(1)-|", options:.alignAllCenterY, metrics: nil, views: ["view": view]))
            view.loadAd()
        }
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    // Function for failed "loading" of an ad.
    func adViewDidFail(toLoadAd view: MPAdView!) {
        print("Failed to load ad")
    }
    
    // Function for successful loading of ad.
    func adViewDidLoadAd(_ view: MPAdView!) {
        print("The ad loaded")
    }
    
    func viewControllerForPresentingModalView() -> UIViewController {
        return self
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

//
//  InterstitialAfioViewController.swift
//  AmoadMoPubDemo
//
//  Created by 菅原 清吾 on 2018/05/23.
//  Copyright © 2018年 Amoad. All rights reserved.
//

import UIKit

class InterstitialAfioViewController: UIViewController {

    var adController: MPInterstitialAdController?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        // Do any additional setup after loading the view.
        let adUnitId_interstitial = "160da00bfd5d45dea664ffed5e50c692"
        adController = MPInterstitialAdController(forAdUnitId: adUnitId_interstitial)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func loadInterstitial(_ sender: Any) {
        self.adController?.loadAd()
    }
    
    @IBAction func showInterstitial(_ sender: Any) {
        self.adController?.show(from: self)
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

//
//  InterstitialViewController.swift
//  AMoAdMoPubDemo
//

import UIKit

class InterstitialViewController: UIViewController {
    
    let adUnitIDs = "管理画面から取得したAd unit IDを指定してください"
    var adController: MPInterstitialAdController?

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        adController = MPInterstitialAdController(forAdUnitId: adUnitIDs)
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func loadInterstitial(_ sender: Any) {
        adController?.loadAd()
    }
    
    @IBAction func showInterstitial(_ sender: Any) {
        adController?.show(from: self)
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


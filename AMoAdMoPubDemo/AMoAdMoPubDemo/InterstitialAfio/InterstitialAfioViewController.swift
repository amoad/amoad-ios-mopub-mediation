//
//  InterstitialAfioViewController.swift
//  AMoAdMoPubDemo
//

import UIKit

class InterstitialAfioViewController: UIViewController {
    
    var interstitialAfio: MPInterstitialAdController!
    let adUnitIDs = "管理画面から取得したAd unit IDを指定してください"

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    fileprivate func createAndLoadInterstitialAfio() -> MPInterstitialAdController {
        
        interstitialAfio = MPInterstitialAdController(forAdUnitId: adUnitIDs)
        interstitialAfio.delegate = self
        interstitialAfio.loadAd()
        return interstitialAfio
    }

    @IBAction func showInterstitial(_ sender: Any) {
        interstitialAfio = createAndLoadInterstitialAfio()
    }
    
    /*
     MARK: - Navigation
     
     In a storyboard-based application, you will often want to do a little preparation before navigation
     override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
     Get the new view controller using segue.destinationViewController.
     Pass the selected object to the new view controller.
     }
     */
    
}

extension InterstitialAfioViewController: MPInterstitialAdControllerDelegate {
    
    func interstitialDidLoadAd(_ view: MPInterstitialAdController!) {
        print("interstitialDidLoadAd")
        if view.ready {
            interstitialAfio.show(from: self)
        } else {
            print("Interstitial Ad wasn't ready")
        }
    }
    
    func interstitialDidFail(toLoadAd view: MPInterstitialAdController!) {
        print("interstitialDidFail")
    }
    
    func interstitialWillAppear(_ view: MPInterstitialAdController!) {
        print("interstitialWillAppear")
    }
    
    func interstitialDidAppear(_ view: MPInterstitialAdController!) {
        print("interstitialDidAppear")
    }
    
    func interstitialWillDisappear(_ view: MPInterstitialAdController!) {
        print("interstitialWillDisappear")
    }
    
    func interstitialDidDisappear(_ view: MPInterstitialAdController!) {
        print("interstitialDidDisappear")
    }
    
    func interstitialDidExpire(_ view: MPInterstitialAdController!) {
        print("interstitialDidExpire")
    }
    
    func interstitialDidReceiveTapEvent(_ view: MPInterstitialAdController!) {
        print("interstitialDidReceiveTapEvent")
    }
}

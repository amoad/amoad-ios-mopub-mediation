//
//  AfioViewController.swift
//  AMoAdMoPubDemo
//

import UIKit

class AfioViewController: UIViewController, MPAdViewDelegate {
    
    let adUnitIDs = "405dd5d3f5444d9db8224b1db6e168e6"
    @IBOutlet weak var adView: UIView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        self.loadMPAdView()
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func loadMPAdView() {
        let view = MPAdView(adUnitId: self.adUnitIDs, size: self.adView.frame.size)
        if let view = view {
            view.delegate = self
            // 自動更新をoffにする
            view.stopAutomaticallyRefreshingContents()
            adView.addSubview(view)
            view.loadAd()
        }
    }
    
    // Function for failed "loading" of an ad.
    func adViewDidFail(toLoadAd view: MPAdView!) {
        print("Failed to load ad")
    }
    
    // Function for successful loading of ad.
    func adViewDidLoadAd(_ view: MPAdView!) {
        print("The ad loaded")
        if let mpAdView = view {
            mpAdView.translatesAutoresizingMaskIntoConstraints = false
            adView.addConstraints(NSLayoutConstraint.constraints(withVisualFormat: "V:|-(1)-[view]-(1)-|", options:.alignAllCenterX, metrics: nil, views: ["view": mpAdView]))
            adView.addConstraints(NSLayoutConstraint.constraints(withVisualFormat: "H:|-(1)-[view]-(1)-|", options:.alignAllCenterY, metrics: nil, views: ["view": mpAdView]))
        }
    }
    
    func viewControllerForPresentingModalView() -> UIViewController {
        return self
    }
    
    @IBAction func buttonTapped(_ sender: Any) {
        self.removeAllSubviews(parentView: adView)
        self.loadMPAdView()
    }
    
    func removeAllSubviews(parentView: UIView){
        let subviews = parentView.subviews
        for subview in subviews {
            subview.removeFromSuperview()
        }
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

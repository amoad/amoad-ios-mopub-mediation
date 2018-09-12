//
//  AfioViewController.swift
//  AMoAdMoPubDemo
//

import UIKit

class AfioViewController: UIViewController {
    
    var infeedAfio: MPAdView!
    let adUnitIDs = "管理画面から取得したAd unit IDを指定してください"
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        infeedAfio = createAndLoadInfeedAfio()
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    fileprivate func createAndLoadInfeedAfio() -> MPAdView {
        
        infeedAfio = MPAdView(adUnitId: self.adUnitIDs, size: self.view.frame.size)
        infeedAfio.delegate = self
        infeedAfio.loadAd()
        return infeedAfio
    }
    
    func viewControllerForPresentingModalView() -> UIViewController {
        return self
    }
    
    fileprivate func addInfeedAfioToView(_ bannerView: MPAdView) {
        bannerView.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(bannerView)
        view.addConstraints(
            [NSLayoutConstraint(item: bannerView,
                                attribute: .width,
                                relatedBy: .equal,
                                toItem: view,
                                attribute: .width,
                                multiplier: 1,
                                constant: 0),
             NSLayoutConstraint(item: bannerView,
                                attribute: .height,
                                relatedBy: .equal,
                                toItem: view,
                                attribute: .height,
                                multiplier: 1,
                                constant: 0),
             NSLayoutConstraint(item: bannerView,
                                attribute: .centerX,
                                relatedBy: .equal,
                                toItem: view,
                                attribute: .centerX,
                                multiplier: 1,
                                constant: 0),
             NSLayoutConstraint(item: bannerView,
                                attribute: .centerY,
                                relatedBy: .equal,
                                toItem: view,
                                attribute: .centerY,
                                multiplier: 1,
                                constant: 0)
            ]
        )
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

extension AfioViewController: MPAdViewDelegate {

    // Function for successful loading of ad.
    func adViewDidLoadAd(_ view: MPAdView!) {
        print("adViewDidLoadAd")
        addInfeedAfioToView(view)
    }

    // Function for failed "loading" of an ad.
    func adViewDidFail(toLoadAd view: MPAdView!) {
        print("adViewDidFail")
    }
    
    func willPresentModalView(forAd view: MPAdView!) {
        print("willPresentModalViewForAd")
    }
    
    func didDismissModalView(forAd view: MPAdView!) {
        print("willPresentModalViewForAd")
    }

    func willLeaveApplication(fromAd view: MPAdView!) {
        print("willPresentModalViewForAd")
    }
}

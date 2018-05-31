//
//  BannerViewController.swift
//  AmoadMoPubDemo
//

import UIKit

class BannerViewController: UIViewController, MPAdViewDelegate {
    
    let adUnitIDs = "f856a200dc57449e81c5a6edddb656c0"

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        let adView = MPAdView(adUnitId: self.adUnitIDs, size: CGSize.zero)
        if let adView = adView {
            adView.delegate = self
            self.view.addSubview(adView)
            adView.loadAd()
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
        if let mpAdView = view {
            let bannerSize = AMoAdMoPubUtil.getBannerSize(bannerSize: AMoAdBannerSize.b320x50)
            mpAdView.frame = CGRect(x:(self.view.bounds.size.width - bannerSize.width) / 2, y:self.view.bounds.size.height - bannerSize.height, width:bannerSize.width, height:bannerSize.height)
        }
    }

    func viewControllerForPresentingModalView() -> UIViewController {
        return self
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

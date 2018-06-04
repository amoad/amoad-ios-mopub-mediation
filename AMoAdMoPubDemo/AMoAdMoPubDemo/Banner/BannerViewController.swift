//
//  BannerViewController.swift
//  AMoAdMoPubDemo
//

import UIKit

class BannerViewController: UIViewController, MPAdViewDelegate {
    
    let adUnitIDs = "管理画面から取得したAd unit IDを指定してください"
    
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
    
    func viewControllerForPresentingModalView() -> UIViewController {
        return self
    }

    // Function for failed "loading" of an ad.
    func adViewDidFail(toLoadAd view: MPAdView!) {
        print("Failed to load ad")
    }
    
    // Function for successful loading of ad.
    func adViewDidLoadAd(_ view: MPAdView!) {
        print("The ad loaded")
        if let mpAdView = view {
            let bannerSize = CGSize(width: 320, height: 50)
            mpAdView.frame = CGRect(x:(self.view.bounds.size.width - bannerSize.width) / 2, y:self.view.bounds.size.height - bannerSize.height, width:bannerSize.width, height:bannerSize.height)
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

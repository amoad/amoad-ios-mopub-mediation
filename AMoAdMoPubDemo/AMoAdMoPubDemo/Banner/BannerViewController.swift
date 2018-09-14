//
//  BannerViewController.swift
//  AMoAdMoPubDemo
//

import UIKit

class BannerViewController: UIViewController {
    
    var bannerView: MPAdView!
    let adUnitIDs = "管理画面から取得したAd unit IDを指定してください"
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        bannerView = createAndLoadBannerView()
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    fileprivate func createAndLoadBannerView() -> MPAdView {
        
        bannerView = MPAdView(adUnitId: adUnitIDs, size: MOPUB_BANNER_SIZE)
        bannerView.delegate = self
        bannerView.loadAd()
        return bannerView
    }
    
    func viewControllerForPresentingModalView() -> UIViewController {
        return self
    }
    
    fileprivate func addBannerViewToView(_ bannerView: MPAdView) {
        let frame = CGRect(x:(self.view.bounds.size.width - bannerView.frame.size.width) / 2, y:self.view.bounds.size.height - bannerView.frame.size.height, width:bannerView.frame.size.width, height:bannerView.frame.size.height)
        bannerView.frame = frame
        view.addSubview(bannerView)
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

extension BannerViewController: MPAdViewDelegate {
    
    func adViewDidLoadAd(_ view: MPAdView!) {
        print("adViewDidLoadAd")
        addBannerViewToView(view)
    }

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

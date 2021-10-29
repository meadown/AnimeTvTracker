//
//  AdsManager.swift
//  AnimeTvTracker
//
//  Created by Danyal on 26/07/2021.
//

import UIKit
import GoogleMobileAds
import AppTrackingTransparency
import AdSupport

class AdsManager: NSObject {
    
    private static var _obj : AdsManager? = nil
    class var shared:AdsManager{
        get{
            if _obj == nil{
                _obj = AdsManager()
                
            }
            let lockQueue = DispatchQueue(label: "_obj")
            return lockQueue.sync{
                return _obj!
            }
        }
        
    }
    
    //    var addAttempt : String?
    var interstitial: GADInterstitialAd?
    
    
    func loadAd(){
        
        let request = GADRequest()
        //        interstitial.load
        
        GADInterstitialAd.load(withAdUnitID:Constants.InterstitialAdUnitID, request: request, completionHandler: { [self] ad, error in
            if let error = error {
                print("Failed to load interstitial ad with error: \(error.localizedDescription)")
                return
            }
            interstitial = ad
            interstitial?.fullScreenContentDelegate = self
            
        })
    }
    
    
    func requestIDFA() {
        if #available(iOS 14, *) {
            DispatchQueue.main.asyncAfter(deadline: .now() + 0.5) {
                ATTrackingManager.requestTrackingAuthorization(completionHandler: { status in
                    // Tracking authorization completed. Start loading ads here.
                    self.loadAd()
                })
            }
           
        } else {
            // Fallback on earlier versions
        }
    }
    
    func presentAd(vc : UIViewController){
        if interstitial != nil {
            interstitial?.present(fromRootViewController: vc)
            
        } else {
            print("Ad wasn't ready")
            self.loadAd()
        }
    }
    
}

extension AdsManager : GADFullScreenContentDelegate{
    /// Tells the delegate that the ad failed to present full screen content.
    func ad(_ ad: GADFullScreenPresentingAd, didFailToPresentFullScreenContentWithError error: Error) {
        print("Ad did fail to present full screen content.")
        //        self.error = error.localizedDescription
        //        self.loadAd()
    }
    
    /// Tells the delegate that the ad presented full screen content.
    func adDidPresentFullScreenContent(_ ad: GADFullScreenPresentingAd) {
        print("Ad did present full screen content.")
    }
    
    /// Tells the delegate that the ad dismissed full screen content.
    func adDidDismissFullScreenContent(_ ad: GADFullScreenPresentingAd) {
        print("Ad did dismiss full screen content.")
        interstitial = nil
        self.loadAd()
    }
}

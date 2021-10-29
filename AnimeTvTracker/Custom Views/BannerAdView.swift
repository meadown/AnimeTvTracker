//
//  BannerAdView.swift
//  AnimeTvTracker
//
//  Created by Danyal Naveed on 26/07/2021.
//

import UIKit
import GoogleMobileAds

class BannerAdView: UIView {

    @IBOutlet weak var indicator: UIActivityIndicatorView!
    @IBOutlet var adView: GADBannerView!
    
    /*
    // Only override draw() if you perform custom drawing.
    // An empty implementation adversely affects performance during animation.
    override func draw(_ rect: CGRect) {
        // Drawing code
    }
    */
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        if self.subviews.count == 0{
            //self.commonInit()
        }
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        if self.subviews.count == 0{
            self.commonInit()
        }
    }
    
    private func commonInit()
    {
        Bundle.main.loadNibNamed("BannerAdView", owner: self, options: nil)
        guard let content = adView else { return }
        content.frame = self.bounds
        content.autoresizingMask = [.flexibleHeight, .flexibleWidth]
        self.addSubview(content)
        self.indicator.startAnimating()
    }

}

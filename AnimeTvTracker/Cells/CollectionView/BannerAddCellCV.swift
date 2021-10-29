//
//  BannerAddCellCV.swift
//  AnimeTvTracker
//
//  Created by Danyal on 14/07/2021.
//

import UIKit
import GoogleMobileAds

class BannerAddCellCV: UICollectionViewCell {

    @IBOutlet weak var bannerView: GADBannerView!
    @IBOutlet weak var indicator: UIActivityIndicatorView!

    var parentVC : UIViewController!
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    
    func loadAd(){
        indicator.startAnimating()
        bannerView.adUnitID = Constants.bannderAdUnitID
        bannerView.rootViewController = parentVC
        bannerView.load(GADRequest())
        
    }

}

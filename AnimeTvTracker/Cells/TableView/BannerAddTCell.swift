//
//  BannerAddTCell.swift
//  AnimeTvTracker
//
//  Created by Danyal Naveed on 27/07/2021.
//

import UIKit
import GoogleMobileAds

class BannerAddTCell: UITableViewCell {

    @IBOutlet weak var bannerView: GADBannerView!
    @IBOutlet weak var indicator: UIActivityIndicatorView!

    var parentVC : UIViewController!

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    func loadAd(){
        indicator.startAnimating()
        bannerView.adUnitID = Constants.bannderAdUnitID
        bannerView.rootViewController = parentVC
        bannerView.load(GADRequest())
    }
    
}

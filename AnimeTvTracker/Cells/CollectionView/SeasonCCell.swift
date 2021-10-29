//
//  SeasonCCell.swift
//  AnimeTvTracker
//
//  Created by Danyal on 26/07/2021.
//

import UIKit

class SeasonCCell: UICollectionViewCell {

    @IBOutlet weak var img: UIImageView!
    @IBOutlet weak var lblSeasonName: UILabel!
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    
    func configureData(season : Season){
        lblSeasonName.text = season.name
        print("season image path :\(season.posterPath)")
        guard let imgPath = season.posterPath else {img.image = nil ; return}

        let urlStr = Constants.baseImgUrl + Constants.width200Img + imgPath
        guard let url = URL(string: urlStr) else {return}
//        animeImg.alpha = 0.0
        img.kf.indicatorType = .activity
        img.kf.setImage(with: url, progressBlock: nil) {
            [img] _ in UIView.animate(withDuration: 0.2) {
//                animeImg?.alpha = 1.0
            }
        }
    }
    
//    func setVideoData(video : VideoResult){
//        
//        guard let imgPath = video.pa else {img.image = nil ; return}
//
//        let urlStr = Constants.baseImgUrl + Constants.width200Img + imgPath
//        guard let url = URL(string: urlStr) else {return}
////        animeImg.alpha = 0.0
//        img.kf.indicatorType = .activity
//        img.kf.setImage(with: url, progressBlock: nil) {
//            [img] _ in UIView.animate(withDuration: 0.2) {
////                animeImg?.alpha = 1.0
//            }
//        }
//    }

}

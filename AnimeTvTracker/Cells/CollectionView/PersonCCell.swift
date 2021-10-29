//
//  PersonCCell.swift
//  AnimeTvTracker
//
//  Created by Danyal Naveed on 26/07/2021.
//

import UIKit

class PersonCCell: UICollectionViewCell {

    @IBOutlet weak var imgPerson: UIImageView!
    @IBOutlet weak var lblName: UILabel!
    @IBOutlet weak var lblRole: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    
    func configureData(cast : Cast){
        lblName.text = cast.name
        lblRole.text = cast.character
        print("profile image path :\(cast.profilePath)")

        guard let imgPath = cast.profilePath else {imgPerson.image = nil; return}

        let urlStr = Constants.baseImgUrl + Constants.height100Img + imgPath
        guard let url = URL(string: urlStr) else {return}
//        animeImg.alpha = 0.0
        imgPerson.kf.indicatorType = .activity
        imgPerson.kf.setImage(with: url, progressBlock: nil) {
            [imgPerson] _ in UIView.animate(withDuration: 0.2) {
//                animeImg?.alpha = 1.0
            }
        }
        
    }

}

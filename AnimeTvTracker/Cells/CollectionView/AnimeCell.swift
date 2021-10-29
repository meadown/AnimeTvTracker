//
//  AnimeCell.swift
//  AnimeTvTracker
//
//  Created by Danyal on 14/07/2021.
//

import UIKit
import Kingfisher


class AnimeCell: UICollectionViewCell {

    @IBOutlet weak var animeImg: UIImageView!
    
    @IBOutlet weak var lblRating: UILabel!
    @IBOutlet weak var btnfvrt: UIButton!
    @IBOutlet weak var lblAnimeName: UILabel!
    
    var animeRemoved : ((_ id : Int)->Void)? = nil
    
    var fvrtTV : FavouriteTVModel?
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    @IBAction func btnFvrtSelected(_ sender: UIButton) {
        
        if sender.isSelected{
            CoreDataManager.shared.removeFavourite(id: sender.tag)
            animeRemoved?(sender.tag)
        }
        else{
            if let tv = fvrtTV{
                CoreDataManager.shared.addFavourite(fvrtTV: tv)
            }
        }
        sender.isSelected = !sender.isSelected
    }
    
    func configureDateFvrt(tvFvrt : FavouriteTVModel){
        fvrtTV=tvFvrt
        btnfvrt.tag = tvFvrt.id
        lblAnimeName.text = tvFvrt.name
        lblRating.text =  "\(tvFvrt.rating )"
        animeImg.tag = tvFvrt.id
        print("anime image path :\(tvFvrt.id)")
        
        if let img = CoreDataManager.shared.getSavedImage(id: tvFvrt.id, quality: nil){
            animeImg.image = img
        }else{
            animeImg.image = nil
        }
        
        checkSelection(id: tvFvrt.id)

        
    }
    
    func checkSelection(id : Int){
        if CoreDataManager.shared.isFavourite(id : id){
            btnfvrt.isSelected = true
        }else{
            btnfvrt.isSelected = false
        }
    }
    
    
    func configureDate(tv : TvMainResult){
        checkSelection(id: tv.id)
        
        if CoreDataManager.shared.isFavourite(id : tv.id){
            btnfvrt.isSelected = true
        }else{
            btnfvrt.isSelected = false
        }
        fvrtTV = FavouriteTVModel(id: tv.id, name: tv.name, rating: tv.voteAverage, imagePath : tv.posterPath)
        btnfvrt.tag = tv.id
        lblAnimeName.text = tv.name
        lblRating.text =  "\(tv.voteAverage ?? 0)"
        animeImg.tag = tv.id
        print("anime image path :\(tv.posterPath)")

//        guard let poster = tv.posterPath
//        else if let poster = tv.backdropPath
//        else{
        
        let imgPath : String!
        if let poster = tv.posterPath{
            imgPath = poster
        }else if let poster = tv.backdropPath{
            imgPath = poster
        }else{
            imgPath = ""
            self.animeImg.image = nil ; return
        }
        
        let urlStr = Constants.baseImgUrl + Constants.width200Img + imgPath
//        ApiManager.shared.loadImages(urlStr : urlStr){ ee, err in
//            DispatchQueue.main.async {
//                if let imgData = ee{
//                    self.animeImg.image = UIImage(data: imgData, scale: 1)
//                }else{
//                    print("img error :\(err)")
//                }
//            }
//            
//        }
    
        let url = URL(string: urlStr)
//        animeImg.alpha = 0.0
        animeImg.kf.indicatorType = .activity
        animeImg.kf.setImage(with: url!, progressBlock: nil) {
            [animeImg] _ in UIView.animate(withDuration: 0.2) {
//                animeImg?.alpha = 1.0
            }
        }
        
//        let url = URL(string: urlStr)
//        let processor = DownsamplingImageProcessor(size: animeImg.bounds.size)
//                    // |> RoundCornerImageProcessor(cornerRadius: 20)
//        animeImg.kf.indicatorType = .activity
//        animeImg.kf.setImage(
//            with: url,
//            placeholder: UIImage(named: "placeholderImage"),
//            options: [
//                .processor(processor),
//                .scaleFactor(UIScreen.main.scale),
//                .transition(.fade(1)),
//                .cacheOriginalImage
//            ])
//        {
//            result in
//            switch result {
//            case .success(let value):
//                print("Task done for: \(value.source.url?.absoluteString ?? "")")
//            case .failure(let error):
//                print("Job failed: \(error.localizedDescription)")
//            }
//        }
        
        
        
    }
 
}

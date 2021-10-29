//
//  FavouriteVC.swift
//  AnimeTvTracker
//
//  Created by Danyal on 13/07/2021.
//

import UIKit
import GoogleMobileAds

class FavouriteVC: BaseVC {

    @IBOutlet weak var collectionView: UICollectionView!
    
    var fvrtTVs : [FavouriteTVModel] = []
    override func viewDidLoad() {
        super.viewDidLoad()

        self.navigationItem.title = "Favourite"
        
        self.collectionView.layer.maskedCorners = [.layerMinXMinYCorner,.layerMaxXMinYCorner]
        self.collectionView.layer.cornerRadius = 18
        
        collectionView.register(UINib(nibName: "AnimeCell", bundle: nil), forCellWithReuseIdentifier: "AnimeCell")
        collectionView.register(UINib(nibName: "BannerAddCellCV", bundle: nil), forCellWithReuseIdentifier: "BannerAddCellCV")
        collectionView.register(UINib(nibName: "LoadingView", bundle: nil), forSupplementaryViewOfKind: UICollectionView.elementKindSectionFooter, withReuseIdentifier: "LoadingView")
        
        collectionView.delegate = self
        collectionView.dataSource = self
        
        fvrtTVs = CoreDataManager.shared.getFavouriteList()
        print("fvrtTVs :\(fvrtTVs.count)")

    }
    
    override func viewDidAppear(_ animated: Bool) {
        AdsManager.shared.presentAd(vc: self)

    }
    
  

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */
    
    override func viewWillAppear(_ animated: Bool) {

        self.navigationController?.normalNavBar()
        fvrtTVs = CoreDataManager.shared.getFavouriteList()
        collectionView.reloadData()
    }

}


extension FavouriteVC : UICollectionViewDelegateFlowLayout, UICollectionViewDelegate, UICollectionViewDataSource{
     
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        /*
         if tvSeasons.count > 2 {
                    return 2 + 1
                }else{
                    return tvSeasons.count + 1
                }
        */
                
        return fvrtTVs.count + 1
    }
    
     func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        print("indexPath first time mai:\(indexPath)")

        if indexPath.row == 0 {
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "BannerAddCellCV", for: indexPath) as! BannerAddCellCV
            cell.parentVC = self
            cell.loadAd()
            return cell

        }else{
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "AnimeCell", for: indexPath) as! AnimeCell
            let item = fvrtTVs[indexPath.row-1]
            cell.configureDateFvrt(tvFvrt: item)
            cell.animeRemoved = {[unowned self] id in
                if let ind = fvrtTVs.firstIndex(where: {$0.id == id}){
                    fvrtTVs.remove(at: ind)
                    collectionView.deleteItems(at: [[0,ind+1]])
                }
                
            }
            return cell

        }
        
        
    }
    
    
    
     func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        if indexPath.row == 0{
            return CGSize(width: kGADAdSizeBanner.size.width, height: kGADAdSizeBanner.size.height+30)

        }else{
            let numberInOneRow : CGFloat = 2
            let width = (self.collectionView.frame.width-10*numberInOneRow-30)/numberInOneRow
            return CGSize(width: width, height: width*1.6 + 80)
        }
        
    }
    
     func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        let item = fvrtTVs[indexPath.row-1]
        let vc = AnimeDetailTVC()
        vc.animeID = item.id
        self.navigationController?.pushViewController(vc, animated: true)
    }
    
//    override func collectionView(_ collectionView: UICollectionView, willDisplay cell: UICollectionViewCell, forItemAt indexPath: IndexPath) {
//        print("indexPath:\(indexPath)")
//
//        if indexPath.row == tvSeasons.count && currentTotalPages.key < currentTotalPages.value {//&& tvSeasons[selectedTag].count > 0{  //numberofitem count
//            if var url = url{
//                self.callTVSeasonsAPis(url : &url,isUserInteraction: false)
//            }
//
//            print("ktni dafa chalega")
//        }else{
//            print("kuch nhi")
//        }
//    }
    
//    override func collectionView(_ collectionView: UICollectionView, viewForSupplementaryElementOfKind kind: String, at indexPath: IndexPath) -> UICollectionReusableView {
//        switch kind {
//                case UICollectionView.elementKindSectionFooter:
//            let footer = collectionView.dequeueReusableSupplementaryView(ofKind: kind, withReuseIdentifier: "LoadingView", for: indexPath) as! LoadingView
//
//            //                footer = SomeView
//            footer.indicator.startAnimating()
//            return footer
//
//        default:
//            print("anything")
//            return UICollectionReusableView()
//        }
//    }
    
//     func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, referenceSizeForFooterInSection section: Int) -> CGSize {
//        if isShowFoooter {
//            return CGSize(width: collectionView.frame.width, height: 50)
//        }else{
//            return .zero//CGSize(width: collectionView.frame.width, height: 50)
//        }
//    }
    
}



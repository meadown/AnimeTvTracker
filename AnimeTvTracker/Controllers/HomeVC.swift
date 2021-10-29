//
//  HomeVC.swift
//  AnimeTvTracker
//
//  Created by Danyal on 12/07/2021.
//

import UIKit
import GoogleMobileAds
import Kingfisher

enum TVCategory : Int{
    case Recent = 1
    case onAir = 2
    case Popular = 3
    case TopRated = 4
}

class HomeVC: BaseVC {

    @IBOutlet weak var btn1: RoundFillBtn!
    @IBOutlet weak var btn2: RoundFillBtn!
    @IBOutlet weak var btn3: RoundFillBtn!
    @IBOutlet weak var btn4: RoundFillBtn!
    
    @IBOutlet weak var collectionView: UICollectionView!
    
    var tvSeasonsRecent : [TvMainResult] = []
    var tvSeasonsOnAir : [TvMainResult] = []
    var tvSeasonsPopular : [TvMainResult] = []
    var tvSeasonsTopRated : [TvMainResult] = []
    
    var tvSeasons : [[TvMainResult]] = [[],[],[],[],[]]
    
    var urlArr : [String] = ["",Constants.recentUrl,Constants.onAirUrl,Constants.popularUrl,Constants.topRatedUrl]
    var currentTotalPages : Array<(key: Int,value:Int)> = [(key:0,value:0),(key:0,value:0),(key:0,value:0),(key:0,value:0),(key:0,value:0)]
    var selectedTag = 1
    let indicator = UIActivityIndicatorView()
    var isApiLoading = [false,true,false,false,false]

    var bannerView: GADBannerView!
    var isShowFoooter : Bool = false {
        didSet{
            if self.tvSeasons[selectedTag].count > 0 {
                
                
                if !isShowFoooter{
                    collectionView.layoutAttributesForSupplementaryElement(ofKind: UICollectionView.elementKindSectionFooter , at: [0,0])?.size = CGSize(width: collectionView.frame.width, height: 0)
                    
                }else{
                    collectionView.layoutAttributesForSupplementaryElement(ofKind: UICollectionView.elementKindSectionFooter , at: [0,0])?.size = CGSize(width: collectionView.frame.width, height: 50)
                }
            }
        }
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        self.navigationItem.title = "Home"
        
        collectionView.register(UINib(nibName: "AnimeCell", bundle: nil), forCellWithReuseIdentifier: "AnimeCell")
        collectionView.register(UINib(nibName: "BannerAddCellCV", bundle: nil), forCellWithReuseIdentifier: "BannerAddCellCV")
        
        
        collectionView.delegate = self
        collectionView.dataSource = self
//        collectionView.prefetchDataSource = self

        
        btn1.btnIsSelected = true
        
        
        collectionView.register(UINib(nibName: "LoadingView", bundle: nil), forSupplementaryViewOfKind: UICollectionView.elementKindSectionFooter, withReuseIdentifier: "LoadingView")

        
        
        callTVSeasonsAPis(tag: selectedTag)
        
        AdsManager.shared.requestIDFA()

        

    }

    //        bannerView = GADBannerView(adSize: kGADAdSizeBanner)
    //        bannerView.adUnitID = Constants.bannderAdUnitID
    //
    //        addBannerViewToView(bannerView)
    //        bannerView.rootViewController = self
    //        bannerView.load(GADRequest())
//        func addBannerViewToView(_ bannerView: GADBannerView) {
//          bannerView.translatesAutoresizingMaskIntoConstraints = false
//          view.addSubview(bannerView)
//          view.addConstraints(
//            [NSLayoutConstraint(item: bannerView,
//                                attribute: .bottom,
//                                relatedBy: .equal,
//                                toItem: bottomLayoutGuide,
//                                attribute: .top,
//                                multiplier: 1,
//                                constant: 0),
//             NSLayoutConstraint(item: bannerView,
//                                attribute: .centerX,
//                                relatedBy: .equal,
//                                toItem: view,
//                                attribute: .centerX,
//                                multiplier: 1,
//                                constant: 0)
//            ])
//         }
    
    override func viewWillAppear(_ animated: Bool) {
//        self.navigationController?.setNavigationBarHidden(false, animated: true)
//        self.navigationController?.normalNavBar()
        self.navigationController?.normalNavBar()
        
        AdsManager.shared.presentAd(vc: self)
//        AdsManager.shared.loadAd()

    }
    
    override func viewDidAppear(_ animated: Bool) {
        collectionView.reloadData()
        indicator.center = self.view.center
        self.view.addSubview(indicator)
        AdsManager.shared.presentAd(vc: self)
//        indicator.startAnimating()
    }
    
    
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

    @IBAction func btnCategorySelected(_ sender: RoundFillBtn) {
        
        
        if sender.isSelected{
            collectionView.scrollsToTop = true
//            UIView.animate(withDuration: 0.3){
//                collectionView.setContentOffset(.zero, animated: false)
//            }
            
            collectionView.setContentOffset(.zero, animated: true)


        }else{
            btn1.btnIsSelected = false
            btn2.btnIsSelected = false
            btn3.btnIsSelected = false
            btn4.btnIsSelected = false
            
            sender.btnIsSelected = true
            selectedTag = sender.tag
            collectionView.reloadData()
            if tvSeasons[selectedTag].count == 0 {
                callTVSeasonsAPis(tag: sender.tag)
            }else{
//                collectionView.scrollsToTop = true
//                collectionView.setContentOffset(.zero, animated: false)
//                collectionView.scrollToItem(at: [0,0], at: .top, animated: false)


            }
            
            
        }
        
    }
    
    func reloadCollectionData(tag : Int){
//        if tag == 1{
//            tvSeasons = tvSeasonsRecent
//        }else if tag == 2 {
//            tvSeasons = tvSeasonsOnAir
//        }else if tag == 3 {
//            tvSeasons = tvSeasonsPopular
//        }else{
//            tvSeasons = tvSeasonsTopRated
//        }
        self.collectionView.reloadData()
    }
    
    func callTVSeasonsAPis(tag : Int, isCallAPi : Bool = true, isUserInteraction : Bool = true){
       isApiLoading[selectedTag] = true
//        if tag == 1{
////            tvSeasons = tvSeasonsRecent
//            urlStr = Constants.recentUrl
//        }else if tag == 2 {
////            tvSeasons = tvSeasonsOnAir
//            urlStr = Constants.onAirUrl
//        }else if tag == 3 {
////            tvSeasons = tvSeasonsPopular
//            urlStr = Constants.popularUrl
//        }else{
//            tvSeasons = tvSeasonsTopRated
//            urlStr = Constants.topRatedUrl
//        }
//        if (tvSeasons[selectedTag].count == 0) && isCallAPi {
        self.view.isUserInteractionEnabled = isUserInteraction
//        if isUserInteraction{
//            indicator.startAnimating()
//        }else{
            isShowFoooter = true
//        }
        
        
            var url = urlArr[selectedTag]
            let currentPage = currentTotalPages[selectedTag].key + 1
//             pages[selectedTag] += 1
            currentTotalPages[selectedTag].key = currentPage
        
        if currentPage != 0{
            url += "&page=\(currentPage)"

        }
        print("url : \(url)")
            ApiManager.shared.getTvShowsList(urlStr: url, tag: selectedTag) { (rc, tag, err) in
                
                self.isApiLoading[self.selectedTag] = false
                self.isShowFoooter = self.isApiLoading[self.selectedTag]
                
                if let result = rc{
                    self.currentTotalPages[self.selectedTag].key = rc?.page ?? 0
                    self.currentTotalPages[self.selectedTag].value = rc?.totalPages ?? 0
                    self.tvSeasons[tag].append(contentsOf:  rc?.results ?? [])
                }else if let error = err{
                    self.okAlert(title : "Error", message : error)
                }
                
               
                DispatchQueue.main.async {
                    self.view.isUserInteractionEnabled = true

//                    self.indicator.stopAnimating()

                    self.collectionView.reloadData()
                }
            }
//        }else{
//            self.collectionView.reloadData()
//            print("Data already hai")
//        }
        
    }
}


extension HomeVC : UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout{
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
//        if tvSeasons[selectedTag].count > 2 {
//            return 2 + 1
//        }else{
//            return tvSeasons[selectedTag].count + 1
//        }
        
        return tvSeasons[selectedTag].count + 1

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
            let item = tvSeasons[selectedTag][indexPath.row-1]
            cell.configureDate(tv: item)
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
        if indexPath.row > 0 && tvSeasons[selectedTag].count > 0 && indexPath.row <= tvSeasons[selectedTag].count {
            
            let item = tvSeasons[selectedTag][indexPath.row-1]
            let vc = AnimeDetailTVC()
            vc.animeID = item.id
            self.navigationController?.pushViewController(vc, animated: true)
            
        }
    }
    
    func collectionView(_ collectionView: UICollectionView, willDisplay cell: UICollectionViewCell, forItemAt indexPath: IndexPath) {
        print("indexPath:\(indexPath)")
        
        if indexPath.row == tvSeasons[selectedTag].count && currentTotalPages[selectedTag].key < currentTotalPages[selectedTag].value {//&& tvSeasons[selectedTag].count > 0{  //numberofitem count
            self.callTVSeasonsAPis(tag: selectedTag,isUserInteraction: false)
            
            print("ktni dafa chalega")
        }else{
            print("kuch nhi")
        }
//        if indexPath.row > 0 && tvSeasons[selectedTag].count > 0 && indexPath.row <= tvSeasons[selectedTag].count {
//            if let urlStr = tvSeasons[selectedTag][indexPath.row - 1].posterPath{
//                let url = URL(string: Constants.baseImgUrl + Constants.width200Img  + urlStr)!
//                ImageDownloadManager.shared.downloadImage(url : url, indexPath: indexPath, selectedTag: selectedTag) { (image, url, indexPath,selectedtag, error) in
//                    if let indexPathNew = indexPath {
//                        if self.selectedTag == selectedtag{
//                            DispatchQueue.main.async {
//                                if let getCell = collectionView.cellForItem(at: indexPathNew) {
//                                    (getCell as? AnimeCell)!.animeImg.image = image
//                                }
//                            }
//                        }
//                    }
//                }
//            }
//
//        }
    }
    
//    func collectionView(_ collectionView: UICollectionView, didEndDisplaying cell: UICollectionViewCell, forItemAt indexPath: IndexPath) {
//
//    }
        func collectionView(_ collectionView: UICollectionView, didEndDisplaying cell: UICollectionViewCell, forItemAt indexPath: IndexPath) {
            /* Reduce the priority of the network operation in case the user scrolls and an image is no longer visible. */
            if isApiLoading[selectedTag] {return}
//            if indexPath.row > 0 && tvSeasons[selectedTag].count > 0 && indexPath.row <= tvSeasons[selectedTag].count {
//                
//                if let urlStr = tvSeasons[selectedTag][indexPath.row - 1].posterPath{
//                    let url = URL(string: Constants.baseImgUrl + Constants.width200Img + urlStr)!
//                    ImageDownloadManager.shared.slowDownImageDownloadTaskfor(url: url)
//                }
//                
//            }
        }
    
    func collectionView(_ collectionView: UICollectionView, viewForSupplementaryElementOfKind kind: String, at indexPath: IndexPath) -> UICollectionReusableView {
        switch kind {
                case UICollectionView.elementKindSectionFooter:
            let footer = collectionView.dequeueReusableSupplementaryView(ofKind: kind, withReuseIdentifier: "LoadingView", for: indexPath) as! LoadingView
            
            //                footer = SomeView
            footer.indicator.startAnimating()
            return footer
            
        default:
            print("anything")
            return UICollectionReusableView()
        }
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, referenceSizeForFooterInSection section: Int) -> CGSize {
        if isApiLoading[selectedTag] {
            return CGSize(width: collectionView.frame.width, height: 50)
        }else{
            return CGSize(width: collectionView.frame.width, height: 0)
        }
    }
    
}

//extension HomeVC : UICollectionViewDataSourcePrefetching{
//    func collectionView(_ collectionView: UICollectionView, prefetchItemsAt indexPaths: [IndexPath]) {
//        for indexPath in indexPaths{
//            let tv = tvSeasons[selectedTag][indexPath.row-1]
//            guard let cell = self.collectionView.cellForItem(at: indexPath) as? AnimeCell else {return}
//
//
//            guard let poster = tv.posterPath else {return}
//            let urlStr = Constants.baseImgUrl + Constants.width200Img  + poster
//
//            let url = URL(string: urlStr)
//            let processor = DownsamplingImageProcessor(size: cell.animeImg.bounds.size)
//                |> RoundCornerImageProcessor(cornerRadius: 20)
//            cell.animeImg.kf.indicatorType = .activity
//            cell.animeImg.kf.setImage(
//                with: url,
//                placeholder: UIImage(named: "placeholderImage"),
//                options: [
//                    .processor(processor),
//                    .scaleFactor(UIScreen.main.scale),
//                    .transition(.fade(1)),
//                    .cacheOriginalImage
//                ])
//            {
//                result in
//                switch result {
//                case .success(let value):
//                    print("Task done for: \(value.source.url?.absoluteString ?? "")")
//                case .failure(let error):
//                    print("Job failed: \(error.localizedDescription)")
//                }
//            }
//
//        }
//
//    }
//
//    func collectionView(_ collectionView: UICollectionView, cancelPrefetchingForItemsAt indexPaths: [IndexPath]) {
//        for indexPath in indexPaths{
//            let cell = collectionView.cellForItem(at: indexPath) as? AnimeCell
//            cell?.animeImg.kf.cancelDownloadTask()
//        }
//    }
//
//
//
//
//}

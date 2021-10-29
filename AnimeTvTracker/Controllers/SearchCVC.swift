//
//  SearchCVC.swift
//  AnimeTvTracker
//
//  Created by Danyal on 27/07/2021.
//

import UIKit
import GoogleMobileAds


class SearchCVC: UICollectionViewController, UISearchResultsUpdating, UISearchControllerDelegate, UISearchBarDelegate {
    func updateSearchResults(for searchController: UISearchController) {
        
    }
    
    private lazy var searchController: UISearchController = {
        let searchController = UISearchController(searchResultsController: nil)
        searchController.searchResultsUpdater = self
        searchController.searchBar.autocapitalizationType = .words
        searchController.searchBar.delegate = self
        searchController.obscuresBackgroundDuringPresentation = false
        
        return searchController
    }()
    
    

    private var searchingKeywords = ""
    var tvSeasons : [TvMainResult] = []
    var currentTotalPages = (key:0,value:0)
    var url : String? = nil
    var isShowFoooter : Bool = false {
        didSet{
            if self.collectionView.visibleCells.count > 0 {
                
                
                if !isShowFoooter{
                    collectionView.layoutAttributesForSupplementaryElement(ofKind: UICollectionView.elementKindSectionFooter , at: [0,0])?.size = .zero
                    
                }else{
                    collectionView.layoutAttributesForSupplementaryElement(ofKind: UICollectionView.elementKindSectionFooter , at: [0,0])?.size = CGSize(width: collectionView.frame.width, height: 50)
                }
            }
        }
    }

    @IBOutlet private weak var selectSiteBarButton: UIBarButtonItem!
    
    
    //MARK: Google Ad Variable
//    var interstitial: GADInterstitialAd!
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)

    }
    
    override func viewDidAppear(_ animated: Bool) {
        AdsManager.shared.presentAd(vc: self)
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Make sure we get the navigation bar when clicked on search result
        
        collectionView.layer.maskedCorners = [.layerMinXMinYCorner,.layerMaxXMinYCorner]
        collectionView.layer.cornerRadius = 18
        collectionView.collectionViewLayout.invalidateLayout()

//        collectionView.collectionViewLayout.estimatedItemSize = .zero
//        layout.sectionInsetReference = .fromLayoutMargins
//        collectionView.contentInsetAdjustmentBehavior = .always
        
        if let layout = collectionView.collectionViewLayout as? UICollectionViewFlowLayout {
            layout.estimatedItemSize = .zero
            layout.sectionInsetReference = .fromLayoutMargins
            collectionView.contentInsetAdjustmentBehavior = .always
        }
        
//        collectionView.
        
        
        
        definesPresentationContext = true
        
        // For iOS 11 and later, place the search bar in the navigation bar.
        navigationItem.searchController = searchController
        
        // Make the search bar always visible.
        navigationItem.hidesSearchBarWhenScrolling = false
        
        // Hide table cell separators at empty state
        //tableView.tableFooterView = UIView()
        
        // Themes
//        tableView.makeThemable()
//        searchController.searchBar.makeThemable()
//
//        let bannerView = GADBannerView(adSize: kGADAdSizeSmartBannerPortrait)
//        bannerView.adUnitID = AdBannerIdTest
//          bannerView.rootViewController = self
//        addBannerViewToView(bannerView)
//        bannerView.load(GADRequest())
        
        
        self.navigationItem.title = "Search"
        
        collectionView.register(UINib(nibName: "AnimeCell", bundle: nil), forCellWithReuseIdentifier: "AnimeCell")
        collectionView.register(UINib(nibName: "BannerAddCellCV", bundle: nil), forCellWithReuseIdentifier: "BannerAddCellCV")
        collectionView.register(UINib(nibName: "LoadingView", bundle: nil), forSupplementaryViewOfKind: UICollectionView.elementKindSectionFooter, withReuseIdentifier: "LoadingView")

        
        

    }
    
  

    
    func searchBarSearchButtonClicked(_ searchBar: UISearchBar) {
        guard let searchKeywords = searchBar.text else { return }
        
        searchController.dismiss(animated: true) { [weak self] in
            guard let self = self else { return }
            self.performSearch(keywords: searchKeywords)
        }
    }
    
    /// Perform the search with keywords
    func performSearch(keywords: String) {
        searchingKeywords = keywords.trimmingCharacters(in: .whitespacesAndNewlines)
        
        guard !searchingKeywords.isEmpty else {
            return
        }
        
        let urlStr = Constants.searchUrl + Constants.query + searchingKeywords
        url = urlStr
        if var url = url{
            self.callTVSeasonsAPis(url : &url,isUserInteraction: false)
        }

    }
    
    func callTVSeasonsAPis( url : inout String, isUserInteraction : Bool = true){

//        if (tvSeasons[selectedTag].count == 0) && isCallAPi {
        self.view.isUserInteractionEnabled = isUserInteraction
//        if isUserInteraction{
//            indicator.startAnimating()
//        }else{
            isShowFoooter = true
//        }
        
        
            let currentPage = currentTotalPages.key + 1
//             pages[selectedTag] += 1
            currentTotalPages.key = currentPage
        
        if currentPage != 0{
            url += "&page=\(currentPage)"

        }
        print("url : \(url)")
            ApiManager.shared.getTvShowsList(urlStr: url, tag: 1) { (rc, tag, err) in
                
                self.isShowFoooter = false
                
                if let result = rc{
                    self.currentTotalPages.key = rc?.page ?? 0
                    self.currentTotalPages.value = rc?.totalPages ?? 0
                    self.tvSeasons.append(contentsOf:  rc?.results ?? [])
                }else if let error = err{
                    self.okAlert2(title : "Error", message : error)
                }
                
               
                DispatchQueue.main.async {
                    self.view.isUserInteractionEnabled = true
                    self.collectionView.reloadData()
                }
            }
//        }else{
//            self.collectionView.reloadData()
//            print("Data already hai")
//        }
        
    }
    
}

extension SearchCVC : UICollectionViewDelegateFlowLayout{
    override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        /*
         if tvSeasons.count > 2 {
                    return 2 + 1
                }else{
                    return tvSeasons.count + 1
                }
        */
                
            return tvSeasons.count + 1
    }
    
    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        print("indexPath first time mai:\(indexPath)")

        if indexPath.row == 0 {
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "BannerAddCellCV", for: indexPath) as! BannerAddCellCV
            cell.parentVC = self
            cell.loadAd()
            return cell

        }else{
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "AnimeCell", for: indexPath) as! AnimeCell
            let item = tvSeasons[indexPath.row-1]
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
    
    override func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        let item = tvSeasons[indexPath.row-1]
        let vc = AnimeDetailTVC()
        vc.animeID = item.id
        self.navigationController?.pushViewController(vc, animated: true)
    }
    
    override func collectionView(_ collectionView: UICollectionView, willDisplay cell: UICollectionViewCell, forItemAt indexPath: IndexPath) {
        print("indexPath:\(indexPath)")
        
        if indexPath.row == tvSeasons.count && currentTotalPages.key < currentTotalPages.value {//&& tvSeasons[selectedTag].count > 0{  //numberofitem count
            if var url = url{
                self.callTVSeasonsAPis(url : &url,isUserInteraction: false)
            }
 
            print("ktni dafa chalega")
        }else{
            print("kuch nhi")
        }
    }
    
    override func collectionView(_ collectionView: UICollectionView, viewForSupplementaryElementOfKind kind: String, at indexPath: IndexPath) -> UICollectionReusableView {
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
        if isShowFoooter {
            return CGSize(width: collectionView.frame.width, height: 50)
        }else{
            return .zero//CGSize(width: collectionView.frame.width, height: 50)
        }
    }
    
}


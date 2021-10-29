//
//  SearchTVC.swift
//  AnimeTvTracker
//
//  Created by Danyal on 27/07/2021.
//

import UIKit

class SearchTVC: UICollectionViewController, UISearchResultsUpdating, UISearchControllerDelegate, UISearchBarDelegate {
    private lazy var searchController: UISearchController = {
        let searchController = UISearchController(searchResultsController: nil)
        searchController.searchResultsUpdater = self
        searchController.searchBar.autocapitalizationType = .words
        searchController.searchBar.delegate = self
        searchController.obscuresBackgroundDuringPresentation = false
        
        return searchController
    }()
    
    

    private var searchingKeywords = ""

    @IBOutlet private weak var selectSiteBarButton: UIBarButtonItem!
    
    
    //MARK: Google Ad Variable
//    var interstitial: GADInterstitialAd!
    var isFromAd = false
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        updateSearchPool()
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        updateSearchResults()
        self.navigationController?.normalNavBar()
        
//        if !isFromAd
//        {
//          createAndLoadInterstitial()
//
//        }
//        else
//        {
//            isFromAd = false
//        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Make sure we get the navigation bar when clicked on search result
        
        collectionView.layer.maskedCorners = [.layerMinXMinYCorner,.layerMaxXMinYCorner]
        collectionView.layer.cornerRadius = 18
        
        //tableView.layer.maskedCorners = [.layerMinXMinYCorner,.layerMaxXMinYCorner]
        //tableView.layer.cornerRadius = 18
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
    }
    
    @IBAction func backPressed(_ sender: Any) {
        self.dismiss(animated: true, completion: nil)
    }
    private func updateSearchPool() {
        // Search history
        
        
        // Links from recents
        
    
        
        
        // Concatenate results to form the items pool
    }
    
//    private func removeItemFromPool(_ item: Item) {
//        quickSearchPool.removeAll { $0 == item }
//
//        if let visibleItemIndex = self.indexPath(forVisibleItem: item) {
//            self.filteredItems.removeAll { $0 == item }
//            self.tableView.deleteRows(at: [ visibleItemIndex ], with: .top)
//        }
//    }
    
    
//    func createAndLoadInterstitial() {
//       /* let interstitial = GADInterstitialAd()//GADInterstitialAd(adUnitID: AdInterstitialIdTest)
//
//      interstitial.delegate = self
//      interstitial.load(GADRequest())
//      return interstitial*/
//
//
//        let request = GADRequest()
//            GADInterstitialAd.load(withAdUnitID:AdInterstitialIdTest,
//                                        request: request,
//                              completionHandler: { [self] ad, error in
//                                if let error = error {
//                                  print("Failed to load interstitial ad with error: \(error.localizedDescription)")
//                                  return
//                                }
//                                interstitial = ad
//                                interstitial?.fullScreenContentDelegate = self
//
//                                if interstitial != nil {
//                                   interstitial.present(fromRootViewController: self)
//                                 } else {
//                                   print("Ad wasn't ready")
//                                 }
//                              }
//            )
//
//    }
    
    
    
//    func addBannerViewToView(_ bannerView: GADBannerView) {
//      bannerView.translatesAutoresizingMaskIntoConstraints = false
//      view.addSubview(bannerView)
//      if #available(iOS 11.0, *) {
//        // In iOS 11, we need to constrain the view to the safe area.
//        positionBannerViewFullWidthAtBottomOfSafeArea(bannerView)
//      }
//      else {
//        // In lower iOS versions, safe area is not available so we use
//        // bottom layout guide and view edges.
//        positionBannerViewFullWidthAtBottomOfView(bannerView)
//      }
//    }

    // MARK: - view positioning
//    @available (iOS 11, *)
//    func positionBannerViewFullWidthAtBottomOfSafeArea(_ bannerView: UIView) {
//      // Position the banner. Stick it to the bottom of the Safe Area.
//      // Make it constrained to the edges of the safe area.
//      let guide = view.safeAreaLayoutGuide
//      NSLayoutConstraint.activate([
//        guide.leftAnchor.constraint(equalTo: bannerView.leftAnchor),
//        guide.rightAnchor.constraint(equalTo: bannerView.rightAnchor),
//        guide.bottomAnchor.constraint(equalTo: bannerView.bottomAnchor)
//      ])
//    }

//    func positionBannerViewFullWidthAtBottomOfView(_ bannerView: UIView) {
//      view.addConstraint(NSLayoutConstraint(item: bannerView,
//                                            attribute: .leading,
//                                            relatedBy: .equal,
//                                            toItem: view,
//                                            attribute: .leading,
//                                            multiplier: 1,
//                                            constant: 0))
//      view.addConstraint(NSLayoutConstraint(item: bannerView,
//                                            attribute: .trailing,
//                                            relatedBy: .equal,
//                                            toItem: view,
//                                            attribute: .trailing,
//                                            multiplier: 1,
//                                            constant: 0))
//      view.addConstraint(NSLayoutConstraint(item: bannerView,
//                                            attribute: .bottom,
//                                            relatedBy: .equal,
//                                            toItem: bottomLayoutGuide,
//                                            attribute: .top,
//                                            multiplier: 1,
//                                            constant: 0))
//    }
}

// MARK: Prepare for segues
extension SearchTVC {
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        super.prepare(for: segue, sender: sender)
        
        // If the segue is pointing towards search results container, show that
//        if let resultsViewController = segue.destination as? ContentListViewController,
//            !searchingKeywords.isEmpty {
//            let contentProvider = NineAnimator.default.user.source.search(keyword: searchingKeywords)
//            resultsViewController.setPresenting(contentProvider: contentProvider)
//        }
    }
}

// MARK: - Search events handler
extension SearchTVC {
    func updateSearchResults() {
        updateSearchResults(for: searchController)
    }
    
    func updateSearchResults(for searchController: UISearchController) {
//        DispatchQueue.main.async {
//            let pool = self.quickSearchPool
//
//            if let text = self.searchController.searchBar.text, !text.isEmpty {
//                self.filteredItems = pool.filter {
//                    item in
//                    // General matching for all: compare name and type
//                    var result = item.link?.name
//                        .localizedCaseInsensitiveContains(text) == true
//                    result = result || item.keywords
//                        .localizedCaseInsensitiveContains(text)
//                    result = result || item.type.rawValue
//                        .localizedCaseInsensitiveContains(text)
//
//                    // Specialized matchings for each type of links
//                    switch item.link {
//                    case let .anime(animeLink):
//                        result = result || animeLink.link.absoluteString
//                            .localizedCaseInsensitiveContains(text)
//                        result = result || animeLink.source.name
//                            .localizedCaseInsensitiveContains(text)
//                    case .episode:
//                        break // Not doing anything about EpisodeLink rn
//                    case let .listingReference(reference):
//                        result = result || reference.parentService.name
//                            .localizedCaseInsensitiveContains(text)
//                    case .none: break
//                    }
//
//                    return result
//                }
//            } else { self.filteredItems = Array(pool) }
//
//            self.tableView.reloadSections([0], with: .fade)
//        }
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
        
        
       
    }
    

    
//    func searchViewItemCell(_ cell: SimpleAnimeTableViewCell, deleteItem item: Item) {
//        switch item.type
//    }
}

// MARK: - Table view data source
//extension SearchTVC {
//    override func numberOfSections(in tableView: UITableView) -> Int {
//        1
//    }
//    
//    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
//        0//filteredItems.count
//    }
//    
//    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
////        let cell = tableView.dequeueReusableCell(
////            withIdentifier: "anime.container.simple",
////            for: indexPath
////        ) as! SimpleAnimeTableViewCell
////        cell.setPresenting(filteredItems[indexPath.item], delegate: self)
////        cell.makeThemable()
//        return UITableViewCell()
//    }
//    
//    //    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
//    //        // Deselect rows
//    ////        tableView.deselectSelectbedRows(animated: true)
//    //
//    //
//    //    }
//    
//
//}









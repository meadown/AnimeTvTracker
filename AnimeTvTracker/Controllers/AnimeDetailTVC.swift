//
//  AnimeDetailTVC.swift
//  AnimeTvTracker
//
//  Created by Danyal on 18/07/2021.
//

import UIKit
import GoogleMobileAds
import AVKit



enum CellType{
    case Summary
    case InformationHeader
    case InformationRows
    case Ads
    case Characters
    case Seasons
}
class AnimeDetailTVC: UITableViewController {
    
    
    @IBOutlet weak var headingView: HeaderView!
    
    private lazy var needsLayoutHandler: (() -> Void) = {
        [weak self] in
        self?.tableView.performBatchUpdates({
            self?.tableView.setNeedsLayout()
        }, completion: nil)
    }
    
//    var infoArr = ["First Air Date","Last Air Date", "Next Air Date", "Episode Duration","Airing Status" ,"Total Episodes","Popularity", "Rating"]
    
    var animeID : Int!
    var tvDetails : TVDetails!
    
    var topPadding : CGFloat!
    var navHeight : CGFloat!
    var headerHeight : CGFloat!
    var tabBarHeight : CGFloat!
    
//    var cells : [CellType] = [.Summary,.InformationHeader,.InformationRows,.Ads,]
    
    override func viewDidLoad() {
        super.viewDidLoad()
//        self.view.layer.maskedCorners = [.layerMinXMinYCorner,.layerMaxXMinYCorner]
//        self.view.layer.cornerRadius = 18

        // Uncomment the following line to preserve selection between presentations
        // self.clearsSelectionOnViewWillAppear = false

        // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
        // self.navigationItem.rightBarButtonItem = self.editButtonItem
        

        
        headingView.indicator.startAnimating()
        headingView.parentVC = self
       
        ApiManager.shared.getTvDetails(id: animeID) { (details, err) in
            
            DispatchQueue.main.async {
                
                self.headingView.indicator.stopAnimating()
                
                if let error = err{
                    self.headingView.lblTitle.text = error
                    
                }else{
                    self.tvDetails = details
                    self.headingView.videos = self.tvDetails.videos.results
                    self.headingView.lblTitle.text = details!.name
                    self.headingView.lblSubTitle.text = details?.originalName
                    if let imgPath = self.tvDetails.backdropPath{
                        self.headingView.imgUrlStr = imgPath
                    }
                    
                    
                    
                    self.tableView.reloadData()
                    
                }
            }
        }
        
        tableView.register(UINib(nibName: "TvSummaryTCell", bundle: nil), forCellReuseIdentifier: "TvSummaryTCell")
        tableView.register(UINib(nibName: "CastTCell", bundle: nil), forCellReuseIdentifier: "CastTCell")
        tableView.register(UINib(nibName: "InfoTCell", bundle: nil), forCellReuseIdentifier: "InfoTCell")
        tableView.register(UINib(nibName: "HeadingTCell", bundle: nil), forCellReuseIdentifier: "HeadingTCell")
        tableView.register(UINib(nibName: "SeasonsTCell", bundle: nil), forCellReuseIdentifier: "SeasonsTCell")
        tableView.register(UINib(nibName: "BannerAddTCell", bundle: nil), forCellReuseIdentifier: "BannerAddTCell")

    }
    
    override func viewDidDisappear(_ animated: Bool) {
//        self.navigationController?.navigationBar.isHidden = false
//        self.navigationController?.navigationBar.isTranslucent = false
        
        self.navigationController?.setNavigationBarHidden(false, animated: true)
    }
    
    override func viewWillAppear(_ animated: Bool) {

        tableView.tableFooterView = UIView()
        headingView.onNeededLayout = needsLayoutHandler
        self.navigationItem.title = "Anime Name"
        self.navigationController?.transparentNavBar()

    }
    
    override func viewWillDisappear(_ animated: Bool) {
//        self.navigationController?.normalNavBar()
    }
    
    
    func initialize(){
        let window = UIApplication.shared.keyWindow
        topPadding = window?.safeAreaInsets.top  ?? 0.0//55
        navHeight = self.navigationController?.navigationBar.frame.height ?? 0.0 //44
        headerHeight  = tableView.tableHeaderView?.frame.height ?? 0.0 //222
        tabBarHeight = self.tabBarController?.tabBar.frame.height ?? 0.0
        tableView.contentInset = UIEdgeInsets(top: 0, left: 0, bottom: tabBarHeight + 10, right: 0)
    }
    
    
    override func viewDidAppear(_ animated: Bool) {
        AdsManager.shared.presentAd(vc: self)

        initialize()
//        UIView.animate(withDuration: 0.3) {
//            self.tableView.performBatchUpdates({
//                self.headingView.sizeToFit()
//                self.tableView.setNeedsLayout()
//            }, completion: nil)
//        }
    }
    
    override func scrollViewDidScroll(_ scrollView: UIScrollView) {
//        adjustNavigationBarStyle()
        
        // If the content offset is smaller than 0, tell the heading view
        // to expand the top image
//        print(scrollView.contentOffset.y)

        
        if scrollView.contentOffset.y < 0 {
            headingView.headingScrollExpansion = scrollView.contentOffset.y
        } else {
            headingView.headingScrollExpansion = 0
        }
        
      
        let heightDiff = headerHeight - topPadding - navHeight
        
        UIView.animate(withDuration: 0.3) {
            if scrollView.contentOffset.y >= heightDiff{
//                self.navigationController?.normalNavBar()
                self.view.layer.maskedCorners = [.layerMinXMinYCorner,.layerMaxXMinYCorner]
                self.view.layer.cornerRadius = 18
            }else{
//                self.navigationController?.transparentNavBar()
    //            self.view.layer.maskedCorners = [.layerMinXMinYCorner,.layerMaxXMinYCorner]
                self.view.layer.cornerRadius = 0
            }
            self.view.layoutIfNeeded()
        }
       
    }

    // MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        
        if tvDetails == nil{
            return 0
        }else{
            //Summary //Heading //Introduction //Native Ad //Cast //Seasons
            return 1 + 1 + 1 + 1 + 1 + 1
        }
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
//        return 1 + 1 + tvDetails.informationArr.count + 1
        if section == 2{
            return tvDetails.informationArr.count
        }else{
            return 1
        }
    }

  
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if indexPath.section == 0 {
            let cell = tableView.dequeueReusableCell(withIdentifier: "TvSummaryTCell", for: indexPath) as! TvSummaryTCell
            cell.configureData(summary: tvDetails.overview)
            cell.onLayoutChange = needsLayoutHandler
            cell.tvHeightChanged = {[unowned self] height in
                self.tableView.reloadSections([0], with: .fade)
            }
            return cell
            

        }else if indexPath.section == 1{
            let cell = tableView.dequeueReusableCell(withIdentifier: "HeadingTCell", for: indexPath) as! HeadingTCell
            cell.lblHeading.text = "Information"
            return cell

        }
        else if indexPath.section == 2{//tvDetails.informationArr.count+2{
            let cell = tableView.dequeueReusableCell(withIdentifier: "InfoTCell", for: indexPath) as! InfoTCell
            //            var item = Array(tvDetails.informationArr)
            //            item.sort(by: {$0.key < $1.key})
             let item = tvDetails.informationArr//{
                cell.configureData(heading: item[indexPath.row].key, name: item[indexPath.row].value)

//            }
            
            return cell
            
        }
        else if indexPath.section == 3{//if indexPath.row > tvDetails.informationArr.count{
            let cell = tableView.dequeueReusableCell(withIdentifier: "BannerAddTCell", for: indexPath) as! BannerAddTCell
            cell.parentVC = self
            cell.loadAd()
            return cell

        }else if indexPath.section == 4{
            print("index path cast :\(indexPath.section)")
            let cell = tableView.dequeueReusableCell(withIdentifier: "CastTCell", for: indexPath) as! CastTCell
            cell.configuredata(cast: tvDetails.credits.cast)
            return cell

        }else if indexPath.section == 5{
            print("index path cast :\(indexPath.section)")
            let cell = tableView.dequeueReusableCell(withIdentifier: "SeasonsTCell", for: indexPath) as! SeasonsTCell
            cell.seasons = tvDetails.seasons
            return cell
        }
        

        
        

        // Configure the cell...

        return UITableViewCell()
    }
    
    override func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        if indexPath.section == 2{
            return 44
        }else if indexPath.row == 3 {
            return kGADAdSizeBanner.size.height+30
        }else{
            return UITableView.automaticDimension
        }

    }


    /*
    // Override to support conditional editing of the table view.
    override func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the specified item to be editable.
        return true
    }
    */

    /*
    // Override to support editing the table view.
    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            // Delete the row from the data source
            tableView.deleteRows(at: [indexPath], with: .fade)
        } else if editingStyle == .insert {
            // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
        }
    }
    */

    /*
    // Override to support rearranging the table view.
    override func tableView(_ tableView: UITableView, moveRowAt fromIndexPath: IndexPath, to: IndexPath) {

    }
    */

    /*
    // Override to support conditional rearranging of the table view.
    override func tableView(_ tableView: UITableView, canMoveRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the item to be re-orderable.
        return true
    }
    */

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}

extension AnimeDetailTVC : AVPlayerViewControllerDelegate{
    
}


//
//  SearchVC.swift
//  AnimeTvTracker
//
//  Created by Danyal on 13/07/2021.
//

import UIKit

@available(iOS 14.0, *)
class SearchVC: BaseVC {

    let searchBtn = UIBarButtonItem(systemItem: .search)
    override func viewDidLoad() {
        super.viewDidLoad()

        self.navigationItem.title = "Search"
        
        if #available(iOS 13.0, *) {
            searchBtn.image = UIImage(systemName: "magnifyingglass")
        } else {
            // Fallback on earlier versions
        }
//        searchBtn.action()
        self.navigationController?.navigationItem.rightBarButtonItem = searchBtn
        
        let searchBar = UISearchBar()
        searchBar.sizeToFit()
        searchBar.placeholder = ""
        self.navigationController?.navigationBar.topItem?.titleView = searchBar
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}

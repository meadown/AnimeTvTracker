//
//  TabBarVC.swift
//  AnimeTvTracker
//
//  Created by Danyal on 12/07/2021.
//

import UIKit

class TabBarVC: UITabBarController {

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
       
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */
    override func tabBar(_ tabBar: UITabBar, didSelect item: UITabBarItem) {
        let tab = tabBar as? CustomTabBar
        tab?.controllers = self.viewControllers?.count ?? 0
        tab?.addShape()
    }

}

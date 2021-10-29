//
//  NavigationVC.swift
//  AnimeTvTracker
//
//  Created by Danyal on 12/07/2021.
//

import UIKit

class NavigationVC: UINavigationController {

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
//        self.navigationBar.layer.maskedCorners = [.layerMinXMaxYCorner,.layerMaxXMaxYCorner]
//        self.navigationBar.layer.cornerRadius = 18
        
        self.navigationController?.navigationBar.setBackgroundImage(UIImage(), for: .default) //UIImage.init(named: "transparent.png")
        self.navigationController?.navigationBar.shadowImage = UIImage()
        
        let clr = UIColor(named: "Primary")!
        self.navigationBar.isTranslucent = false
        self.view.backgroundColor = clr
        self.navigationBar.tintColor = .white

        self.navigationBar.barTintColor = clr
        self.navigationBar.titleTextAttributes = [NSAttributedString.Key.foregroundColor: UIColor.white]
//        self.navigationBar.clipsToBounds = true
//        self.navigationBar.tintColor = .blue
//        self.navigationBar.barTintColor = .gray
       
//        self.navigationBar.layer.masksToBounds = false
//        self.view.backgroundColor = UIColor(named: "Primary")

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

extension UINavigationController{
    func transparentNavBar(){
        self.navigationBar.setBackgroundImage(UIImage(), for: .default) //UIImage.init(named: "transparent.png")
        self.navigationBar.shadowImage = UIImage()
        self.navigationBar.isTranslucent = true
        self.view.backgroundColor = .clear
//        self.navigationItem.title = ""
        
        self.navigationBar.titleTextAttributes = [NSAttributedString.Key.foregroundColor: UIColor.clear]

    }
    
    func normalNavBar(){
        let clr = UIColor(named: "Primary")!
        self.view.backgroundColor = clr
        self.navigationBar.isTranslucent = false
        self.navigationBar.titleTextAttributes = [NSAttributedString.Key.foregroundColor: UIColor.white]
    }
}

//func transparentNavBar(){
//    self.navigationController?.navigationBar.setBackgroundImage(UIImage(), for: .default) //UIImage.init(named: "transparent.png")
//    self.navigationController?.navigationBar.shadowImage = UIImage()
//    self.navigationController?.navigationBar.isTranslucent = true
//    self.navigationController?.view.backgroundColor = .clear
//}

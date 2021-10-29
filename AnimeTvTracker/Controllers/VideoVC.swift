//
//  VideoVC.swift
//  AnimeTvTracker
//
//  Created by Danyal Naveed on 27/07/2021.
//

import UIKit
import WebKit

class VideoVC: UIViewController {

    @IBOutlet weak var collectionView: UICollectionView!
    @IBOutlet weak var webView: WKWebView!
    @IBOutlet weak var btnDismiss: UIButton!
    
    var video : [VideoResult] = []
    var tempVideos: [VideoResult] = []
    var urlStr : String = ""//{
//        didSet{
//            if urlStr != ""{
//                webView.load(NSURLRequest(url: NSURL(string: urlStr)! as URL) as URLRequest)
//            }
//        }
//    }
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        webView.load(NSURLRequest(url: NSURL(string: urlStr)! as URL) as URLRequest)
//        collectionView.register(UINib(nibName: "SeasonCCell", bundle: nil), forCellWithReuseIdentifier: "SeasonCCell")
//        
//        collectionView.delegate = self
//        collectionView.dataSource = self

        

    }


    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */
    @IBAction func btnDismissPressed(_ sender: Any) {
        self.dismiss(animated: true, completion: nil)
    }
    
}


//extension VideoVC : UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewLayout{
//    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
//        return tempVideos.count
//    }
//
//    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
//        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "SeasonCCell", for: indexPath) as! SeasonCCell
//        cell.vide
//    }
//
//
//}

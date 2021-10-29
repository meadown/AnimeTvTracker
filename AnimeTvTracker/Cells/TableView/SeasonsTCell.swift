//
//  SeasonsTCell.swift
//  AnimeTvTracker
//
//  Created by Danyal on 26/07/2021.
//

import UIKit

class SeasonsTCell: UITableViewCell {

    @IBOutlet weak var collectionView: UICollectionView!
    @IBOutlet weak var lblSeasonCount: UILabel!
    @IBOutlet weak var lblSeason: UILabel!
    
    var seasons : [Season] = []{
        didSet{
//            collectionView.delegate = self
//            collectionView.dataSource = self
            if seasons.count > 0 {
                collectionView.isHidden = false
                lblSeason.isHidden = true
                collectionView.reloadData()
            }else{
                collectionView.isHidden = true
                lblSeason.isHidden = false
            }
            
            lblSeasonCount.text = "\(seasons.count)"
        }
    }
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        collectionView.delegate = self
        collectionView.dataSource = self
        collectionView.register(UINib(nibName: "SeasonCCell", bundle: nil), forCellWithReuseIdentifier: "SeasonCCell")
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}

extension SeasonsTCell : UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout{
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return seasons.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "SeasonCCell", for: indexPath) as! SeasonCCell
        cell.configureData(season : seasons[indexPath.row])
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: 130, height: 220
        )
    }
    
}

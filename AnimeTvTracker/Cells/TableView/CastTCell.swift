//
//  CastTCell.swift
//  AnimeTvTracker
//
//  Created by Danyal Naveed on 26/07/2021.
//

import UIKit

class CastTCell: UITableViewCell {

    @IBOutlet weak var collectionView: UICollectionView!
    
    @IBOutlet weak var lblCharacter: UILabel!
    var castArr : [Cast] = []
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        
        collectionView.delegate = self
        collectionView.dataSource = self
        collectionView.register(UINib(nibName: "PersonCCell", bundle: nil), forCellWithReuseIdentifier: "PersonCCell")
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    func configuredata(cast : [Cast]){
        if cast.count > 0 {
            self.castArr = cast
            self.collectionView.reloadData()
            self.collectionView.isHidden = false
            self.lblCharacter.isHidden = true
        }else{
            self.collectionView.isHidden = true
            self.lblCharacter.isHidden = false
        }
        
    }
    
}

extension CastTCell : UICollectionViewDelegate, UICollectionViewDataSource{
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return castArr.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "PersonCCell", for: indexPath) as! PersonCCell
        let cast = castArr[indexPath.row]
        cell.configureData(cast: cast)
        return cell
    }
    
    
    
    
}

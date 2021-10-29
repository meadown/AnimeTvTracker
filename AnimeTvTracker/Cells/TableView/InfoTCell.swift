//
//  InfoTCell.swift
//  AnimeTvTracker
//
//  Created by Danyal on 26/07/2021.
//

import UIKit

class InfoTCell: UITableViewCell {
    
    @IBOutlet weak var lblHeading: UILabel!
    @IBOutlet weak var lblName: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
        
        // Configure the view for the selected state
    }
    
    func configureData(heading : String, name : String){
        lblHeading.text = heading
        lblName.text = name
        
    }
    
}

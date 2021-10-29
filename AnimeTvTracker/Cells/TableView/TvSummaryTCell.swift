//
//  TvSummaryTCell.swift
//  AnimeTvTracker
//
//  Created by Danyal Naveed on 26/07/2021.
//

import UIKit

class TvSummaryTCell: UITableViewCell {

    @IBOutlet weak var tvSummary: UITextView!
    @IBOutlet weak var synopsisHeight: NSLayoutConstraint!
    @IBOutlet weak var btnExpand: UIButton!
    
    var tvHeightChanged: ((_ height : CGFloat) -> Void)?
    var onLayoutChange: (( ) -> Void)?

    
    private var isCollapsed: Bool = true {
        didSet {
            guard let synopsisConstr = synopsisHeight else { return }
            if isCollapsed {
                synopsisConstr.priority = .defaultHigh
            } else { synopsisConstr.priority = .defaultLow }
            setNeedsLayout()
        }
    }
    
    override func sizeThatFits(_ size: CGSize) -> CGSize {
        systemLayoutSizeFitting(size)
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        guard let synopsisConstr = synopsisHeight else { return }
//        btnExpand.isHidden = tvSummary.frame.height < synopsisConstr.constant
        
//        self.headerView.layer.shadowColor = UIColor.black.cgColor
//        self.headerView.layer.shadowOffset = CGSize(width: 0, height: 1)
//        self.headerView.layer.shadowOpacity = 0.3
//        self.headerView.layer.shadowRadius = 2
//        self.headerView.layer.masksToBounds = false
    }
    
    @IBAction func btnExpandPressed(_ sender: UIButton) {
        sender.isSelected = !sender.isSelected
        let angle : CGFloat = sender.isSelected ? .pi : .pi*2
        UIView.animate(withDuration: 0.2) {
            self.isCollapsed.toggle()
            sender.imageView?.transform = CGAffineTransform(rotationAngle: angle)
            self.onLayoutChange?()
            
        }
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    func configureData(summary : String){
        if summary.trimmingCharacters(in: .whitespaces).isEmpty{
            tvSummary.text = "No Synopsis"
        }else{
            tvSummary.text = summary
        }
        
        let height = adjustTextViewHeight(tv: tvSummary)
        
        tvHeightChanged?(height)
        
        
    }
    
    func adjustTextViewHeight(tv : UITextView) -> CGFloat {
        let fixedWidth = tv.frame.size.width
        let newSize = tv.sizeThatFits(CGSize(width: fixedWidth, height: CGFloat.greatestFiniteMagnitude)).height + 5
        var height : CGFloat = 0
        height = newSize + 40
        print("height tv :\(newSize)  new Height :\(height)")
        if newSize < Constants.summaryCellHeight{
            btnExpand.isHidden = true
            synopsisHeight.constant = newSize
        }else{
            btnExpand.isHidden = false
        }
        
        return newSize
        
    }
    
}

//
//  CustomTabBar.swift
//  AnimeTvTracker
//
//  Created by Danyal on 17/07/2021.
//

import Foundation
import UIKit

@IBDesignable class CustomRoundCornerView: UIView {
    
    var corners : CACornerMask = []
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        sharedInit()
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        sharedInit()
    }
    
    override func prepareForInterfaceBuilder() {
        sharedInit()
    }
    
    func sharedInit() {
        // Common logic goes here
        
        refreshCorner(value:cornerRadius)
    }
    
    @IBInspectable var cornerRadius: CGFloat = 5.0 {
        didSet {
            refreshCorner(value: cornerRadius)
        }
    }
    
    @IBInspectable var onTopRight: Bool = true {
        didSet {
            if onTopRight{
                corners.insert(.layerMaxXMinYCorner)
            }
            refreshCorner(value: cornerRadius)
        }
    }
    
    @IBInspectable var onTopLeft: Bool = true {
        didSet {
            if onTopLeft{
                corners.insert(.layerMinXMinYCorner)
            }
            refreshCorner(value: cornerRadius)
        }
    }
    
    
    @IBInspectable var onBottomRight: Bool = true {
        didSet {
            if onBottomRight{
                corners.insert(.layerMaxXMaxYCorner)
            }
            refreshCorner(value: cornerRadius)
        }
    }
    
    
    @IBInspectable var onBottomLeft: Bool = true {
        didSet {
            if onBottomLeft{
                corners.insert(.layerMinXMaxYCorner)
            }
            refreshCorner(value: cornerRadius)
        }
    }
    
    
    
    func refreshCorner (value : CGFloat){
        
        //let maskPath1 = UIBezierPath(roundedRect: bounds,
        //  byRoundingCorners: [.topLeft , .topRight],
        // cornerRadii: CGSize(width: value, height: value))
        layer.cornerRadius = value
        layer.maskedCorners = corners
        
        
    }
    
}

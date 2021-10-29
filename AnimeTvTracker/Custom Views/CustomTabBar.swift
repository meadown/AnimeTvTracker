//
//  CustomTabBar.swift
//  AnimeTvTracker
//
//  Created by Danyal on 12/07/2021.
//

import UIKit
@IBDesignable
class CustomTabBar: UITabBar {

    private var shapeLayer: CALayer?
    var selectedIndex : Int = 0
    var controllers : Int = 4

    override func draw(_ rect: CGRect) {
        self.addShape()
    }

     func addShape() {
        let shapeLayer = CAShapeLayer()
        shapeLayer.path = createPath(index: selectedIndex)
        shapeLayer.strokeColor = UIColor.lightGray.cgColor
        shapeLayer.fillColor = #colorLiteral(red: 0.9782002568, green: 0.9782230258, blue: 0.9782107472, alpha: 1)
        shapeLayer.lineWidth = 0.5
        shapeLayer.shadowOffset = CGSize(width:0, height:0)
        shapeLayer.shadowRadius = 10
        shapeLayer.shadowColor = UIColor.gray.cgColor
        shapeLayer.shadowOpacity = 0.3

        UIView.animate(withDuration: 0.3) {
            if let oldShapeLayer = self.shapeLayer {
                self.layer.replaceSublayer(oldShapeLayer, with: shapeLayer)
            } else {
                self.layer.insertSublayer(shapeLayer, at: 0)
            }
            self.layoutIfNeeded()
        }
        
        self.shapeLayer = shapeLayer
    }
    
    func changeLayer(){
        shapeLayer = nil
    }
    

    func createPath(index : Int) -> CGPath {
        let height: CGFloat = 90
        let path = UIBezierPath()
        let itemWidth = self.frame.width/CGFloat(controllers)
        let diff = itemWidth/2
        let indexOfTab = self.items?.firstIndex(of: self.selectedItem!) ?? 0
        let ind : CGFloat = CGFloat(indexOfTab+1)
        let centerWidth = (itemWidth*ind - diff)
        print("index :\(indexOfTab)")
        
        let point1 : CGFloat = 30 //35 default value
        let point2 : CGFloat = 35  //35 default value
        let heightConst : CGFloat = 40 //default value
        
        path.move(to: CGPoint(x: 0, y: 0))
        path.addLine(to: CGPoint(x: (centerWidth - height ), y: 0))
        path.addCurve(to: CGPoint(x: centerWidth, y: height - heightConst),
                      controlPoint1: CGPoint(x: (centerWidth - point1), y: 0), controlPoint2: CGPoint(x: centerWidth - point2, y: height - heightConst))
        path.addCurve(to: CGPoint(x: (centerWidth + height ), y: 0),
                      controlPoint1: CGPoint(x: centerWidth + point2, y: height - heightConst), controlPoint2: CGPoint(x: (centerWidth + point1), y: 0))
        path.addLine(to: CGPoint(x: self.frame.width, y: 0))
        path.addLine(to: CGPoint(x: self.frame.width, y: self.frame.height))
        path.addLine(to: CGPoint(x: 0, y: self.frame.height))
        path.close()
        return path.cgPath
    }

    override func hitTest(_ point: CGPoint, with event: UIEvent?) -> UIView? {
        guard !clipsToBounds && !isHidden && alpha > 0 else { return nil }
        for member in subviews.reversed() {
            let subPoint = member.convert(point, from: self)
            guard let result = member.hitTest(subPoint, with: event) else { continue }
            return result
        }
        return nil
    }
}

//extension UITabBar {
//    override open func sizeThatFits(_ size: CGSize) -> CGSize {
//        var sizeThatFits = super.sizeThatFits(size)
//        sizeThatFits.height = 100
//        return sizeThatFits
//    }
//}


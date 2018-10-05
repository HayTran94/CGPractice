//
//  ARCView.swift
//  CGPractice
//
//  Created by Hay Tran Van on 10/5/18.
//  Copyright © 2018 Hay Tran Van. All rights reserved.
//

import UIKit

@IBDesignable
class ARCView: UIView {
    var centerPointX: CGFloat!
    var centerPointY: CGFloat!
    var centerPoint: CGPoint!
    var radius: CGFloat!
    
    
    override func draw(_ rect: CGRect) {
        centerPointX = (self.bounds.origin.x + self.bounds.size.width)  / 2
        centerPointY = (self.bounds.origin.y + self.bounds.size.height) / 2
        centerPoint = CGPoint(x: centerPointX, y: centerPointY)
        radius = self.bounds.size.height / 2

        drawCircle()
        drawSquare()
    }
    
    func drawCircle() {
        let circlePath = UIBezierPath(arcCenter: centerPoint, radius: radius, startAngle: CGFloat(0), endAngle:CGFloat(M_PI * 2), clockwise: true)
    
        let shapeLayer = CAShapeLayer()
        shapeLayer.path = circlePath.cgPath
        
        //change the fill color
        shapeLayer.fillColor = UIColor.red.cgColor
        //you can change the stroke color
        shapeLayer.strokeColor = UIColor.red.cgColor
        //you can change the line width
        shapeLayer.lineWidth = 3.0
        self.layer.addSublayer(shapeLayer)
    }
    
    func drawSquare() {
        let radian = 50*(Double.pi/180)
        let centerPointX2 = Double(centerPointX) * cos(radian)
        let centerPointY2 = Double(centerPointY) * sin(radian)
        let centerPoint2  = CGPoint(x: centerPointX2, y: centerPointY2)
        let circlePath = UIBezierPath(arcCenter: centerPoint2, radius: 1, startAngle: CGFloat(0), endAngle:CGFloat(M_PI * 2), clockwise: true)
        
        let shapeLayer = CAShapeLayer()
        shapeLayer.path = circlePath.cgPath
        
        //change the fill color
        shapeLayer.fillColor = UIColor.green.cgColor
        //you can change the stroke color
        shapeLayer.strokeColor = UIColor.green.cgColor
        //you can change the line width
        shapeLayer.lineWidth = 3.0
        self.layer.addSublayer(shapeLayer)
    }

}

extension FloatingPoint {
    var degreesToRadians: Self { return self * .pi / 180 }
    var radiansToDegrees: Self { return self * 180 / .pi }
}

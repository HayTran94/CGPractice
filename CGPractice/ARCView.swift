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
        centerPointX = (self.bounds.size.width) / 2
        centerPointY = (self.bounds.size.width)
        
        print("bounds.origin.x= \(bounds.origin.x)")
        print("bounds.origin.y= \(bounds.origin.y)")
        print("frame.origin.x= \(frame.origin.x)")
        print("frame.origin.y= \(frame.origin.y)")
        centerPoint = CGPoint(x: centerPointX, y: centerPointY)
        radius = centerPointY

        drawCircle()
        drawSquare()
//        getDegree()
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
    
//    func getDegree() {
//        let cornerPointX = 0
//        let a = Double(1)
//        let b = Double(-2*centerPointY)
//        let c = centerPointY*centerPointY - radius*radius + centerPointX*centerPointX
//
//        let delta = b*b - 4*a*Double(c)
//        let y1 = (-b + delta.squareRoot()) / 2*a
//        let y2 = (-b - delta.squareRoot()) / 2*a
//
//        print("y1 = \(y1)")
//        print("y2 = \(y2)")
//        print("delta = \(delta)")
//        print("delta root = \(delta.squareRoot())")
//
//    }
    
    
    func drawSquare() {
        let radian = 290*(Double.pi/180)
        let centerPointX2 = Double(centerPointX) +  Double(radius) * cos(radian)
        let centerPointY2 = Double(centerPointY) + Double(radius) * sin(radian)
        let centerPoint2  = CGPoint(x: centerPointX2, y: centerPointY2)
        let circlePath = UIBezierPath(arcCenter: centerPoint2, radius: 5, startAngle: CGFloat(0), endAngle:CGFloat(M_PI * 2), clockwise: true)
        
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

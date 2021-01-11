//
//  LoadingIndicator3.swift
//  CoreAnimation_Practice
//
//  Created by 윤동민 on 2021/01/11.
//

import UIKit

class LoadingIndicator3: UIView {
    private lazy var circlePath: UIBezierPath = {
        let center = CGPoint(x: bounds.width/2, y: bounds.height/2)
        let path = UIBezierPath(arcCenter: center,
                                radius: bounds.width/2,
                                startAngle: -CGFloat.pi/2,
                                endAngle: 2*CGFloat.pi - CGFloat.pi/2,
                                clockwise: true)
        return path
    }()
    
    private lazy var indicatorLayer: CAShapeLayer = {
        let layer = CAShapeLayer()
        layer.fillColor = UIColor.clear.cgColor
        layer.lineWidth = 7
        layer.lineCap = .round
        layer.strokeColor = UIColor.lightGray.cgColor
        layer.frame = self.bounds
        return layer
    }()
    
    override func draw(_ rect: CGRect) {
        indicatorLayer.path = circlePath.cgPath
        
        self.layer.addSublayer(indicatorLayer)
    }
    
    func startAnimation() {
        let strokeEndanimation = CAKeyframeAnimation(keyPath: "strokeEnd")
        strokeEndanimation.values = [0, 0.1, 0.3, 0.1, 0]
        strokeEndanimation.keyTimes = [0, 0.3, 0.5, 0.7, 1]
        strokeEndanimation.repeatCount = HUGE
        strokeEndanimation.duration = 1
        
        let rotationAnimation = CAKeyframeAnimation(keyPath: "transform.rotation")
        rotationAnimation.values = [0, CGFloat.pi/2, CGFloat.pi, 3*CGFloat.pi/2, 2*CGFloat.pi]
        rotationAnimation.keyTimes = [0, 0.3, 0.5, 0.7, 1]
        rotationAnimation.repeatCount = HUGE
        rotationAnimation.duration = 1
        
        indicatorLayer.add(strokeEndanimation, forKey: "stroke")
        indicatorLayer.add(rotationAnimation, forKey: "rotate")
    }
    
    func stopAnimation() {
        self.layer.sublayers?.forEach {
            $0.removeAllAnimations()
        }
    }
}

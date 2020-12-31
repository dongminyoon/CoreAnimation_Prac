//
//  LoadingIndicator.swift
//  CoreAnimation_Practice
//
//  Created by 윤동민 on 2021/01/01.
//

import UIKit

class LoadingIndicator: UIView {
    private lazy var backgroundLayer: CAShapeLayer = {
        let layer = CAShapeLayer()
        layer.lineWidth = 5
        layer.strokeColor = UIColor.black.cgColor
        layer.fillColor = UIColor.clear.cgColor
        layer.lineCap = .round
        layer.frame = bounds
        return layer
    }()
    
    private lazy var indicatorLayer: CAShapeLayer = {
        let layer = CAShapeLayer()
        layer.strokeColor = UIColor.white.cgColor
        layer.fillColor = UIColor.clear.cgColor
        layer.lineWidth = 5
        layer.lineCap = .round
        layer.frame = bounds
        layer.strokeEnd = 0.35
        return layer
    }()
    
    private lazy var circlePath: UIBezierPath = {
        let center = CGPoint(x: bounds.width/2, y: bounds.height/2)
        let path = UIBezierPath(arcCenter: center,
                                radius: bounds.width/2*2/3,
                                startAngle: -CGFloat.pi/2,
                                endAngle: CGFloat.pi*2 - CGFloat.pi/2,
                                clockwise: true)
        return path
    }()

    override func draw(_ rect: CGRect) {
        backgroundLayer.path = circlePath.cgPath
        indicatorLayer.path = circlePath.cgPath
        
        layer.addSublayer(backgroundLayer)
        layer.addSublayer(indicatorLayer)
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        backgroundColor = .darkGray
        clipsToBounds = true
        layer.cornerRadius = frame.width/2
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        backgroundColor = UIColor.darkGray.withAlphaComponent(0.7)
        clipsToBounds = true
        layer.cornerRadius = frame.width/2
    }
    
    func startAnimation() {
        let rotateAnimation = CABasicAnimation(keyPath: "transform.rotation")
        
        rotateAnimation.fromValue = 0
        rotateAnimation.toValue = 2*CGFloat.pi
        
        rotateAnimation.duration = 2
        rotateAnimation.repeatCount = HUGE
        
        indicatorLayer.add(rotateAnimation, forKey: "rotate")
    }
    
    func cancelAnimation() {
        layer.sublayers?.forEach { layer in
            layer.removeAllAnimations()
            layer.removeFromSuperlayer()
        }
    }
}

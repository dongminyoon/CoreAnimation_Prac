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
        return layer
    }()
    
    private lazy var indicatorLayer: CAShapeLayer = {
        let layer = CAShapeLayer()
        layer.strokeColor = UIColor.white.cgColor
        layer.fillColor = UIColor.clear.cgColor
        layer.lineWidth = 5
        layer.lineCap = .round
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
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        self.backgroundColor = .darkGray
        self.clipsToBounds = true
        self.layer.cornerRadius = self.frame.width / 2
        
        self.layer.addSublayer(self.backgroundLayer)
        self.layer.addSublayer(self.indicatorLayer)
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        self.backgroundColor = .darkGray
        self.clipsToBounds = true
        self.layer.cornerRadius = frame.width/2
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        self.layer.cornerRadius = self.bounds.width / 2
        self.backgroundLayer.frame = self.bounds
        self.indicatorLayer.frame = self.bounds
        
        let center = CGPoint(x: self.bounds.width / 2, y: self.bounds.height / 2)
        let circlePath = UIBezierPath(arcCenter: center,
                                radius: (self.bounds.width / 2) * (2/3),
                                startAngle: -CGFloat.pi / 2,
                                endAngle: (CGFloat.pi * 2) - (CGFloat.pi / 2),
                                clockwise: true)
        self.backgroundLayer.path = circlePath.cgPath
        self.indicatorLayer.path = circlePath.cgPath
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

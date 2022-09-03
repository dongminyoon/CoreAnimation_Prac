//
//  LoadingIndicator6.swift
//  CoreAnimation_Practice
//
//  Created by Dongmin on 2022/09/03.
//

import UIKit

class LoadingIndicator6: UIView {
    
    var lineWidth: CGFloat {
        get { self.indicatorLayer.lineWidth }
        set { self.indicatorLayer.lineWidth = newValue }
    }

    override init(frame: CGRect) {
        super.init(frame: frame)
        
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        self.layer.cornerRadius = self.bounds.width / 2
        
        let circlePath = UIBezierPath(ovalIn: self.bounds)
        self.indicatorLayer.frame = self.bounds
        self.indicatorLayer.path = circlePath.cgPath
    }
    
    func startAnimation() {
        let totalAnimation: CGFloat = 1
        let subAnimationDuration: CGFloat = 0.75
        let startAnimationDelay: CGFloat = totalAnimation - subAnimationDuration
        
        let startAnimation = CABasicAnimation(keyPath: "strokeStart")
        startAnimation.beginTime = startAnimationDelay
        startAnimation.fromValue = 0
        startAnimation.toValue = 1
        startAnimation.duration = subAnimationDuration
        startAnimation.timingFunction = CAMediaTimingFunction(name: .easeInEaseOut)

        let endAnimation = CABasicAnimation(keyPath: "strokeEnd")
        endAnimation.beginTime = 0
        endAnimation.fromValue = 0
        endAnimation.toValue = 1
        endAnimation.duration = subAnimationDuration
        endAnimation.timingFunction = CAMediaTimingFunction(name: .easeInEaseOut)
        
        let animationGroup = CAAnimationGroup()
        animationGroup.animations = [startAnimation, endAnimation]
        animationGroup.duration = 1
        animationGroup.repeatCount = .infinity
        self.indicatorLayer.add(animationGroup, forKey: "Loading_Stroke")
        self.layer.addSublayer(self.indicatorLayer)
        
        let rotationAnimation = CABasicAnimation(keyPath: "transform.rotation.z")
        rotationAnimation.fromValue = 0
        rotationAnimation.toValue = CGFloat.pi * 2
        rotationAnimation.duration = 2
        rotationAnimation.repeatCount = .infinity
        self.indicatorLayer.add(rotationAnimation, forKey: "Loading_Rotation")
    }
    
    private let indicatorLayer: CAShapeLayer = {
        let layer = CAShapeLayer()
        layer.strokeColor = UIColor.blue.cgColor
        layer.lineWidth = 6
        layer.fillColor = UIColor.clear.cgColor
        layer.lineCap = .round
        return layer
    }()
    
    
}

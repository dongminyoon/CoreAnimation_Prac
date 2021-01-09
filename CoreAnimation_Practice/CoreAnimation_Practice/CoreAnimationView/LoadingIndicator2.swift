//
//  LoadingIndicator2.swift
//  CoreAnimation_Practice
//
//  Created by 윤동민 on 2021/01/09.
//

import UIKit

class LoadingIndicator2: UIView {
    enum AnimationType {
        case spinner
        case strokeEnd
    }
    
    private var curAnimation: AnimationType = .spinner
    
    private lazy var indicatorLayer: CAShapeLayer = {
        let layer = CAShapeLayer()
        layer.fillColor = UIColor.clear.cgColor
        layer.strokeColor = UIColor.lightGray.cgColor
        layer.lineCap = .round
        layer.strokeEnd = 0.7
        layer.lineWidth = 5
        layer.frame = bounds
        return layer
    }()
    
    private lazy var circlePath: UIBezierPath = {
        let center = CGPoint(x: frame.width/2, y: frame.height/2)
        let path = UIBezierPath(arcCenter: center,
                                radius: frame.width/2,
                                startAngle: -.pi/2,
                                endAngle: 2*CGFloat.pi-CGFloat.pi/2,
                                clockwise: true)
        return path
    }()
    
    private var startAngle: CGFloat = 0
    private var endAngle: CGFloat = CGFloat.pi*2/3

    override func draw(_ rect: CGRect) {
        indicatorLayer.path = circlePath.cgPath
        
        layer.addSublayer(indicatorLayer)
    }
    
    func anotherAnimation() {
        
    }
    
    func startRotateAnimation() {
        let rotateAnimation = CABasicAnimation(keyPath: "transform.rotation")
        rotateAnimation.fromValue = startAngle
        endAngle = startAngle + .pi*2/3
        rotateAnimation.toValue = endAngle
        
        let strokeAnimation = CABasicAnimation(keyPath: "strokeStart")
        strokeAnimation.fromValue = 0
        strokeAnimation.toValue = 0.6
        
        let groupAnimation = CAAnimationGroup()
        groupAnimation.animations = [rotateAnimation, strokeAnimation]
        groupAnimation.duration = 2
        groupAnimation.repeatCount = 1
        
        groupAnimation.delegate = self
        
        indicatorLayer.add(groupAnimation, forKey: "group")
    }
    
    func nextAnimation() {
        let rotateAnimation = CABasicAnimation(keyPath: "transform.rotation")
        rotateAnimation.fromValue = startAngle
        endAngle = startAngle + .pi*2/3
        rotateAnimation.toValue = endAngle

        let strokeEndAnimation = CABasicAnimation(keyPath: "strokeEnd")
        strokeEndAnimation.fromValue = 0.0
        strokeEndAnimation.toValue = 0.7
        
        let groupAnimation = CAAnimationGroup()
        groupAnimation.animations = [strokeEndAnimation, rotateAnimation]
        groupAnimation.duration = 2
        groupAnimation.repeatCount = 1
        
        indicatorLayer.add(groupAnimation, forKey: "group")
    }
        
    override init(frame: CGRect) {
        super.init(frame: frame)
        backgroundColor = .clear
    }

    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        backgroundColor = .clear
    }
}

extension LoadingIndicator2: CAAnimationDelegate {
    func animationDidStop(_ anim: CAAnimation, finished flag: Bool) {
        guard flag else { return }
        indicatorLayer.removeAnimation(forKey: "rotate")
        startAngle = endAngle
        
        switch curAnimation {
        case .spinner:
            indicatorLayer.removeFromSuperlayer()
            indicatorLayer.strokeEnd = 0.1
            layer.addSublayer(indicatorLayer)
            nextAnimation()
        case .strokeEnd:
            print("")
        }
    }
}

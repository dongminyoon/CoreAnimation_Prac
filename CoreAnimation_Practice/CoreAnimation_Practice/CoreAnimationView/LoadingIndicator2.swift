//
//  LoadingIndicator2.swift
//  CoreAnimation_Practice
//
//  Created by 윤동민 on 2021/01/09.
//

import UIKit

class LoadingIndicator2: UIView {
    private lazy var indicatorLayer: CAShapeLayer = {
        let layer = CAShapeLayer()
        layer.fillColor = UIColor.clear.cgColor
        layer.strokeColor = UIColor.lightGray.cgColor
        layer.lineCap = .round
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

    override func draw(_ rect: CGRect) {
        indicatorLayer.path = circlePath.cgPath
        
        layer.addSublayer(indicatorLayer)
    }
    
    var rotations: [CGFloat] = [0, 0.5, 1.0, 1.5, 2.0, 2.5, 2.7, 3.0]
    var strokeEnds: [CGFloat] = [0.7, 0.5, 0.3, 0.1, 0.1, 0.3, 0.5, 0.7]
    
    func startAnimation() {
        let strokeEndsAnimation = CAKeyframeAnimation(keyPath: "strokeEnd")
        strokeEndsAnimation.keyTimes = [0, Double(1)/Double(7), Double(2)/Double(7), Double(3)/Double(7), Double(4)/Double(7), Double(5)/Double(7), Double(6)/Double(7), 1] as [NSNumber]?
        strokeEndsAnimation.values = strokeEnds
        strokeEndsAnimation.duration = 3.0
        strokeEndsAnimation.repeatCount = HUGE
        indicatorLayer.add(strokeEndsAnimation, forKey: "animation")
        
        let rotationAnimation = CAKeyframeAnimation(keyPath: "transform.rotation")
        rotationAnimation.keyTimes = [0, Double(1)/Double(7), Double(2)/Double(7), Double(3)/Double(7), Double(4)/Double(7), Double(5)/Double(7), Double(6)/Double(7), 1] as [NSNumber]? as [NSNumber]?
        rotationAnimation.values = rotations.map { $0 * 2 * .pi }
        rotationAnimation.duration = 3.0
        rotationAnimation.repeatCount = HUGE
        indicatorLayer.add(rotationAnimation, forKey: "rotation")
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

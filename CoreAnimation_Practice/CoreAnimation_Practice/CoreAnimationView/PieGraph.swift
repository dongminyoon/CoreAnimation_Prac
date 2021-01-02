//
//  PieGraph.swift
//  CoreAnimation_Practice
//
//  Created by 윤동민 on 2021/01/01.
//

import UIKit

class PieGraph: UIView {
    var eachSlice: [Float] = [0.2, 0.5, 0.3]
    var startAngle: CGFloat = -.pi/2
    var endAngle: CGFloat = 0
    var curIndex: Int = 0

    var colorSet: [UIColor] = [.blue, .red, .brown]

    func addAnimation(from index: Int) {
        let animation = CABasicAnimation(keyPath: "strokeEnd")
        animation.fromValue = 0
        animation.toValue = 1
        animation.duration = 3
        animation.delegate = self

        let arcLayer = CAShapeLayer()
        arcLayer.strokeColor = colorSet[index].cgColor
        arcLayer.lineWidth = 80
        arcLayer.fillColor = UIColor.clear.cgColor
        arcLayer.lineCap = .butt

        let center = CGPoint(x: frame.width/2, y: frame.height/2)
        let changed = CGFloat(eachSlice[curIndex]) * .pi * 2.0
        endAngle = startAngle + CGFloat(changed)
        let path = UIBezierPath(arcCenter: center,
                                radius: frame.width/2,
                                startAngle: startAngle,
                                endAngle: endAngle,
                                clockwise: true)

        arcLayer.path = path.cgPath
        arcLayer.add(animation, forKey: "move")
        layer.addSublayer(arcLayer)
    }

    override init(frame: CGRect) {
        super.init(frame: frame)
        addAnimation(from: 0)
    }

    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }
}

extension PieGraph: CAAnimationDelegate {
    func animationDidStop(_ anim: CAAnimation, finished flag: Bool) {
        layer.sublayers?.forEach {
            ($0 as? CAShapeLayer)?.strokeEnd = 1
        }
        
        guard flag else { return }
        if curIndex >= eachSlice.count-1 { return }
        
        startAngle = endAngle
        curIndex += 1
        addAnimation(from: curIndex)
    }
}

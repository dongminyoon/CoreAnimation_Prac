//
//  PieGraph.swift
//  CoreAnimation_Practice
//
//  Created by 윤동민 on 2021/01/01.
//

import UIKit

class PieGraph: UIView {
    var eachSlice: [Float] = [0.3, 0.4, 0.3]
    var curAngle: CGFloat = -CGFloat.pi/2
    var curIndex: Int = 0
    
    var colorSet: [UIColor] = [.blue, .red, .yellow]
    
    func addAnimation(from index: Int) {
        let arcLayer = CAShapeLayer()
        arcLayer.strokeColor = colorSet[index].cgColor
        arcLayer.lineWidth = 20
        arcLayer.fillColor = UIColor.clear.cgColor
        arcLayer.lineCap = .square
        arcLayer.frame = bounds
        arcLayer.strokeEnd = 1
        
        let animation = CABasicAnimation(keyPath: "strokeEnd")
        animation.fromValue = 0
        animation.toValue = 1
        animation.duration = 3
        animation.fillMode = .forwards
        animation.delegate = self
        
        let endAngle = curAngle + .pi*2 * CGFloat(eachSlice[index])
        let center = CGPoint(x: frame.width/2, y: frame.height/2)
        let path = UIBezierPath(arcCenter: center,
                                radius: frame.width/2,
                                startAngle: curAngle,
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
        guard flag else { return }
        if curIndex >= eachSlice.count-1 { return }
        
        curAngle = curAngle + CGFloat.pi*2 * CGFloat(eachSlice[curIndex])
        print(curAngle)
        curIndex += 1
        addAnimation(from: curIndex)
    }
}

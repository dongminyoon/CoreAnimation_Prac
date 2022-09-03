//
//  PieGraph.swift
//  CoreAnimation_Practice
//
//  Created by 윤동민 on 2021/01/01.
//

import UIKit

class PieGraph: UIView {
    
    override init(frame: CGRect) {
        super.init(frame: frame)
    }

    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }
    
    func startAnimation() {
        self.addAnimation(from: 0)
    }

    private func addAnimation(from index: Int) {
        let animation = CABasicAnimation(keyPath: "strokeEnd")
        animation.fromValue = 0
        animation.toValue = 1
        animation.duration = 3
        animation.delegate = self

        let arcLayer = CAShapeLayer()
        arcLayer.strokeColor = self.colorSet[index].cgColor
        arcLayer.lineWidth = 80
        arcLayer.fillColor = UIColor.clear.cgColor
        arcLayer.lineCap = .butt

        let center = CGPoint(x: self.frame.width / 2, y: self.frame.height / 2)
        let changed = CGFloat(self.eachSlice[curIndex]) * .pi * 2.0
        self.endAngle = self.startAngle + CGFloat(changed)
        let path = UIBezierPath(arcCenter: center,
                                radius: self.frame.width / 2,
                                startAngle: self.startAngle,
                                endAngle: self.endAngle,
                                clockwise: true)

        arcLayer.path = path.cgPath
        arcLayer.add(animation, forKey: "move")
        self.layer.addSublayer(arcLayer)
    }
    
    private var eachSlice: [Float] = [0.2, 0.5, 0.3]
    private var startAngle: CGFloat = -.pi / 2
    private var endAngle: CGFloat = 0
    private var curIndex: Int = 0

    private var colorSet: [UIColor] = [.blue, .red, .brown]

}

extension PieGraph: CAAnimationDelegate {
    
    func animationDidStop(_ anim: CAAnimation, finished flag: Bool) {
        guard flag else { return }
        if self.curIndex >= self.eachSlice.count-1 { return }
        
        self.startAngle = self.endAngle
        self.curIndex += 1
        self.addAnimation(from: self.curIndex)
    }
    
}

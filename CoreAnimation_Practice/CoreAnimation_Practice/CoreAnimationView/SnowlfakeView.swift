//
//  SnowlfakeView.swift
//  CoreAnimation_Practice
//
//  Created by 윤동민 on 2021/01/06.
//

import UIKit

class SnowlfakeView: UIView {
    let snowEmitterLayer = CAEmitterLayer()
    let flakeEmitterCell = CAEmitterCell()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        self.backgroundColor = .lightGray
        
        flakeEmitterCell.contents = UIImage(named: "snowFlake")?.cgImage
        flakeEmitterCell.scale = 0.2
        flakeEmitterCell.scaleRange = 0.3
        flakeEmitterCell.emissionRange = .pi
        flakeEmitterCell.lifetime = 20.0
        flakeEmitterCell.birthRate = 10
        flakeEmitterCell.velocity = -30
        flakeEmitterCell.velocityRange = -20
        flakeEmitterCell.yAcceleration = 10
        flakeEmitterCell.alphaRange = 0.4
        flakeEmitterCell.xAcceleration = 1
        
        flakeEmitterCell.spin = -1
        flakeEmitterCell.spinRange = 2.0
        
        snowEmitterLayer.emitterPosition = CGPoint(x: self.bounds.width / 2, y: -50)
        snowEmitterLayer.emitterSize = CGSize(width: self.bounds.width, height: 0)
        snowEmitterLayer.emitterShape = CAEmitterLayerEmitterShape.line
        snowEmitterLayer.beginTime = CACurrentMediaTime()
        snowEmitterLayer.timeOffset = 10
        snowEmitterLayer.emitterCells = [flakeEmitterCell]
        
//        let trailCell = CAEmitterCell()
//        trailCell.yAcceleration = 40
//        trailCell.velocity = -50
//        trailCell.velocityRange = -20
//        trailCell.emissionRange = .pi*2
//        trailCell.birthRate = 2
//        trailCell.lifetime = 3
//        trailCell.alphaSpeed = -0.2
//        trailCell.contents = UIImage(named: "snowFlake")?.cgImage
//        trailCell.scale = 0.1
//
//        flakeEmitterCell.emitterCells = [trailCell]
        
        self.layer.addSublayer(snowEmitterLayer)
    }

    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }
}

//
//  SnowlfakeView.swift
//  CoreAnimation_Practice
//
//  Created by 윤동민 on 2021/01/06.
//

import UIKit

class SnowFlakeView: UIView {
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        self.backgroundColor = .lightGray
        
        self.flakeEmitterCell.contents = UIImage(named: "snowFlake")?.cgImage
        self.flakeEmitterCell.scale = 0.2
        self.flakeEmitterCell.scaleRange = 0.3
        self.flakeEmitterCell.emissionRange = .pi
        self.flakeEmitterCell.lifetime = 20.0
        self.flakeEmitterCell.birthRate = 10
        self.flakeEmitterCell.velocity = -30
        self.flakeEmitterCell.velocityRange = -20
        self.flakeEmitterCell.yAcceleration = 10
        self.flakeEmitterCell.alphaRange = 0.4
        self.flakeEmitterCell.xAcceleration = 1
        self.flakeEmitterCell.spin = -1
        self.flakeEmitterCell.spinRange = 2.0
        
        self.snowEmitterLayer.emitterPosition = CGPoint(x: self.bounds.width / 2, y: -50)
        self.snowEmitterLayer.emitterSize = CGSize(width: self.bounds.width, height: 0)
        self.snowEmitterLayer.emitterShape = CAEmitterLayerEmitterShape.line
        self.snowEmitterLayer.beginTime = CACurrentMediaTime()
        self.snowEmitterLayer.timeOffset = 10
        self.snowEmitterLayer.emitterCells = [flakeEmitterCell]
        self.layer.addSublayer(snowEmitterLayer)
    }

    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }
    
    private let snowEmitterLayer = CAEmitterLayer()
    private let flakeEmitterCell = CAEmitterCell()
    
}

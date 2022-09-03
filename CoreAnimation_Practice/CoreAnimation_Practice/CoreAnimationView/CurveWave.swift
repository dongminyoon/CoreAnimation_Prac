//
//  NewCurveWave.swift
//  CoreAnimation_Practice
//
//  Created by 윤동민 on 2021/01/03.
//

import UIKit

struct WavePoint {
    let constPositionX: CGFloat
    
    var positionX: CGFloat
    var positionY: CGFloat
    
    let velocityX: CGFloat = 5
    
    mutating func update() {
        self.positionX += self.velocityX
        self.positionY = 100 + sin(CGFloat(self.positionX) * .pi / 180) * 10
    }
}

class CurveWave: UIView {
    
    override func draw(_ rect: CGRect) {
        let path = UIBezierPath()
        path.move(to: CGPoint(x: self.bounds.origin.x, y: self.bounds.origin.y + 100))
        
        self.points.forEach { point in
            path.addLine(to: CGPoint(x: point.constPositionX, y: point.positionY))
        }
        
        path.addLine(to: CGPoint(x: self.bounds.width, y: self.bounds.height))
        path.addLine(to: CGPoint(x: 0, y: self.bounds.height))
        path.close()

        self.waveLayer.path = path.cgPath
        self.layer.addSublayer(self.waveLayer)
        
        let displayLink = CADisplayLink(target: self, selector: #selector(self.update))
        displayLink.add(to: .current, forMode: .default)
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        backgroundColor = .clear
        self.initPoints()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func initPoints() {
        for x in 0...Int(UIScreen.main.bounds.width) {
            let y = 100 + sin(CGFloat(x) * .pi / 180) * 10
            let point = WavePoint(constPositionX: CGFloat(x), positionX: CGFloat(x), positionY: y)
            self.points.append(point)
        }
    }
    
    @objc private func update(displayLink: CADisplayLink) {
        let curPath = UIBezierPath()
        curPath.move(to: CGPoint(x: self.bounds.origin.x, y: self.bounds.origin.y + 100))
        
        for index in 0..<self.points.count {
            self.points[index].update()
            curPath.addLine(to: CGPoint(x: self.points[index].constPositionX,
                                        y: self.points[index].positionY))
        }
        
        curPath.addLine(to: CGPoint(x: self.bounds.width, y: self.bounds.height))
        curPath.addLine(to: CGPoint(x: 0, y: self.bounds.height))
        curPath.close()
        
        waveLayer.path = curPath.cgPath
    }
    
    private var points: [WavePoint] = []
    private lazy var waveLayer: CAShapeLayer = {
        let layer = CAShapeLayer()
        layer.frame = self.bounds
        layer.strokeColor = UIColor.cyan.cgColor
        layer.lineWidth = 5
        layer.fillColor = UIColor.cyan.cgColor
        return layer
    }()
    
}

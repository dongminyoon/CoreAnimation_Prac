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
        positionX += velocityX
        positionY = 100 + sin(CGFloat(positionX) * .pi / 180) * 10
    }
}

class CurveWave: UIView {
    private var points: [WavePoint] = []
    
    private lazy var waveLayer: CAShapeLayer = {
        let layer = CAShapeLayer()
        layer.frame = self.bounds
        layer.strokeColor = UIColor.cyan.cgColor
        layer.lineWidth = 5
        layer.fillColor = UIColor.cyan.cgColor
        return layer
    }()
    
    override func draw(_ rect: CGRect) {
        let path = UIBezierPath()
        path.move(to: CGPoint(x: bounds.origin.x, y: bounds.origin.y + 100))
        
        points.forEach { point in
            path.addLine(to: CGPoint(x: point.constPositionX, y: point.positionY))
        }
        
        path.addLine(to: CGPoint(x: bounds.width, y: bounds.height))
        path.addLine(to: CGPoint(x: 0, y: bounds.height))
        path.close()

        waveLayer.path = path.cgPath
        self.layer.addSublayer(waveLayer)
        
        let displayLink = CADisplayLink(target: self, selector: #selector(update))
        displayLink.add(to: .current, forMode: .default)
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        backgroundColor = .clear
        initPoints()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func initPoints() {
        for x in 0...Int(UIScreen.main.bounds.width) {
            let y = 100 + sin(CGFloat(x) * .pi / 180) * 10
            let point = WavePoint(constPositionX: CGFloat(x), positionX: CGFloat(x), positionY: y)
            points.append(point)
        }
    }
    
    @objc
    func update(displayLink: CADisplayLink) {
        let curPath = UIBezierPath()
        curPath.move(to: CGPoint(x: bounds.origin.x, y: bounds.origin.y + 100))
        
        for index in 0..<points.count {
            points[index].update()
            curPath.addLine(to: CGPoint(x: points[index].constPositionX,
                                        y: points[index].positionY))
        }
        
        curPath.addLine(to: CGPoint(x: bounds.width, y: bounds.height))
        curPath.addLine(to: CGPoint(x: 0, y: bounds.height))
        curPath.close()
        
        waveLayer.path = curPath.cgPath
    }
}

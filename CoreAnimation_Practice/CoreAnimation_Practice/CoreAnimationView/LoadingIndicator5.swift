//
//  LoadingIndicator5.swift
//  CoreAnimation_Practice
//
//  Created by 윤동민 on 2021/01/16.
//

import UIKit

class LoadingIndicator5: UIView {
    override var intrinsicContentSize: CGSize {
        return CGSize(width: 80, height: 20)
    }
    
    private let circleViews: [UIView] = [UIView(), UIView(), UIView()]
    
    var circleColor: UIColor? {
        didSet {
            circleViews.forEach { $0.backgroundColor = circleColor }
        }
    }

    override init(frame: CGRect) {
        super.init(frame: frame)
        initView()
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        initView()
    }
    
    private func initView() {
        let circleWidth: CGFloat = 20
        let spacing: CGFloat = 10
        var x: CGFloat = 0
        circleViews.forEach {
            $0.backgroundColor = .lightGray
            $0.clipsToBounds = true
            $0.frame = CGRect(x: x, y: 0, width: 20, height: 20)
            $0.layer.cornerRadius = 10
            addSubview($0)
            
            x += circleWidth + spacing
        }
    }
    
    func animate(duration: TimeInterval) {
        var delay: TimeInterval = 0
        var index: Int = 0
        circleViews.forEach {
            self.animateSub(circle: $0, withDuration: duration, delay: delay, index: index)
            delay += 0.4
            index += 1
        }
    }
    
    private func animateSub(circle: UIView, withDuration: TimeInterval, delay: TimeInterval, index: Int) {
        circle.transform = CGAffineTransform(scaleX: 0, y: 0)
        UIView.animate(withDuration: withDuration,
                       delay: delay,
                       animations: {
                        circle.transform = .identity
                       }, completion: { [weak self] isCompletion in
                        guard let self = self else { return }
                        if index == self.circleViews.count-1 {
                            self.animate(duration: 2.0)
                        }
                       })
    }
}

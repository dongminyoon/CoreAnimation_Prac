//
//  LoadingIndicator4.swift
//  CoreAnimation_Practice
//
//  Created by 윤동민 on 2021/01/12.
//

import UIKit

class LoadingIndicator4: UIView {
    
    var circleColor: UIColor? {
        didSet {
            self.circleViews.forEach { $0.backgroundColor = self.circleColor }
        }
    }
    
    override var intrinsicContentSize: CGSize {
        CGSize(width: 100, height: 20)
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        self.circleViews.forEach {
            $0.backgroundColor = .lightGray
            $0.clipsToBounds = true
            $0.layer.cornerRadius = 10
            $0.alpha = 0.0
            $0.frame = CGRect(x: -40, y: 0, width: 20, height: 20)
        }
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
    }
    
    func startAnimation() {
        self.circleViews.forEach {
            self.addSubview($0)
        }
        
        var delay: Double = 0
        self.circleViews.forEach {
            self.animate(at: $0, with: delay)
            delay += 0.85
        }
    }
    
    func stopAnimation() {
        self.circleViews.forEach {
            $0.removeFromSuperview()
        }
    }
    
    private func animate(at view: UIView, with delay: Double) {
        /* Show Animation */
        UIView.animate(withDuration: 1.0, delay: delay, animations: {
            view.frame = CGRect(x: 0, y: 0, width: 20, height: 20)
            view.alpha = 1.0
        }, completion: { _ in
            UIView.animate(withDuration: 1.0, animations: {
                view.frame = CGRect(x: 40, y: 0, width: 20, height: 20)
            }, completion: { _ in
                UIView.animate(withDuration: 1.0, animations: {
                    view.frame = CGRect(x: 80, y: 0, width: 20, height: 20)
                    view.alpha = 0
                }, completion: { [weak self] _ in
                    view.frame = CGRect(x: -40, y: 0, width: 20, height: 20)
                    self?.animate(at: view, with: 0)
                })
            })
        })
    }
    
    private let circleViews: [UIView] = [UIView(), UIView(), UIView()]
    
}

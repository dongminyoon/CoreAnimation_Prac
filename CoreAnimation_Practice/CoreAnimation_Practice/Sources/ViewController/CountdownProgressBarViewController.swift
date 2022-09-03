//
//  CountdownProgressBarViewController.swift
//  CoreAnimation_Practice
//
//  Created by Dongmin on 2022/09/03.
//

import UIKit

class CountdownProgressBarViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = .white
        
        self.countdownProgressView.frame.size = CGSize(width: 200, height: 200)
        self.countdownProgressView.center = self.view.center
        self.view.addSubview(self.countdownProgressView)
        
        self.countdownProgressView.startCountDown(duration: 10)
    }
    
    private let countdownProgressView = CountdownProgressBar(frame: .zero)

}

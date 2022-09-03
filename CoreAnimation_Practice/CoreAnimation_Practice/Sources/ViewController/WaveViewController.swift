//
//  WaveViewController.swift
//  CoreAnimation_Practice
//
//  Created by Dongmin on 2022/09/03.
//

import UIKit

class WaveViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = .white
        
        let height: CGFloat = 500
        self.waveView.frame = CGRect(x: 0, y: UIScreen.main.bounds.height - height, width: UIScreen.main.bounds.width, height: height)
        self.view.addSubview(self.waveView)
    }
    
    private let waveView = CurveWave(frame: .zero)

}

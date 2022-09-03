//
//  PieGraphViewController.swift
//  CoreAnimation_Practice
//
//  Created by Dongmin on 2022/09/03.
//

import UIKit

class PieGraphViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = .white
        
        self.pieGraphView.frame = CGRect(x: 100, y: 300, width: 200, height: 200)
        self.view.addSubview(self.pieGraphView)
        
        self.pieGraphView.startAnimation()
    }
    
    private let pieGraphView = PieGraph(frame: CGRect(
        x: 100, y: 100, width: 200, height: 200
    ))

}

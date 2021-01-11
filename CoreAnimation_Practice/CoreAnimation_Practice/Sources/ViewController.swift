//
//  ViewController.swift
//  CoreAnimation_Practice
//
//  Created by 윤동민 on 2021/01/01.
//

import UIKit

class ViewController: UIViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        let indicator = LoadingIndicator4(frame: CGRect(x: 100, y: 100, width: 100, height: 100))
        indicator.center = CGPoint(x: view.center.x + 40, y: view.center.y)
        
        indicator.circleColor = UIColor.red
        self.view.addSubview(indicator)
        
        indicator.startAnimation()
    }
}


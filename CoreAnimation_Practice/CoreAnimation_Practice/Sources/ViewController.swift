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
        
        self.view.addSubview(SnowlfakeView(frame: CGRect(x: 0,
                                                         y: 0,
                                                         width: self.view.frame.width,
                                                         height: self.view.frame.height)))
    }
}


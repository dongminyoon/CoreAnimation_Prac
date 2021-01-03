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
        let myCurve = CurveWave(frame: CGRect(x: 0,
                                                 y: self.view.frame.height/2,
                                                 width: self.view.frame.width,
                                                 height: self.view.frame.height/2))
        self.view.addSubview(myCurve)
    }
}


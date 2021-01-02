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
        let pieGraph = PieGraph(frame: CGRect(x: 100,
                                              y: 100,
                                              width: 200,
                                              height: 200))
        self.view.addSubview(pieGraph)
    }
}


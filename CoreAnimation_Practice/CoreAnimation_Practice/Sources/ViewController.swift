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
        let loadingIndicator: LoadingIndicator3 = LoadingIndicator3(frame: CGRect(x: 0,
                                                                                  y: 0,
                                                                                  width: 100,
                                                                                  height: 100))
        loadingIndicator.center = self.view.center
        self.view.addSubview(loadingIndicator)
        loadingIndicator.startAnimation()
    }
}


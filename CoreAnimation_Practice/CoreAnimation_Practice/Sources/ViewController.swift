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
//        let loadingIndicator = LoadingIndicator2(frame: CGRect(x: 100, y: 100, width: 100, height: 100))
//        loadingIndicator.startRotateAnimation()
//        self.view.addSubview(loadingIndicator)
        
        let spinnerView = SpinnerView(frame: CGRect(x: 100, y: 100, width: 100, height: 100))
        self.view.addSubview(spinnerView)
        spinnerView.animate()
    }
}


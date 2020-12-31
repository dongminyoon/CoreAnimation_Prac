//
//  ViewController.swift
//  CountCustomLabel
//
//  Created by 윤동민 on 2020/12/21.
//

import UIKit

class ViewController: UIViewController {
    
    
    @IBOutlet weak var countdownProgressBar: CountdownProgressBar!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }

    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        countdownProgressBar.startCoundDown(duration: 10)
    }

}


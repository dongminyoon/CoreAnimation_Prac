//
//  SpinnerLoading3ViewController.swift
//  CoreAnimation_Practice
//
//  Created by Dongmin on 2022/09/03.
//

import UIKit

class SpinnerLoading3ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = .white
        
        self.loadingView.frame.size = CGSize(width: 200, height: 200)
        self.loadingView.center = self.view.center
        self.view.addSubview(self.loadingView)
        self.loadingView.startAnimation()
    }
    
    private let loadingView = LoadingIndicator3(frame: .zero)

}

//
//  SpinnerLoading5ViewController.swift
//  CoreAnimation_Practice
//
//  Created by Dongmin on 2022/09/03.
//

import UIKit

class SpinnerLoading5ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = .white
        
        self.view.addSubview(self.loadingView)
        self.loadingView.animate(duration: 0.5)
        
        self.loadingView.translatesAutoresizingMaskIntoConstraints = false
        self.loadingView.centerXAnchor.constraint(equalTo: self.view.centerXAnchor).isActive = true
        self.loadingView.centerYAnchor.constraint(equalTo: self.view.centerYAnchor).isActive = true
    }
    
    private let loadingView = LoadingIndicator5(frame: .zero)

}

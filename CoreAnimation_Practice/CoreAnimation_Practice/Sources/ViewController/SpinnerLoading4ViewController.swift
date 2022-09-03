//
//  SpinnerLoading4ViewController.swift
//  CoreAnimation_Practice
//
//  Created by Dongmin on 2022/09/03.
//

import UIKit

class SpinnerLoading4ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = .white
        
        self.loadingView.center = self.view.center
        self.view.addSubview(self.loadingView)
        
        self.loadingView.startAnimation()
        
        self.loadingView.translatesAutoresizingMaskIntoConstraints = false
        self.loadingView.topAnchor.constraint(equalTo: self.view.topAnchor, constant: 100).isActive = true
        self.loadingView.centerXAnchor.constraint(equalTo: self.view.centerXAnchor).isActive = true
        self.loadingView.centerYAnchor.constraint(equalTo: self.view.centerYAnchor).isActive = true
        self.loadingView.invalidateIntrinsicContentSize()
    }
    
    private let loadingView = LoadingIndicator4(frame: .zero)

}

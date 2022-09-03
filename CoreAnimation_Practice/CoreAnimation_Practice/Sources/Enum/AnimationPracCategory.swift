//
//  AnimationPracCategory.swift
//  CoreAnimation_Practice
//
//  Created by Dongmin on 2022/09/03.
//

import UIKit

enum AnimationPracCategory: CaseIterable {
    case labelCounting
    case spinnerLoading1
    case spinnerLoading2
    case spinnerLoading3
    case spinnerLoading4
    case spinnerLoading5
    case snowFlake
    case pieGraph
    
    var title: String {
        switch self {
        case .labelCounting:    return "Label Counting Progress"
        case .spinnerLoading1:  return "Spinner Loading 1"
        case .spinnerLoading2:  return "Spinner Loading 2"
        case .spinnerLoading3:  return "Spinner Loading 3"
        case .spinnerLoading4:  return "Spinner Loading 4"
        case .spinnerLoading5:  return "Spinner Loading 5"
        case .snowFlake:        return "Snow Flake"
        case .pieGraph:         return "Pie Graph"
        }
    }
    
    var exampleViewController: UIViewController {
        switch self {
        case .labelCounting:    return CountdownProgressBarViewController()
        case .spinnerLoading1:  return SpinnerLoading1ViewController()
        case .spinnerLoading2:  return SpinnerLoading2ViewController()
        case .spinnerLoading3:  return SpinnerLoading3ViewController()
        case .spinnerLoading4:  return SpinnerLoading4ViewController()
        case .spinnerLoading5:  return SpinnerLoading5ViewController()
        case .snowFlake:        return SnowFlakeViewController()
        case .pieGraph:         return PieGraphViewController()
        }
    }
}

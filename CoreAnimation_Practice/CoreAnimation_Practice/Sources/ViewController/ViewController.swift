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
        self.setupTableView()
    }
    
    private func setupTableView() {
        self.tableView.delegate = self
        self.tableView.dataSource = self
    }
    
    @IBOutlet weak var tableView: UITableView!
    
}

extension ViewController: UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        AnimationPracCategory.allCases.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "TestCell", for: indexPath)
        let practiceTitle = AnimationPracCategory.allCases[safe: indexPath.row]?.title
        cell.textLabel?.text = practiceTitle
        return cell
    }
    
}

extension ViewController: UITableViewDelegate {
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        guard let practiceCategory = AnimationPracCategory.allCases[safe: indexPath.row] else { return }
        
        let exampleViewController = practiceCategory.exampleViewController
        self.navigationController?.pushViewController(exampleViewController, animated: true)
        self.tableView.deselectRow(at: indexPath, animated: true)
    }
    
}

extension Array {
    
    subscript(safe index: Int) -> Element? {
        return indices ~= index ? self[index] : nil
    }
    
}

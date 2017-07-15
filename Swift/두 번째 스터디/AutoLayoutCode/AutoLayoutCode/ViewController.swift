//
//  ViewController.swift
//  AutoLayoutCode
//
//  Created by Daeyun Ethan Kim on 13/07/2017.
//  Copyright © 2017 Daeyun Ethan Kim. All rights reserved.
//

import UIKit

// MARK: - ViewController: UITableViewController
class ViewController: UITableViewController {

    // MARK: Properties
    
    
    // MARK: Life Cycle
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setViews()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func setViews() {
        navigationItem.title = "Week_02"
    }
}

// MARK: -
extension ViewController {
    // MARK: TableView
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 3
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = UITableViewCell()
        cell.textLabel?.text = "Example_0\(indexPath.row + 1)"
        
        return cell
    }

    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        var exampleVC: UIViewController
        switch indexPath.row {
        case 0:
            exampleVC = ExampleOneViewController()
        case 1:
            exampleVC = ExampleTwoViewController()
        case 2:
            exampleVC = ExampleThreeViewController()
        default:
            return
        }
        
        navigationController?.pushViewController(exampleVC, animated: true)
    }
}


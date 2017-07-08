//
//  SecondViewController.swift
//  FirstStudyCode
//
//  Created by Daeyun Ethan Kim on 03/07/2017.
//  Copyright © 2017 Daeyun Ethan Kim. All rights reserved.
//

import UIKit

// MARK: - SecondViewController: UITableViewController
class SecondViewController: UITableViewController {

    // MARK: Properties
    
    
    // MARK: Life Cycle
    override func viewDidLoad() {
        super.viewDidLoad()

        navigationItem.title = "두 번째 탭바의 뷰 컨트롤러"
        
        tableView.register(ReusableTableViewCell.self, forCellReuseIdentifier: "ReusableTableViewCell")
    }

    
    // MARK: TableView
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 100
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "ReusableTableViewCell", for: indexPath) as? ReusableTableViewCell else {
            return UITableViewCell()
        }
        
        cell.nameLabel.text = "\(indexPath.row)"
        return cell
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let selectionCellViewController = SelectionCellViewController()
        selectionCellViewController.closeButton.setTitle("\(indexPath.row)", for: .normal)
        
        present(selectionCellViewController, animated: true, completion: nil)
    }
    
    
    // MARK: Actions
}

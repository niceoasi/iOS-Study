//
//  CustomViewController.swift
//  FirstStudyCode
//
//  Created by Daeyun Ethan Kim on 03/07/2017.
//  Copyright © 2017 Daeyun Ethan Kim. All rights reserved.
//

import UIKit

// MARK: Constants
let rTVCellID = "ReusableTableViewCell"


// MARK: - CustomViewController: UITableViewController
class CustomViewController: UITableViewController {

    // MARK: Properties
    
    
    // MARK: Life Cycle
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setTabBar(for: navigationController?.tabBarItem.tag)
        registerView()
        
    }
    
    func setTabBar(for tag: Int?) {
        if tag == 0 {
            navigationItem.title = "첫 번째 탭바의 뷰 컨트롤러"
        } else if tag == 1 {
            navigationItem.title = "두 번째 탭바의 뷰 컨트롤러"
        }
    }
    
    func registerView() {
        tableView.register(ReusableTableViewCell.self, forCellReuseIdentifier: rTVCellID)
    }

    
    // MARK: TableView
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 100
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: rTVCellID, for: indexPath) as? ReusableTableViewCell else {
            return UITableViewCell()
        }
        
        cell.configureCell(index: indexPath.row)
//        cell.nameLabel.text = "\(indexPath.row)"
        return cell
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        if navigationController?.tabBarItem.tag == 0 {
            let selectionCellViewController = SelectionCellViewController()
            selectionCellViewController.closeButton.setTitle("\(indexPath.row)", for: .normal)
        
            let backItem = UIBarButtonItem()
            backItem.title = "Back"
            navigationItem.backBarButtonItem = backItem
        
            navigationController?.pushViewController(selectionCellViewController, animated: true)
        } else if navigationController?.tabBarItem.tag == 1 {
            let selectionCellViewController = SelectionCellViewController()
            selectionCellViewController.closeButton.setTitle("\(indexPath.row)", for: .normal)
        
            present(selectionCellViewController, animated: true, completion: nil)
        }
    }
    
    
    // MARK: Actions
}


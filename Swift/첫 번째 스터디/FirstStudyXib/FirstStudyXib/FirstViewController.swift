//
//  FirstViewController.swift
//  FirstStudyXib
//
//  Created by Daeyun Ethan Kim on 03/07/2017.
//  Copyright © 2017 Daeyun Ethan Kim. All rights reserved.
//

import UIKit

// MARK: - FirstViewController: UIViewController, UITableViewDelegate, UITableViewDataSource
class FirstViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {

    // MARK: Properties
    
    
    // MARK: Ourlets
    @IBOutlet weak var tableView: UITableView?
    
    
    // MARK: Life Cycle
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let nib = UINib(nibName: "ReusableTableViewCell", bundle: nil)
        tableView?.register(nib, forCellReuseIdentifier: "ReusableTableViewCell")
        
        navigationItem.title = "첫 번째 탭바의 뷰 컨트롤러"
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        guard let selectionIndexPath = tableView?.indexPathForSelectedRow else {
            return
        }
        
        tableView?.deselectRow(at: selectionIndexPath, animated: false)
    }
    
    
    // MARK: TableView
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 100
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "ReusableTableViewCell", for: indexPath) as? ReusableTableViewCell else {
            return UITableViewCell()
        }
        cell.indexLabel?.text = "\(indexPath.row)"
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let backItem = UIBarButtonItem()
        backItem.title = "Back"
        navigationItem.backBarButtonItem = backItem
        
        let selectedCellVC = SelectedCellViewController()
        selectedCellVC.index = indexPath.row
//        selectedCellVC.closeButton?.setTitle("\(indexPath.row)", for: .normal)
        
        navigationController?.pushViewController(selectedCellVC, animated: true)
    }
    
    
    // MARK: Action
}

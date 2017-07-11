//
//  SecondViewController.swift
//  FirstStudyXib
//
//  Created by Daeyun Ethan Kim on 03/07/2017.
//  Copyright © 2017 Daeyun Ethan Kim. All rights reserved.
//

import UIKit

// MARK: - SecondViewController: UIViewController, UITableViewDataSource, UITableViewDelegate
class SecondViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {

    // MARK: Properties
    
    
    // MARK: Outlets
    @IBOutlet weak var tableView: UITableView?
    
    
    // MARK: Life Cycle
    override func viewDidLoad() {
        super.viewDidLoad()

        let nib = UINib(nibName: "ReusableTableViewCell", bundle: nil)
        tableView?.register(nib, forCellReuseIdentifier: "ReusableTableViewCell")
        
        navigationItem.title = "두 번째 탭바의 뷰 컨트롤러"
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
        let selectedCellVC = SelectedCellViewController()
        selectedCellVC.index = indexPath.row
        
        present(selectedCellVC, animated: true, completion: nil)
    }
    
    
    // MARK: Action
}

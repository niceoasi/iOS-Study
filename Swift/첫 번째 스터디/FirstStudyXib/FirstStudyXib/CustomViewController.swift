//
//  CustomViewController.swift
//  FirstStudyXib
//
//  Created by Daeyun Ethan Kim on 03/07/2017.
//  Copyright © 2017 Daeyun Ethan Kim. All rights reserved.
//

import UIKit

// MARK: Constants
let rTVCellID = "ReusableTableViewCell"


// MARK: - CustomViewController: UIViewController
class CustomViewController: UIViewController {

    // MARK: Properties
    
    
    // MARK: Ourlets
    @IBOutlet weak var tableView: UITableView?
    
    
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
        let nib = UINib(nibName: rTVCellID, bundle: nil)
        tableView?.register(nib, forCellReuseIdentifier: rTVCellID)
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        guard let selectionIndexPath = tableView?.indexPathForSelectedRow else {
            return
        }
        
        tableView?.deselectRow(at: selectionIndexPath, animated: false)
    }
    
    
    // MARK: Action
}

// MARK: CustomViewController: UITableViewDelegate, UITableViewDataSource
extension CustomViewController: UITableViewDelegate, UITableViewDataSource {
    // MARK: TableView
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 100
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: rTVCellID, for: indexPath) as? ReusableTableViewCell else {
            return UITableViewCell()
        }
        cell.configureCell(index: indexPath.row)
//        cell.indexLabel?.text = "\(indexPath.row)"
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        if navigationController?.tabBarItem.tag == 0 {     // tag가 안 먹음..
            let backItem = UIBarButtonItem()
            backItem.title = "Back"
            navigationItem.backBarButtonItem = backItem
            
            let selectedCellVC = SelectedCellViewController()
            selectedCellVC.index = indexPath.row
            
            navigationController?.pushViewController(selectedCellVC, animated: true)
        } else {
            let selectedCellVC = SelectedCellViewController()
            selectedCellVC.index = indexPath.row
            
            present(selectedCellVC, animated: true, completion: nil)
        }
    }
}

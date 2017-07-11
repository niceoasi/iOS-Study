//
//  CustomViewController.swift
//  FirstStudy
//
//  Created by Daeyun Ethan Kim on 01/07/2017.
//  Copyright © 2017 Daeyun Ethan Kim. All rights reserved.
//

import UIKit

// MARK: Constants
let rTVCellID = "ReusableTableViewCell"
let sdSegueID = "ShowDetailCellSegue"
let pdSegueID = "PresentDetailCellSegue"


// MARK: - CustomViewController: UIViewController
class CustomViewController: UIViewController {
    
    // MARK: Properties
    
    
    // MARK: Outlets
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
        let nib = UINib.init(nibName: rTVCellID, bundle: nil)
        tableView?.register(nib, forCellReuseIdentifier: rTVCellID)
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        guard let selectionIndexPath = tableView?.indexPathForSelectedRow  else {
            return
        }
        
        tableView?.deselectRow(at: selectionIndexPath, animated: false)
    }
    
    
    // MARK: Segue
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        guard let index = sender as? Int, let controller = segue.destination as? SearchLabelViewController else {
            print("Error: Segue")
            return
        }
        
        controller.index = index
    }
    
    
    // MARK: Actions
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
        if navigationController?.tabBarItem.tag == 0 {
            let backItem = UIBarButtonItem()
            backItem.title = "Back"
            navigationItem.backBarButtonItem = backItem
            
            performSegue(withIdentifier: sdSegueID, sender: indexPath.row)
        } else if navigationController?.tabBarItem.tag == 1 {
            performSegue(withIdentifier: pdSegueID, sender: indexPath.row)
        }
        
        /*
         let searchStroyBoard = UIStoryboard(name: "SearchLabel", bundle: nil)
         
         guard let viewController = searchStroyBoard.instantiateViewController(withIdentifier: "SearchLabelViewController") as? SearchLabelViewController else {
         print("error")
         return
         }
         
         viewController.index = indexPath.row
         navigationController?.pushViewController(viewController, animated: true)
         */
    }
}


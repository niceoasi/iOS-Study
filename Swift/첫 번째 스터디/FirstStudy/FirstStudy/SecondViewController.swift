//
//  SecondViewController.swift
//  FirstStudy
//
//  Created by Daeyun Ethan Kim on 01/07/2017.
//  Copyright © 2017 Daeyun Ethan Kim. All rights reserved.
//

import UIKit

// MARK: - SecondViewController: UIViewController
class SecondViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {

    // MARK: Properties
    
    
    // MARK: Outlets
    @IBOutlet weak var tableView: UITableView?
    
    
    // MARK: Life Cycle
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let nib = UINib.init(nibName: "ReusableTableViewCell", bundle: nil)
        tableView?.register(nib, forCellReuseIdentifier: "ReusableTableViewCell")
        
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
    
    
    // MARK: Table View
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
        performSegue(withIdentifier: "PresentDetailCellSegue", sender: indexPath.row)
        
        /*
         let searchStroyBoard = UIStoryboard(name: "SearchLabel", bundle: nil)
         
         guard let viewController = searchStroyBoard.instantiateViewController(withIdentifier: "SearchLabelViewController") as? SearchLabelViewController else {
            print("error")
            return
         }
         
         viewController.closeButton?.titleLabel?.text = "\(indexPath.row)"
         viewController.index = indexPath.row
         present(viewController, animated: true, completion: nil)
         */
    }
    
    
    // MARK: Actions
}

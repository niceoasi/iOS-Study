//
//  SelectedCellViewController.swift
//  FirstStudyXib
//
//  Created by Daeyun Ethan Kim on 03/07/2017.
//  Copyright © 2017 Daeyun Ethan Kim. All rights reserved.
//

import UIKit


// MARK: - SelectedCellViewController: UIViewController
class SelectedCellViewController: UIViewController {

    // MARK: Properties
    var flag = true
    var index: Int = 0
    
    // MARK: Outlets
    @IBOutlet weak var closeButton: UIButton?
    
    
    // MARK: Life Cycle
    override func viewDidLoad() {
        super.viewDidLoad()
        
        closeButton?.setTitle("\(index)", for: .normal)
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        flag = true
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        if(flag) {
            navigationController?.popToRootViewController(animated: false)
        }
    }

    
    // MARK: Actions
    @IBAction func searchLabel() {
        flag = false
        
        let searchLabelVC = SearchLabelViewController()
        
        present(searchLabelVC, animated: true, completion: nil)
    }
    
    @IBAction func dismissViewController() {
        dismiss(animated: true, completion: nil)
    }
}

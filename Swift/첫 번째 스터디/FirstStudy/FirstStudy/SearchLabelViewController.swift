//
//  SearchLabelViewController.swift
//  FirstStudy
//
//  Created by Daeyun Ethan Kim on 01/07/2017.
//  Copyright © 2017 Daeyun Ethan Kim. All rights reserved.
//

import UIKit

// MARK: - SearchLabelViewController: UIViewController
class SearchLabelViewController: UIViewController {
    
    // MARK: Properties
    var index: Int?
    var flag = true
    
    
    // MARK: Outlets
    @IBOutlet weak var closeButton: UIButton?
    
    
    // MARK: Life Cycle
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        if let num = index {
            closeButton?.setTitle("\(num)", for: .normal)
        }
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        flag = true
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        if(flag) {
            navigationController?.popToRootViewController(animated: true)
        }
    }
    
    
    // MARK: Actions
    @IBAction func searchLabel(_ sender: Any) {
        flag = false
    }
    
    @IBAction func closeViewController(_ sender: Any) {
        if let navigationController = navigationController {
            navigationController.popViewController(animated: true)
        } else {
            dismiss(animated: true, completion: nil)
        }
    }
}

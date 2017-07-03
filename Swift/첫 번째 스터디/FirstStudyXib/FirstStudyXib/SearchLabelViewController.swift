//
//  SearchLabelViewController.swift
//  FirstStudyXib
//
//  Created by Daeyun Ethan Kim on 04/07/2017.
//  Copyright © 2017 Daeyun Ethan Kim. All rights reserved.
//

import UIKit

// MARK: - SearchLabelViewController: UIViewController
class SearchLabelViewController: UIViewController {

    // MARK: Properties
    
    
    // MARK: Outlets
    @IBOutlet weak var searchedLabel: UILabel?
    
    
    // MARK: Life Cycle
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        
        show()
    }

    func show() {
        UIView.animate(withDuration: 10000.0, animations: {
        }, completion: { (flag) in
            self.searchedLabel?.text = "찾았다!"
        })
    }

    // MARK: Actions
    @IBAction func dismissVieController(_ sender: Any) {
        dismiss(animated: true, completion: nil)
    }
}

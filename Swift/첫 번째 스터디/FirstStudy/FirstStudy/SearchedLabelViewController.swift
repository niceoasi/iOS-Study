//
//  SearchedLabelViewController.swift
//  FirstStudy
//
//  Created by Daeyun Ethan Kim on 03/07/2017.
//  Copyright © 2017 Daeyun Ethan Kim. All rights reserved.
//

import UIKit

// MARK: - SearchedLabelViewController: UIViewController
class SearchedLabelViewController: UIViewController {

    // MARK: Properties
    
    
    // MARK: Outlets
    @IBOutlet weak var textLabel: UILabel?
    
    
    // MARK: Life cycle
    override func viewDidLoad() {
        super.viewDidLoad()
        
        textLabel?.text = "찾는 중"
        // Do any additional setup after loading the view.
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        showView()
    }

    
    // MARK: Actions
    @IBAction func closeViewController(_ sender: Any) {
        dismiss(animated: true, completion: nil)
    }
    
    internal func showView() {
        UIView.animate(withDuration: 200.0, animations : {
        }, completion : { (flag) in
            self.textLabel?.text = "찾았다!"
        })
    }
}

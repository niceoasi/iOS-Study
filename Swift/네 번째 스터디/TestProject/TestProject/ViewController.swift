//
//  ViewController.swift
//  TestProject
//
//  Created by Daeyun Ethan Kim on 29/07/2017.
//  Copyright © 2017 Daeyun Ethan Kim. All rights reserved.
//

import UIKit

// MARK: - ViewController: UIViewController
class ViewController: UIViewController {

    // MAKR: Properties
        // constants
    let kHambugerViewControllerID = "HambugerMenuViewController"
    
    
    // MARK: Outlets
        // views
    @IBOutlet weak var leftAreaView: UIView?
    @IBOutlet weak var leftButtonForNavigationBar: UIButton?
    @IBOutlet weak var rightButtonForNavigationBar: UIButton?
    
    
    // MARK: Life Cycle
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setViewController()
    }

    func setViewController() {
        // AddGesture
        let panGesture = UIPanGestureRecognizer(target: self, action: #selector(doPan(sender:)))
        leftAreaView?.addGestureRecognizer(panGesture)
    }
    
    func doPan(sender:UIPanGestureRecognizer) {
        let touchLocation = sender.location(in: leftAreaView)
        
        if touchLocation.x > 0 || touchLocation.x > 0 {
            modalHambuger()
        }
    }
    
    func modalHambuger() {
        guard let hambugerVC = storyboard?.instantiateViewController(withIdentifier: kHambugerViewControllerID) as? HambugerMenuViewController else {
            print("Error: modalHambuger()")
            return
        }
        hambugerVC.modalPresentationStyle = .overFullScreen
        
        present(hambugerVC, animated: false, completion: nil)
    }
}


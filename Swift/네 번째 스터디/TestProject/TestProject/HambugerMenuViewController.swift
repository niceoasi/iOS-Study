//
//  HambugerMenuViewController.swift
//  TestProject
//
//  Created by Daeyun Ethan Kim on 29/07/2017.
//  Copyright © 2017 Daeyun Ethan Kim. All rights reserved.
//

import UIKit

// MARK: HambugerMenuViewController: UIViewController
class HambugerMenuViewController: UIViewController {
    
    // MARK: Properties
        // constants
    let kAnimationDuration = 2.0
    let kTrailingConstraintForTableView: CGFloat = 100.0
    let kDimViewAlpha: CGFloat = 0.6
    let kScreenWidht = UIScreen.main.bounds.size.width
    
    var startX: CGFloat = 0
    var diffX: CGFloat = 0
    
    // MARK: Outlets
        // views
    @IBOutlet weak var dimView: UIView?
    @IBOutlet weak var tableView: UITableView?
    @IBOutlet weak var blankArea: UIView?
        // constraints
    @IBOutlet weak var trailingConstraintForTableView: NSLayoutConstraint?
    @IBOutlet weak var widthConstraintForNavigationBar: NSLayoutConstraint?
    @IBOutlet weak var widthConstraintForTableView: NSLayoutConstraint?

    
    // MARK: Life Cycle
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setViewController()
    }
    
    func setViewController() {
        dimView?.alpha = 0.0
        
        // set constraints
        widthConstraintForTableView?.constant = -(kTrailingConstraintForTableView)
        trailingConstraintForTableView?.constant = kScreenWidht
        widthConstraintForNavigationBar?.constant = kScreenWidht
        
        // set gesture
        let panGesture = UIPanGestureRecognizer(target: self, action: #selector(doPan(sender:)))
        view.addGestureRecognizer(panGesture)
        
        let tapGesture = UITapGestureRecognizer(target: self, action: #selector(doGesture(sender:)))
        blankArea?.addGestureRecognizer(tapGesture)
    }
    
    // gesture selector
    func doPan(sender: UIPanGestureRecognizer) {
        let x = sender.translation(in: sender.view).x
        let isLeft = x < diffX
        
        print(x)
        switch (sender.state) {
        case .changed:
            if x > -300 && x < 0 {
                diffX = x
                trailingConstraintForTableView?.constant = kTrailingConstraintForTableView - x
                dimView?.alpha = kDimViewAlpha + x/500
                view.layoutIfNeeded()
            } 
            
        case .ended:
            if x < -40 && isLeft {
                hideView()
            } else {
                showView()
            }
            
        default:
            break
        }
    }
    
    func doGesture(sender: UITapGestureRecognizer) {
            hideView()
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        
        showView()
    }
    
    internal func showView(animated: Bool = true) {
        if animated {
            UIView.animate(withDuration: kAnimationDuration, delay: 0.0, usingSpringWithDamping: 0.75, initialSpringVelocity: 0.2, options: UIViewAnimationOptions(), animations: {
                
                self.dimView?.alpha = self.kDimViewAlpha
                self.trailingConstraintForTableView?.constant = self.kTrailingConstraintForTableView
                self.view.layoutIfNeeded()
            }) { (flag) in
                
            } 
        }
    }
    
    internal func hideView() {
        UIView.animate(withDuration: kAnimationDuration, delay: 0.0, usingSpringWithDamping: 0.75, initialSpringVelocity: 0.2, options: UIViewAnimationOptions(), animations: {
            self.trailingConstraintForTableView?.constant = UIScreen.main.bounds.width
            self.dimView?.alpha = 0.0
            self.view.layoutIfNeeded()
        }, completion: { (flag) in
            self.dismiss(animated: false, completion: nil)
        })
    }
}

// MARK:
extension HambugerMenuViewController {
    // MARK: Actions
    @IBAction func dismissAction(_ sender: Any) {
        hideView()
    }
    
}


// MARK: HambugerMenuViewController: UITableViewDataSource, UITableViewDelegate
extension HambugerMenuViewController: UITableViewDataSource, UITableViewDelegate {
    
    // MARK: TableView
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 10
    }
    
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "UsableCell", for: indexPath)
        
        cell.textLabel?.text = "\(indexPath.row)"
        
        return cell
    }
}

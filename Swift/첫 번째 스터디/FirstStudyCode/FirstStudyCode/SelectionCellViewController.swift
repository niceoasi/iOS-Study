//
//  SelectionCellViewController.swift
//  FirstStudyCode
//
//  Created by Daeyun Ethan Kim on 03/07/2017.
//  Copyright © 2017 Daeyun Ethan Kim. All rights reserved.
//

import UIKit

// MARK: - SelectionCellViewController: UIViewController
class SelectionCellViewController: UIViewController {

    // MARK: Properties
    var index: Int?
    var flag = true
    
    let searchLabelButton: UIButton = {
        let button = UIButton()
        button.translatesAutoresizingMaskIntoConstraints = false
        button.backgroundColor = .brown
        button.setTitleColor(.white, for: .normal)
        button.setTitle("Search Label", for: .normal)
        button.titleLabel?.numberOfLines = 2
        button.addTarget(self, action: #selector(searchLabel), for: .touchUpInside)
        
        return button
    }()
    
    let closeButton: UIButton = {
        let button = UIButton()
        button.translatesAutoresizingMaskIntoConstraints = false
        button.backgroundColor = .gray
        button.setTitleColor(.white, for: .normal)
        button.addTarget(self, action: #selector(dismissViewController), for: .touchUpInside)
        
        return button
    }()
    
    
    // MARK: Life Cycle
    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.backgroundColor = .blue
        setupViews()
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
    
    func setupViews() {
        // Add Close Button
        view.addSubview(closeButton)
        view.addConstraints(NSLayoutConstraint.constraints(withVisualFormat: "H:|-50-[v0]-50-|", options: NSLayoutFormatOptions(), metrics: nil, views: ["v0": closeButton]))
        view.addConstraints(NSLayoutConstraint.constraints(withVisualFormat: "V:|-200-[v0]-200-|", options: NSLayoutFormatOptions(), metrics: nil, views: ["v0": closeButton]))
        
        // Add Search Label Button
        view.addSubview(searchLabelButton)
        let horizontalConstraintForSearchLabelButton = NSLayoutConstraint(item: searchLabelButton, attribute: .leading, relatedBy: .equal, toItem: view, attribute: .leading, multiplier: 1, constant: 0)
        let verticalConstraintForSearchLabelButton = NSLayoutConstraint(item: searchLabelButton, attribute: .top, relatedBy: .equal, toItem: view, attribute: .top, multiplier: 1, constant: 0)
        let widthConstraintForSearchLabelButton = NSLayoutConstraint(item: searchLabelButton, attribute: .width, relatedBy: .equal, toItem: nil, attribute: .notAnAttribute, multiplier: 1, constant: 100)
        let heightConstraintForSearchLabelButton = NSLayoutConstraint(item: searchLabelButton, attribute: .height, relatedBy: .equal, toItem: nil, attribute: .notAnAttribute, multiplier: 1, constant: 100)
        
        NSLayoutConstraint.activate([horizontalConstraintForSearchLabelButton, verticalConstraintForSearchLabelButton, widthConstraintForSearchLabelButton, heightConstraintForSearchLabelButton])
    }
    
    // MARK: Actions
    func searchLabel() {
        flag = false
        
        let searchLabelViewController = SearchLabelViewController()
        
        present(searchLabelViewController, animated: true, completion: nil)
    }
    
    func dismissViewController() {
        dismiss(animated: true, completion: nil)
    }
}

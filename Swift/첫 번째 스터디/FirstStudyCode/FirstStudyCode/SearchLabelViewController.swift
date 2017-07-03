//
//  SearchLabelViewController.swift
//  FirstStudyCode
//
//  Created by Daeyun Ethan Kim on 03/07/2017.
//  Copyright © 2017 Daeyun Ethan Kim. All rights reserved.
//

import UIKit

// MARK: - SearchLabelViewController: UIViewController
class SearchLabelViewController: UIViewController {

    // MARK: Properties
    let textLabel: UILabel = {
        let label = UILabel()
        //        label.frame = CGRect(x: 100, y: 100, width: 100, height: 100)
        label.translatesAutoresizingMaskIntoConstraints = false
        label.backgroundColor = .blue
        label.textColor = .white
        label.textAlignment = .center
        label.numberOfLines = 2
        label.font = UIFont.systemFont(ofSize: 15)
        label.text = "찾는 중"
        
        return label
    }()
    
    let closeButton: UIButton = {
       let button = UIButton()
        button.translatesAutoresizingMaskIntoConstraints = false
        button.backgroundColor = .black
        button.setTitleColor(.white, for: .normal)
        button.setTitle("닫기", for: .normal)
        button.addTarget(self, action: #selector(dismissViewController), for: .touchUpInside)
        
        return button
    }()
    
    // MARK: Life Cycle
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white

        setupViews()
        showView()
    }
    
    func setupViews() {
        // Add Text Label
        view.addSubview(textLabel)
        view.addConstraints(NSLayoutConstraint.constraints(withVisualFormat: "H:|-50-[v0]-50-|", options: NSLayoutFormatOptions(), metrics: nil, views: ["v0": textLabel]))
        view.addConstraints(NSLayoutConstraint.constraints(withVisualFormat: "V:|-200-[v0]-200-|", options: NSLayoutFormatOptions(), metrics: nil, views: ["v0": textLabel]))
        
//        let centerXConstraintsForTextLabel = textLabel.centerXAnchor.constraint(equalTo: view.centerXAnchor)
//        let centerYConstraintsForTextLabel = textLabel.centerYAnchor.constraint(equalTo: view.centerYAnchor)
//        let widthConstraintForTextLabel = NSLayoutConstraint(item: textLabel, attribute: .width, relatedBy: .equal, toItem: nil, attribute: .notAnAttribute, multiplier: 1, constant: 100)
//        let heightConstraintForTextLabel = NSLayoutConstraint(item: textLabel, attribute: .height, relatedBy: .equal, toItem: nil, attribute: .notAnAttribute, multiplier: 1, constant: 100)
//        
//        NSLayoutConstraint.activate([centerXConstraintsForTextLabel, centerYConstraintsForTextLabel, widthConstraintForTextLabel, heightConstraintForTextLabel])
        
        
        // ADd Close Button
        view.addSubview(closeButton)
        view.addConstraints(NSLayoutConstraint.constraints(withVisualFormat: "H:|-10-[v0]", options: NSLayoutFormatOptions(), metrics: nil, views: ["v0": closeButton]))
        view.addConstraints(NSLayoutConstraint.constraints(withVisualFormat: "V:|-20-[v0]", options: NSLayoutFormatOptions(), metrics: nil, views: ["v0": closeButton]))
    }
    
    internal func showView() {
        let when = DispatchTime.now() + 1
        DispatchQueue.main.asyncAfter(deadline: when) { 
            self.textLabel.text = "찾았다!"
        }
        
        
//        UIView.animate(withDuration: 10000.0, animations: {
//            self.textLabel.text = "찾는 중.."
//        }, completion: { (flag) in
//            self.textLabel.text = "찾았다!"
//        })
    }
    
    // MARK: Actions
    func dismissViewController() {
        dismiss(animated: true, completion: nil)
    }
}

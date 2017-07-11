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
        label.textColor = .black
        label.textAlignment = .center
        label.numberOfLines = 2
        label.font = UIFont.systemFont(ofSize: 15)
        label.text = "찾는 중"
        
        return label
    }()
    
    let closeButton: UIButton = {
       let button = UIButton()
        button.translatesAutoresizingMaskIntoConstraints = false
        button.setTitleColor(UIColor(hexString: "#66A2D0"), for: .normal)
        button.setTitle("닫기", for: .normal)
        button.addTarget(self, action: #selector(dismissViewController), for: .touchUpInside)
        
        return button
    }()
    
    let viewOne: UIView = {
        let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.backgroundColor = UIColor(hexString: "#C0C0C0")
        
        return view
    }()
    
    let viewTwo: UIView = {
        let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.backgroundColor = UIColor(hexString: "#737373")
        
        return view
    }()
    
    let viewThree: UIView = {
        let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.backgroundColor = .black
        
        return view
    }()
    
    let viewFour: UIView = {
       let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.backgroundColor = UIColor(hexString: "#FC9727")
        
        return view
    }()
    
    
    // MARK: Life Cycle
    override func viewDidLoad() {
        super.viewDidLoad()

        setupViews()
        showView()
    }
    
    func setupViews() {
        view.backgroundColor = .white
        
        // Add Views
        view.addSubview(viewOne)
        viewOne.addSubview(viewTwo)
        viewTwo.addSubview(viewThree)
        viewThree.addSubview(viewFour)
        
        view.addConstraints(NSLayoutConstraint.constraints(withVisualFormat: "H:|-20-[v0]-80-|", options: NSLayoutFormatOptions(), metrics: nil, views: ["v0": viewOne]))
        view.addConstraints(NSLayoutConstraint.constraints(withVisualFormat: "V:|-20-[v0]-400-|", options: NSLayoutFormatOptions(), metrics: nil, views: ["v0": viewOne]))
        viewOne.addConstraints(NSLayoutConstraint.constraints(withVisualFormat: "H:|[v0]|", options: NSLayoutFormatOptions(), metrics: nil, views: ["v0": viewTwo]))
        viewOne.addConstraints(NSLayoutConstraint.constraints(withVisualFormat: "V:|-60-[v0]-40-|", options: NSLayoutFormatOptions(), metrics: nil, views: ["v0": viewTwo]))
        viewTwo.addConstraints(NSLayoutConstraint.constraints(withVisualFormat: "H:|-20-[v0]-20-|", options: NSLayoutFormatOptions(), metrics: nil, views: ["v0": viewThree]))
        viewTwo.addConstraints(NSLayoutConstraint.constraints(withVisualFormat: "V:|[v0]|", options: NSLayoutFormatOptions(), metrics: nil, views: ["v0": viewThree]))
        viewThree.addConstraints(NSLayoutConstraint.constraints(withVisualFormat: "H:|-20-[v0]-20-|", options: NSLayoutFormatOptions(), metrics: nil, views: ["v0": viewFour]))
        viewThree.addConstraints(NSLayoutConstraint.constraints(withVisualFormat: "V:|[v0]|", options: NSLayoutFormatOptions(), metrics: nil, views: ["v0": viewFour]))
        
        // Add Text Label
        viewFour.addSubview(textLabel)
        viewFour.addConstraints(NSLayoutConstraint.constraints(withVisualFormat: "H:|-50-[v0]", options: NSLayoutFormatOptions(), metrics: nil, views: ["v0": textLabel]))
        viewFour.addConstraints(NSLayoutConstraint.constraints(withVisualFormat: "V:|-90-[v0]", options: NSLayoutFormatOptions(), metrics: nil, views: ["v0": textLabel]))
        
        // Add Close Button
        view.addSubview(closeButton)
        view.addConstraints(NSLayoutConstraint.constraints(withVisualFormat: "H:|-20-[v0]", options: NSLayoutFormatOptions(), metrics: nil, views: ["v0": closeButton]))
        view.addConstraints(NSLayoutConstraint.constraints(withVisualFormat: "V:[v0]-20-[v1]", options: NSLayoutFormatOptions(), metrics: nil, views: ["v0": viewOne, "v1": closeButton]))
 
        
        /*
        view.addSubview(textLabel)
        let hConstraints = NSLayoutConstraint.constraints(withVisualFormat: "H:|-50-[v0]", options: NSLayoutFormatOptions(), metrics: nil, views: ["v0": textLabel])
        let vConstraints = NSLayoutConstraint.constraints(withVisualFormat: "V:|-90-[v0]", options: NSLayoutFormatOptions(), metrics: nil, views: ["v0": textLabel])
        NSLayoutConstraint.activate(hConstraints)
        NSLayoutConstraint.activate(vConstraints)
        
        let centerXConstraintsForTextLabel = textLabel.centerXAnchor.constraint(equalTo: view.centerXAnchor)
        let centerYConstraintsForTextLabel = textLabel.centerYAnchor.constraint(equalTo: view.centerYAnchor)
        let widthConstraintForTextLabel = NSLayoutConstraint(item: textLabel, attribute: .width, relatedBy: .equal, toItem: nil, attribute: .notAnAttribute, multiplier: 1, constant: 100)
        let heightConstraintForTextLabel = NSLayoutConstraint(item: textLabel, attribute: .height, relatedBy: .equal, toItem: nil, attribute: .notAnAttribute, multiplier: 1, constant: 100)
        
        NSLayoutConstraint.activate([centerXConstraintsForTextLabel, centerYConstraintsForTextLabel, widthConstraintForTextLabel, heightConstraintForTextLabel])
        
        view.addConstraints([centerXConstraintsForTextLabel, centerYConstraintsForTextLabel, widthConstraintForTextLabel, heightConstraintForTextLabel])
        */
    }
    
    internal func showView() {
        let when = DispatchTime.now() + 1
        DispatchQueue.main.asyncAfter(deadline: when) { 
            self.textLabel.text = "찾았다!"
        }
        
        /*
        UIView.animate(withDuration: 10000.0, animations: {
            self.textLabel.text = "찾는 중.."
        }, completion: { (flag) in
            self.textLabel.text = "찾았다!"
        })
        */
    }
    
    
    // MARK: Actions
    func dismissViewController() {
        dismiss(animated: true, completion: nil)
    }
}

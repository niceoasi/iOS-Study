//
//  ViewController.swift
//  TestAnimation
//
//  Created by Daeyun Ethan Kim on 23/07/2017.
//  Copyright © 2017 Daeyun Ethan Kim. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var startButton: UIButton!
    @IBOutlet weak var yConstration: NSLayoutConstraint!
    let frameView = UIView()
    @IBOutlet weak var animationView: UIView!

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        animationView.transform = CGAffineTransform(scaleX: 0.001, y: 0.001)
        
        startButton.addTarget(self, action: #selector(doStrat(sender:)), for: .touchUpInside)
        
        frameView.frame = CGRect(origin: CGPoint.zero, size: CGSize(width: 100, height: 100))
        frameView.backgroundColor = .black
        view.addSubview(frameView)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        
    }
    
    func doStrat(sender: AnyObject?) {
        
        UIView.animate(withDuration: 1.0, delay: 0, usingSpringWithDamping: 0.5, initialSpringVelocity: 0.8, options: .curveEaseInOut, animations: {
            self.animationView.layer.transform.m33 = 10.0
//            self.animationView.transform = CGAffineTransform.identity
            self.view.layoutIfNeeded()
        }) { (flag) in
            
        }
        
//        UIView.animate(withDuration: 0.3, animations: {
//            self.yConstration.constant = -100
//            self.view.layoutIfNeeded()
//            
//            self.animationView.frame = CGRect(origin: CGPoint(x: 100, y: 200), size: self.animationView.frame.size)
//        })
        
    }

}


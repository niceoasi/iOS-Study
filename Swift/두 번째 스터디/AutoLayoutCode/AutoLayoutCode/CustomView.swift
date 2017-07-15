//
//  CustomView.swift
//  AutoLayoutCode
//
//  Created by Daeyun Ethan Kim on 14/07/2017.
//  Copyright © 2017 Daeyun Ethan Kim. All rights reserved.
//

import UIKit

// MARK: - CustomView: UIView
class CustomView: UIView {

    // MARK: Properties
    
    
    // MARK: Init
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        print("\(description) : convenience init")
    }
    
    convenience init(bgColor: UIColor = .clear, width: Double = 100, height: Double = 100) {
        let frame = CGRect(x: 0, y: 0, width: width, height: height)
        self.init(frame: frame)
        
        backgroundColor = bgColor
        
    }

    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    deinit {
        print("\(description) : deinit")
    }
    
    /*
    // Only override draw() if you perform custom drawing.
    // An empty implementation adversely affects performance during animation.
    override func draw(_ rect: CGRect) {
        // Drawing code
    }
    */

}

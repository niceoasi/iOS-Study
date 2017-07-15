//
//  CustomLabel.swift
//  AutoLayoutCode
//
//  Created by Daeyun Ethan Kim on 14/07/2017.
//  Copyright © 2017 Daeyun Ethan Kim. All rights reserved.
//

import UIKit

// MARK: - CustomLabel: UILabel
class CustomLabel: UILabel {
    
    // MARK: Properties
    
    
    // MARK: Init
    override init(frame: CGRect) {
        super.init(frame: frame)
    }
    
    convenience init(bgColor: UIColor = .clear, txtColor: UIColor = .white, width: Double = 100, heigth: Double = 100, fontSize: CGFloat = 10, txtAlignment: NSTextAlignment = .center, txt: String = "") {
        let frame = CGRect(x: 0, y: 0, width: width, height: heigth)
        self.init(frame: frame)
        
        backgroundColor = bgColor
        textColor = txtColor
        font = UIFont.systemFont(ofSize: fontSize)
        textAlignment = txtAlignment
        text = txt
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    

    /*
    // Only override draw() if you perform custom drawing.
    // An empty implementation adversely affects performance during animation.
    override func draw(_ rect: CGRect) {
        // Drawing code
    }
    */

}

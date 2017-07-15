//
//  CustomButton.swift
//  AutoLayoutCode
//
//  Created by Daeyun Ethan Kim on 14/07/2017.
//  Copyright © 2017 Daeyun Ethan Kim. All rights reserved.
//

import UIKit

// MARK: - CustomButton: UIButton 
class CustomButton: UIButton {

    // MARK: - Properties
    
    
    // MARK: Init
    override init(frame: CGRect) {
        super.init(frame: frame)
    }
    
    convenience init(bgColor: UIColor = .clear, titleColor: UIColor = .white, width: Double = 100, height: Double = 100, title: String = "") {
        let frame = CGRect(x: 0, y: 0, width: width, height: height)
        self.init(frame: frame)
        
        backgroundColor = bgColor
        setTitleColor(titleColor, for: .normal)
        titleLabel?.font = UIFont.systemFont(ofSize: 10)
//        titleLabel?.adjustsFontSizeToFitWidth = true
        setTitle(title, for: .normal)
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

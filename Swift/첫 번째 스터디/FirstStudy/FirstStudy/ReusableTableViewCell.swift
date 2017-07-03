//
//  ReusableTableViewCell.swift
//  FirstStudy
//
//  Created by Daeyun Ethan Kim on 01/07/2017.
//  Copyright © 2017 Daeyun Ethan Kim. All rights reserved.
//

import UIKit

// MARK: - ReusableTableViewCell: UITableViewCell
class ReusableTableViewCell: UITableViewCell {
    
    // MARK: Properties
    
    
    // MARK: Outlets
    @IBOutlet weak var indexLabel: UILabel?
    
    
    // MARK: Life Cycle
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    
    // MARK: Actions
}

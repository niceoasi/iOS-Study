//
//  ImageCollectionViewCell.swift
//  TestProject
//
//  Created by Daeyun Ethan Kim on 16/07/2017.
//  Copyright © 2017 Daeyun Ethan Kim. All rights reserved.
//

import UIKit

// MARK: - ImageCollectionViewCell: UICollectionViewCell
class ImageCollectionViewCell: UICollectionViewCell {

    // MARK: Properties
    
    // MARK: Outlets
    @IBOutlet weak var imgView: UIImageView?
    
    // MARK: Life Cycle
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    
    func setDatas(img: UIImage?) {
        guard let img = img else {
            return
        }
        imgView?.image = img
    }

}

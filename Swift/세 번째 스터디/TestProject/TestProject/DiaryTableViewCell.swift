//
//  DiaryTableViewCell.swift
//  TestProject
//
//  Created by Daeyun Ethan Kim on 16/07/2017.
//  Copyright © 2017 Daeyun Ethan Kim. All rights reserved.
//

import UIKit

// MARK: - DiaryTableViewCell: UITableViewCell
class DiaryTableViewCell: UITableViewCell {

    // MARK: Properties
    let iCVCellID = "ImageCollectionViewCell"
    var imgs: [UIImage]?
    
    // MARK: Outlets
    @IBOutlet weak var collectionView: UICollectionView?
    @IBOutlet weak var titleTextLabel: UILabel?
    @IBOutlet weak var flowLayout: UICollectionViewFlowLayout?
    
    @IBOutlet weak var collectionViewContainerView: UIView?
    @IBOutlet weak var titleContainerView: UIView?
    @IBOutlet weak var heightConstraintForCollectionView: NSLayoutConstraint?
    
    
    // MARK: Life Cycle
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        collectionView?.dataSource = self
        collectionView?.delegate = self
        setDatas()
        setViews()
        
    }
    
    func setDatas(title: String? = nil, imgs: [UIImage]? = nil) {
        heightConstraintForCollectionView?.constant = 0
        if let title = title {
            titleTextLabel?.text = title
        }
        if let imgs = imgs {
            heightConstraintForCollectionView?.constant = 200
            self.imgs = imgs
        }
    }

    func setViews() {
        
        let cvCellNib = UINib(nibName: iCVCellID, bundle: nil)
        collectionView?.register(cvCellNib, forCellWithReuseIdentifier: iCVCellID)
        
        flowLayout?.itemSize = CGSize(width: UIScreen.main.bounds.size.width - 32.0, height: 200.0)
        flowLayout?.minimumInteritemSpacing = 0.0
        flowLayout?.minimumLineSpacing = 0.0
        
//        if let width = collectionViewContainerView?.bounds.width, let height = collectionViewContainerView?.bounds.height {
//            flowLayout?.itemSize = CGSize(width: width, height: height)
//        }
    }
}

// MAKR: DiaryTableViewCell: UICollectionViewDataSource, UICollectionViewDelegate
extension DiaryTableViewCell: UICollectionViewDataSource, UICollectionViewDelegate {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        guard let imgs = imgs else {
            return 0
        }
        
        return imgs.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: iCVCellID, for: indexPath) as? ImageCollectionViewCell else {
            print("Error: collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath)")
            return UICollectionViewCell()
        }
        let img = imgs?[indexPath.row]
        cell.setDatas(img: img)
        
        return cell
    }
}

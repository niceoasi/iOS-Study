//
//  ViewController.swift
//  TestProject
//
//  Created by Daeyun Ethan Kim on 16/07/2017.
//  Copyright © 2017 Daeyun Ethan Kim. All rights reserved.
//

import UIKit

// MARK: - ViewController: UIViewController
class ViewController: UIViewController {

    // MARK: Properties
    let dTVCellID = "DiaryTableViewCell"
    var dummy: [Data]?
    
    // MARK: Outlets
    @IBOutlet weak var tableView: UITableView?
    
    // MARK: Life Cycle
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        setData()
        setViews()
        
    }
    
    func setData() {
        guard let datas = DataController.getData() else {
            return
        }
        dummy = datas
        
    }

    func setViews() {
        let tvCellNib = UINib(nibName: dTVCellID, bundle: nil)
        tableView?.register(tvCellNib, forCellReuseIdentifier: dTVCellID)
    }


}

// MARK: ViewController: UITableViewDelegate, UITableViewDataSource
extension ViewController: UITableViewDelegate, UITableViewDataSource {
    // MARK: TableView
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        guard let dummy = dummy else {
            return 0
        }
        
        print("numberOfRowsInSection")
        return dummy.count
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        let data = dummy?[indexPath.row]
        let title = data?.title
        let imgs = data?.imgs

        if title != nil && imgs != nil {
            return 251
        } else if title == nil && imgs != nil {
            return 200
        } else if title != nil && imgs == nil {
            return 51
        } else {
            return 0
        }
        
//        switch (title, imgs) {
//        case title != nil && imgs != nil:
//            return 1
//        default:
//            return 0
//        }
        print("\(indexPath.row) heightForRowAt")
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: dTVCellID, for: indexPath) as? DiaryTableViewCell else {
            return UITableViewCell()
        }
        let data = dummy?[indexPath.row]
        
        cell.setDatas(title: data?.title, imgs: data?.imgs)

        print("\(indexPath.row) cellForRowAt")
        return cell
    }
}


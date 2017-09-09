//
//  DataController.swift
//  TestProject
//
//  Created by Daeyun Ethan Kim on 16/07/2017.
//  Copyright © 2017 Daeyun Ethan Kim. All rights reserved.
//

import Foundation
import UIKit

// MARK: - DataController
class DataController {
    // dummyData 
    let dummy: [Data] = [Data(id: "일번"), Data(id: "이번", title: "타이틀"), Data(id: "삼번", imgs: [UIImage(named: "beer.jpg")!, UIImage(named: "building.jpg")!, UIImage(named: "burj-khalifa.jpg")!]), Data(id: "사번", title: "그림과 같이", imgs: [UIImage(named: "burj-khalifa.jpg")!, UIImage(named: "child.jpg")!, UIImage(named: "deep-eye.jpg")!])]
    
    // MARK: Properties
    static private var datas = [Data(id: "일번"), Data(id: "이번", title: "타이틀"), Data(id: "삼번", imgs: [UIImage(named: "beer.jpg")!, UIImage(named: "building.jpg")!, UIImage(named: "burj-khalifa.jpg")!]), Data(id: "사번", title: "그림과 같이", imgs: [UIImage(named: "burj-khalifa.jpg")!, UIImage(named: "child.jpg")!, UIImage(named: "deep-eye.jpg")!])]
        //[Data]()
    
    
    // MARK: func
    class func getData() -> [Data]? {
        if !datas.isEmpty {
            return datas
        } else {
            return nil
        }
    }
    
    class func addData(data: Data) {
        datas.append(data)
    }
}

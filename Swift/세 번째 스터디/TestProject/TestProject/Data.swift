//
//  Data.swift
//  TestProject
//
//  Created by Daeyun Ethan Kim on 16/07/2017.
//  Copyright © 2017 Daeyun Ethan Kim. All rights reserved.
//

import Foundation
import UIKit

// MARK: - Data
struct Data {
    var id: String
    var title: String?
    var imgs: [UIImage]?
    
    init(id: String, title: String? = nil, imgs: [UIImage]? = nil) {
        if let title = title {
            self.title = title
        }
        if let imgs = imgs {
            self.imgs = imgs
        }
        
        self.id = id
    }
}

//
//  Item.swift
//  jphacks
//
//  Created by sekiya on 2019/10/20.
//  Copyright © 2019 sekiya. All rights reserved.
//

import Foundation


struct Item {
    let name: String
    let discription: String
    let image_path: String
    
    init(name: String, discription: String, image_path: String){
        self.name = name as String
        self.discription = discription as String
        self.image_path = image_path as String
    }
}

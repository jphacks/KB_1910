//
//  UserAuthInfo.swift
//  jphacks
//
//  Created by sekiya on 2019/10/19.
//  Copyright © 2019 sekiya. All rights reserved.
//

import Foundation

class UserAuthInfo: NSObject, NSCoding {
    var name: String!
    var password: String!
    
    init(name: String, password: String) {
        self.name = name
        self.password = password
    }
    
    required init?(coder: NSCoder) {
        self.name = coder.decodeObject(forKey: "name") as? String
        self.password = coder.decodeObject(forKey: "password") as? String
    }
    
    func encode(with coder: NSCoder) {
        if let name = name { coder.encode(name, forKey: "name") }
        if let password = password { coder.encode(password, forKey: "password") }
    }
    
}

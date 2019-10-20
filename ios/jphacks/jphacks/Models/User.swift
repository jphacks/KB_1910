//
//  User.swift
//  jphacks
//
//  Created by sekiya on 2019/10/20.
//  Copyright © 2019 sekiya. All rights reserved.
//

import Foundation

struct User {
    let account_name: String
    let password: String
    
    init(account_name: String, password: String){
        self.account_name = account_name as String
        self.password = password as String
    }
}

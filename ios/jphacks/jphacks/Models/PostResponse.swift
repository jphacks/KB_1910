//
//  ResponseBody.swift
//  jphacks
//
//  Created by sekiya on 2019/10/20.
//  Copyright © 2019 sekiya. All rights reserved.
//

import Foundation

struct PostResponse {
    let id: Int
    let user_id: Int
    let date: String
    let text: String
    let img_url: String
    let map_lat: Double
    let map_lon: Double
    let like_cnt: Int
    
    init(id: Int, user_id: Int, date: String, text: String, img_url: String, map_lat: Double, map_lon: Double, like_cnt: Int){
        self.id = id
        self.user_id = user_id
        self.date = date
        self.text = text
        self.img_url = img_url
        self.map_lat = map_lat
        self.map_lon = map_lon
        self.like_cnt = like_cnt
    }
}

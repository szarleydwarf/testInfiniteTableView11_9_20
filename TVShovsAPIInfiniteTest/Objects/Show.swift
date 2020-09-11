//
//  Show.swift
//  TVShovsAPIInfiniteTest
//
//  Created by The App Experts on 11/09/2020.
//  Copyright © 2020 The App Experts. All rights reserved.
//

import Foundation
struct Show : Codable{
    let id:Int
    let name:String
    let startDate:String
    let endDate:String
    let status:String
    let imageUrl:URL
    
    enum CoddingKeys:String, CodingKey {
        case id
        case name
        case startDate = "start_date"
        case endDate = "end_date"
        case status
        case imageUrl = "image_thumbnail_path"
    }
}

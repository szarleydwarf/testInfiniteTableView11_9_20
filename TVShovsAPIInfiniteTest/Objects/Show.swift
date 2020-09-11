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
    
    enum CodingKeys: String, CodingKey {
        case id
        case name
        case startDate = "start_date"
        case endDate = "end_date"
        case status
        case imageUrl = "image_thumbnail_path"
    }
    
    init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)

        self.id = try container.decode(Int.self, forKey: .id)
        self.name = try container.decode(String.self, forKey: .name)
        self.startDate = try container.decode(String.self, forKey: .startDate)
        self.endDate = try container.decode(String.self, forKey: .endDate)
        self.status = try container.decode(String.self, forKey: .status)
        self.imageUrl = try container.decode(URL.self, forKey: .imageUrl)
    }
}

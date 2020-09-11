//
//  ShowResults.swift
//  TVShovsAPIInfiniteTest
//
//  Created by The App Experts on 11/09/2020.
//  Copyright © 2020 The App Experts. All rights reserved.
//

struct ShowResults : Codable{
    let tvShows: [Show]
    
    enum CodingKeys: String, CodingKey  {
        case tvShows = "tv_shows"
    }
}

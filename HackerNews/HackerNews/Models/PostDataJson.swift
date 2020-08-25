//
//  PostDataJson.swift
//  HackerNews
//
//  Created by Mukunda on 21/08/20.
//  Copyright © 2020 Mac. All rights reserved.
//

import Foundation
struct PostDataJson: Codable {
    let hits: [Post]
    
    
}
struct Post : Codable, Identifiable {
    
//    becauseWhenWeUseIdentifiable id property is must
    
    var id: String{
        return objectID
    }
    
    
    let objectID: String
    let points: Int
    let title: String
    let url : String?
    
    
}

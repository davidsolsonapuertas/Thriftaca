//
//  Item.swift
//  Thriftaca
//
//  Created by Louis Valencia on 11/21/21.
//

import Foundation
import UIKit

class Item: Codable {
    var userId: Int
    var post_title: String
    var category: String
    var price: Int
    var description: String
    var image_url: String
    
    init(user_id: Int, post_title: String, category: String, price: Int, description: String, image_url: String) {
        self.userId = user_id
        self.post_title = post_title
        self.category = category
        self.price = price
        self.description = description
        self.image_url = image_url
    }
    
    enum CodingKeys: String, CodingKey {
        case userId = "user_id"
        case post_title = "post_title"
        case image_url = "image_url"
        
        case category, price, description
    }
}


class ItemsResponse: Codable {
    var posts: [Item]
}

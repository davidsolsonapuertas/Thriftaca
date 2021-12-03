//
//  Item.swift
//  Thriftaca
//
//  Created by Louis Valencia on 11/21/21.
//

import Foundation
import UIKit

class Item {
    var post_title: String
    var category: String
    var price: Double
    var description: String
    var image_url: String
    
    init(post_title: String, category: String, price: Double, description: String, image_url: String) {
        self.post_title = post_title
        self.category = category
        self.price = price
        self.description = description
        self.image_url = image_url
    }
}

class ItemResult: Codable {
    var post_title: String
    var category: String
    var price: Double
    var description: String
    var image_url: String
}

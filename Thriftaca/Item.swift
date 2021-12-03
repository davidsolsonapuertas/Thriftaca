//
//  Item.swift
//  Thriftaca
//
//  Created by Louis Valencia on 11/21/21.
//

import Foundation
import UIKit

class Item {
<<<<<<< HEAD
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
=======
    var image: String
    var price: String
    var name: String
    var category: String
    var email: String
    var phone: String
    var descriptions: String
    
    
    init(image: String, price: String, name: String, category: String, email: String, phone: String, descriptions: String) {
        self.image = image
        self.price = price
        self.name = name
        self.category = category
        self.email = email
        self.phone = phone
        self.descriptions = descriptions
        
        
        
    }
}
>>>>>>> 1b4d611c0fd6c46ce3b29eee9671b844e9f16185

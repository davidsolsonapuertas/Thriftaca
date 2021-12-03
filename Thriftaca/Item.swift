//
//  Item.swift
//  Thriftaca
//
//  Created by Louis Valencia on 11/21/21.
//

import Foundation
import UIKit

class Item {
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

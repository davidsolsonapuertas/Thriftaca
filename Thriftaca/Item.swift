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
    var price: Double
    var name: String
    var category: String
    
    init(image: String, price: Double, name: String, category: String) {
        self.image = image
        self.price = price
        self.name = name
        self.category = category
    }
}

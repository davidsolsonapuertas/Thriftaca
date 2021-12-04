import Foundation
import UIKit

class Item: Codable {
    var contact_info: String
    var email: String
    var post_title: String
    var category: String
    var price: Double
    var description: String
    var image_url: String
    
    init(image_url: String, price: Double, post_title: String, category: String, email: String, contact_info: String, description: String) {
        self.contact_info = contact_info
        self.email = email
        self.post_title = post_title
        self.category = category
        self.price = price
        self.description = description
        self.image_url = image_url
    }
}

class ItemsResponse: Codable {
    var posts: [Item]
}

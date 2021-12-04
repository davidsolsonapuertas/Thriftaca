import Foundation
import UIKit

class User {
    var email: String
    var password: String
    var contact_info: String
    var session_token: String
    
    init(email: String, password: String, contact_info: String) {
        self.email = email
        self.password = password
        self.contact_info = contact_info
        self.session_token = ""
    }
}

class UserResult: Codable {
    var session_token: String
}

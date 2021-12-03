//
//  User.swift
//  Thriftaca
//
//  Created by David Solsona on 02/12/2021.
//

import Foundation
import UIKit

class User {
    var email: String
    var password: String
    var contact_info: String
    
    init(email: String, password: String, contact_info: String) {
        self.email = email
        self.password = password
        self.contact_info = contact_info
    }
}

class UserResult: Codable {
    var session_token: String
}

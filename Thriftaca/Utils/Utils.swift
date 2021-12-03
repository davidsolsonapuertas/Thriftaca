//
//  Utils.swift
//  Thriftaca
//
//  Created by David on 20/11/2021.
//

import Foundation
import UIKit
import SnapKit
<<<<<<< HEAD
import Alamofire
=======
>>>>>>> 1b4d611c0fd6c46ce3b29eee9671b844e9f16185

class TextFieldWithPadding: UITextField {
    var textPadding = UIEdgeInsets(
        top: 10,
        left: 10,
        bottom: 10,
        right: 10
    )

    override func textRect(forBounds bounds: CGRect) -> CGRect {
        let rect = super.textRect(forBounds: bounds)
        return rect.inset(by: textPadding)
    }

    override func editingRect(forBounds bounds: CGRect) -> CGRect {
        let rect = super.editingRect(forBounds: bounds)
        return rect.inset(by: textPadding)
    }
}


//
//  specificItemViewController.swift
//  Thriftaca
//
//  Created by David Solsona on 01/12/2021.
//

import UIKit
import SnapKit

class PushViewController: UIViewController {
    var image: String?
    var price: Double?
    var name: String?
    var category: String?

    init(image: String, price: Double, name: String, category: String) {
        self.image = image
        self.price = price
        self.name = name
        self.category = category
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupConstraints()
    }
    
    func setupConstraints() {
        NSLayoutConstraint.activate([
            
        ])
    }
}


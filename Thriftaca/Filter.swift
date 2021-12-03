//
//  Filter.swift
//  Thriftaca
//
//  Created by JJ on 11/30/21.
//

import UIKit
import Foundation

class Filter {
    var filterName: String
    var isSelected: Bool
    
    init(filterName: String) {
        self.filterName = filterName
        self.isSelected = false 
    }
    func getLabel() -> String{
        return filterName
    }
}

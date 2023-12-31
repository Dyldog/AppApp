//
//  CodableMakeableView.swift
//  AppApp
//
//  Created by Dylan Elliott on 29/11/2023.
//

import Foundation
import Armstrong

struct CodableMakeableView {
    let type: String
    let value: any MakeableView
    
    init(value: any MakeableView) {
        self.value = value
        self.type = typeString(Swift.type(of: value))
    }
}

//
//  CodableMakeableList.swift
//  AppApp
//
//  Created by Dylan Elliott on 24/11/2023.
//

import Foundation

struct CodableMakeableList {
    let elements: [any MakeableView]
    
    init(elements: [any MakeableView]) {
        self.elements = elements
    }
}

// Codable implemented in `Generated.swift`

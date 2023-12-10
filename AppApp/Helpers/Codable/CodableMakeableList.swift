//
//  CodableMakeableList.swift
//  AppApp
//
//  Created by Dylan Elliott on 24/11/2023.
//

import Foundation
import Armstrong

struct CodableMakeableList: Codable {
    let elements: [CodableMakeableView]
    
    init(elements: [CodableMakeableView]) {
        self.elements = elements
    }
    
    init(elements: [any MakeableView]) {
        self.elements = elements.map { .init(value: $0) }
    }
}

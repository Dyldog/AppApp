//
//  MakeableArray.swift
//  AppApp
//
//  Created by Dylan Elliott on 24/11/2023.
//

import Foundation

struct MakeableArray: Codable {
    let elements: [any MakeableView]
    
    init(elements: [any MakeableView]) {
        self.elements = elements
    }
    
    init(from decoder: Decoder) throws {
        let container = try decoder.singleValueContainer()
        self.elements = try container.decode(CodableMakeableList.self).elements
    }
    
    func encode(to encoder: Encoder) throws {
        var container = encoder.singleValueContainer()
        try container.encode(CodableMakeableList(elements: elements))
    }
    
    func inserting(_ value: Element, at index: Int) -> Self {
        .init(elements: elements.inserting(value, at: index))
    }
    
    func removing(at index: Int) -> Self {
        .init(elements: elements.removing(at: index))
    }
}

extension MakeableArray: Sequence {
    func makeIterator() -> IndexingIterator<[any MakeableView]> {
        IndexingIterator(_elements: elements)
    }
}

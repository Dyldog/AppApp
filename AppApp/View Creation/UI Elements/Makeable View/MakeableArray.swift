//
//  MakeableArray.swift
//  AppApp
//
//  Created by Dylan Elliott on 24/11/2023.
//

import SwiftUI

final class MakeableArray: Codable, PrimitiveEditableVariableValue {
    func editView(onUpdate: @escaping (MakeableArray) -> Void) -> AnyView {
        Text("Hello").any
    }
    
    static var type: VariableType { .list }
    
    func add(_ other: VariableValue) throws -> VariableValue {
        fatalError()
    }
    
    var protoString: String { "TODO" }
    
    var valueString: String { "TODO" }
    
    func value(with variables: Binding<Variables>) async throws -> VariableValue? {
        self
    }
    
    var value: [any MakeableView]
    static let defaultValue: [any MakeableView] = .init()
    
    init(value: [any MakeableView]) {
        self.value = value
    }
    
    init(from decoder: Decoder) throws {
        let container = try decoder.singleValueContainer()
        self.value = try container.decode(CodableMakeableList.self).elements
    }
    
    func encode(to encoder: Encoder) throws {
        var container = encoder.singleValueContainer()
        try container.encode(CodableMakeableList(elements: value))
    }
    
    func inserting(_ value: Element, at index: Int) -> Self {
        .init(value: self.value.inserting(value, at: index))
    }
    
    func removing(at index: Int) -> Self {
        .init(value: value.removing(at: index))
    }
}

extension MakeableArray: Sequence {
    func makeIterator() -> IndexingIterator<[any MakeableView]> {
        IndexingIterator(_elements: value)
    }
}

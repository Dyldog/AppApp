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
    
    static func make(factory: (Properties) -> Any) -> MakeableArray {
        .init(elements: factory(.value) as! [any MakeableView])
    }
    
    func value(for property: Properties) -> Any? {
        switch property {
        case .value: return elements
        }
    }
    
    func set(_ value: Any, for property: Properties) {
        switch property {
        case .value: self.elements = value as! [any MakeableView]
        }
    }
    
    var elements: [any MakeableView]
    
    init(elements: [any MakeableView]) {
        self.elements = elements
    }
    
    enum Properties: String, PrimitiveViewProperty {
        case value
        
        var defaultValue: Any {
            switch self {
            case .value: return [any MakeableView]()
            }
        }
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

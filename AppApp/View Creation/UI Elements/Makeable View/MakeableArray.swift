//
//  MakeableArray.swift
//  AppApp
//
//  Created by Dylan Elliott on 24/11/2023.
//

import SwiftUI

// sourcery: variableTypeName = "makeableArray"
final class MakeableArray: EditableVariableValue {

    static var type: VariableType { .makeableArray }
    static var defaultValue: MakeableArray { .init(value: [], axis: .init(value: .vertical))}
    
    var protoString: String { "TODO" }
    var valueString: String { "TODO" }
    
    
    var value: [any MakeableView]
    var axis: AxisValue
    
    init(value: [any MakeableView], axis: AxisValue) {
        self.value = value
        self.axis = axis
    }
    
    static func makeDefault() -> MakeableArray {
        .init(
            value: [any MakeableView](),
            axis: .init(value: .vertical)
        )
    }
    
    func add(_ other: VariableValue) throws -> VariableValue {
        fatalError()
    }
    
    func value(with variables: Variables) async throws -> VariableValue {
        var newViews: [any MakeableView] = []
        
        for view in value {
            newViews.append(try await view.value(with: variables))
        }
        
        return MakeableArray(
            value: newViews,
            axis: try await axis.value(with: variables)
        )
    }
    
    
    func editView(title: String, onUpdate: @escaping (MakeableArray) -> Void) -> AnyView {
        VStack {
            axis.editView(title: "\(title)[axis]") {
                self.axis = $0
                onUpdate(self)
            }
            MakeableStackView(
                isRunning: false,
                showEditControls: true,
                stack: .init(content: self, padding: .init(value: 5)),
                onContentUpdate: {
                    onUpdate($0.content)
                },
                onRuntimeUpdate: { }, 
                error: .constant(nil)
            )
        }.any
    }
}

extension MakeableArray: Codable {
    enum CodingKeys: String, CodingKey {
        case value
        case axis
    }
    convenience init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        self.init(
            value: try container.decode(CodableMakeableList.self, forKey: .value).elements.map { $0.value },
            axis: try container.decode(AxisValue.self, forKey: .axis)
        )
    }
    
    func encode(to encoder: Encoder) throws {
        var container = encoder.container(keyedBy: CodingKeys.self)
        try container.encode(CodableMakeableList(elements: value), forKey: .value)
        try container.encode(axis, forKey: .axis)
    }
    
    func inserting(_ value: Element, at index: Int) -> Self {
        .init(value: self.value.inserting(value, at: index), axis: axis)
    }
    
    func removing(at index: Int) -> Self {
        .init(value: value.removing(at: index), axis: axis)
    }
}

extension MakeableArray: Sequence {
    func makeIterator() -> IndexingIterator<[any MakeableView]> {
        IndexingIterator(_elements: value)
    }
}

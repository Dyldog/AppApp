//
//  StepArray.swift
//  AppApp
//
//  Created by Dylan Elliott on 24/11/2023.
//

import SwiftUI

final class StepArray: Codable, PrimitiveEditableVariableValue {
    
    static var type: VariableType { .list }
    static var defaultValue: [any StepType] { .init() }
    
    var value: [any StepType]
    
    init(value: [any StepType]) {
        self.value = value
    }
    
    init(from decoder: Decoder) throws {
        let container = try decoder.singleValueContainer()
        self.value = try container.decode(CodableStepList.self).values
    }
    
    func add(_ other: VariableValue) throws -> VariableValue {
        fatalError()
    }
    
    var protoString: String { value.map { $0.protoString }.joined(separator: ", ") }
    
    var valueString: String { value.map { $0.protoString }.joined(separator: ", ") }
    
    func value(with variables: Binding<Variables>) async throws -> VariableValue? {
        fatalError()
    }
    
    func editView(onUpdate: @escaping (StepArray) -> Void) -> AnyView {
        return HStack {
            Text(protoString)
                .fixedSize()
            SheetButton(title: {
                Text("Edit")
            }) {
                ActionListView(steps: self.value, onUpdate: {
                    onUpdate(.init(value: $0))
                })
            }
        }.any
    }
    
    
    func encode(to encoder: Encoder) throws {
        var container = encoder.singleValueContainer()
        try container.encode(CodableStepList(steps: value))
    }
}

extension StepArray: Sequence {
    struct Iterator: IteratorProtocol {
        var index: Int = 0
        let values: [any StepType]
        mutating func next() -> (any StepType)? {
            let model = values[safe: index]
            index += 1
            return model
        }
    }
    
    func makeIterator() -> Iterator {
        .init(values: value)
    }
}

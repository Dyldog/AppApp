//
//  StepArray.swift
//  AppApp
//
//  Created by Dylan Elliott on 24/11/2023.
//

import SwiftUI

struct StepArray: Codable, VariableValue {
    
    static var type: VariableType { .list }
    
    let values: [any StepType]
    
    init(values: [any StepType]) {
        self.values = values
    }
    
    init(from decoder: Decoder) throws {
        let container = try decoder.singleValueContainer()
        self.values = try container.decode(CodableStepList.self).values
    }
    
    func add(_ other: VariableValue) throws -> VariableValue {
        try values.add(other)
    }
    
    var protoString: String { values.protoString }
    
    var valueString: String { values.valueString }
    
    func value(with variables: Binding<Variables>) async throws -> VariableValue? {
        try await values.value(with: variables)
    }
    
    func editView(title: String, onUpdate: @escaping (StepArray) -> Void) -> AnyView {
        values.editView(title: title, onUpdate: {
            onUpdate(.init(values: $0))
        })
    }
    
    
    func encode(to encoder: Encoder) throws {
        var container = encoder.singleValueContainer()
        try container.encode(CodableStepList(steps: values))
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
        .init(values: values)
    }
}

//
//  ActionValue.swift
//  AppApp
//
//  Created by Dylan Elliott on 21/11/2023.
//

import SwiftUI

final class ActionValue: VariableValue, ObservableObject {
    
    static var type: VariableType { .action }
    
    @Published var steps: [any StepType]
    var protoString: String { steps.protoString }
    
    init(steps: [any StepType]) {
        self.steps = steps
    }
    
    var valueString: String { steps.map { $0.protoString }.joined(separator: "\n") }
    
    func value(with variables: Binding<Variables>) async throws -> VariableValue? {
        for step in steps {
            try await step.run(with: variables)
        }
        
        return variables.wrappedValue.value(for: "$0")
    }
    
    func add(_ other: VariableValue) throws -> VariableValue {
        fatalError("TODO")
    }
    
    func editView(title: String, onUpdate: @escaping (ActionValue) -> Void) -> AnyView {
        HStack {
            Text(protoString)
            SheetButton(title: { Text(title) }) {
                ActionListView(steps: self.steps) {
                    self.steps = $0
                    onUpdate(self)
                }
            }
        }.any
    }
}

extension ActionValue: Codable {
    enum CodingKeys: String, CodingKey {
        case steps
    }
    
    convenience init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        self.init(steps: try container.decode(CodableStepList.self, forKey: .steps).values)
    }
    
    func encode(to encoder: Encoder) throws {
        var container = encoder.container(keyedBy: CodingKeys.self)
        try container.encode(CodableStepList(steps: steps), forKey: .steps)
    }
}

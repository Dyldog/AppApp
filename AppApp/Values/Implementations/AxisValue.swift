//
//  AxisValue.swift
//  AppApp
//
//  Created by Dylan Elliott on 27/11/2023.
//

import SwiftUI

extension Axis: Codable { }

final class AxisValue: PrimitiveEditableVariableValue, Codable {
    static var type: VariableType { .axis }
    static var defaultValue: Axis = .vertical
    
    var protoString: String { "AXIS" }
    var valueString: String { value.description }
    
    var value: Axis
    
    init(value: Axis) {
        self.value = value
    }
    
    func value(with variables: Variables) async throws -> VariableValue? {
        self
    }
    
    func editView(onUpdate: @escaping (AxisValue) -> Void) -> AnyView {
        Picker("", selection: .init(get: {
            self.value
        }, set: { new in
            self.value = new
            onUpdate(self)
        })) {
            ForEach(Axis.allCases) {
                Text($0.description).tag($0)
            }
        }.pickerStyle(.menu).any
    }
    
    
    
    func add(_ other: VariableValue) throws -> VariableValue {
        throw VariableValueError.variableCannotPerformOperation(.axis, "add")
    }
}

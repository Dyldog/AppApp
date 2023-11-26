//
//  Bool+VariableValue.swift
//  AppApp
//
//  Created by Dylan Elliott on 24/11/2023.
//

import SwiftUI

final class BoolValue: PrimitiveEditableVariableValue, Codable {
    
    enum Properties: String, PrimitiveViewProperty {
        case value
        
        var defaultValue: Any {
            switch self {
            case .value: return false
            }
        }
    }
    
    static var type: VariableType { .boolean }
    
    var value: Bool
    
    init(value: Bool) {
        self.value = value
    }
    
    func add(_ other: VariableValue) throws -> VariableValue {
        throw VariableValueError.variableCannotPerformOperation(.boolean, "add")
    }
    
    var protoString: String { "BOOL" }
    
    var valueString: String { self.value ? "true" : "false" }
    
    func value(with variables: Binding<Variables>) async throws -> VariableValue? {
        self
    }
    
    func editView(onUpdate: @escaping (BoolValue) -> Void) -> AnyView {
        Toggle("", isOn: .init(get: {
            self.value
        }, set: {
            onUpdate(.init(value: $0))
        })).any
    }
    
    static func make(factory: (Properties) -> Any) -> BoolValue {
        .init(value: factory(.value) as! Bool)
    }
    
    func value(for property: Properties) -> Any? {
        switch property {
        case .value: return value
        }
    }
    
    func set(_ value: Any, for property: Properties) {
        switch property {
        case .value: self.value = value as! Bool
        }
    }
}

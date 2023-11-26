//
//  Int+VariableValue.swift
//  AppApp
//
//  Created by Dylan Elliott on 21/11/2023.
//

import SwiftUI

final class IntValue: PrimitiveEditableVariableValue, Codable {
    
    static var type: VariableType { .int }
    var value: Int
    static var defaultValue: Int = 69
    
    init(value: Int) {
        self.value = value
    }
    
    func editView(onUpdate: @escaping (IntValue) -> Void) -> AnyView {
        TextField("", text: .init(get: {
            self.protoString.components(separatedBy: .decimalDigits.inverted).joined()
        }, set: {
            onUpdate(.init(value: Int($0) ?? 0))
        })).any
    }
    
    func add(_ other: VariableValue) throws -> VariableValue {
        guard let other = other as? IntValue else { throw VariableValueError.wrongTypeForOperation }
        return IntValue(value: self.value + other.value)
    }
    
    var protoString: String { "\(value)" }
    
    var valueString: String { "\(value)"}
    
    func value(with variables: Binding<Variables>) throws -> VariableValue? {
        self
    }
}

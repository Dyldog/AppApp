//
//  Int+VariableValue.swift
//  AppApp
//
//  Created by Dylan Elliott on 21/11/2023.
//

import SwiftUI

extension Int: VariableValue {
    static var type: VariableType { .int }
    
    func editView(title: String, onUpdate: @escaping (Int) -> Void) -> AnyView {
        TextField("", text: .init(get: {
            self.protoString.components(separatedBy: .decimalDigits.inverted).joined()
        }, set: {
            onUpdate(Int($0) ?? 0)
        })).any
    }
    
    func add(_ other: VariableValue) throws -> VariableValue {
        guard let other = other as? Int else { throw VariableValueError.wrongTypeForOperation }
        return self + other
    }
    
    var protoString: String { "\(self)" }
    
    var valueString: String { "\(self)"}
    
    func value(with variables: inout Variables) throws -> VariableValue? {
        self
    }
}

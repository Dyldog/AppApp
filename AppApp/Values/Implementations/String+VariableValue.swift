//
//  String+VariableValue.swift
//  AppApp
//
//  Created by Dylan Elliott on 21/11/2023.
//

import SwiftUI

extension String: VariableValue {
    static var type: VariableType { .string }
    
    func add(_ other: VariableValue) throws -> VariableValue {
        guard let other = other as? String else { throw VariableValueError.wrongTypeForOperation }
        return self + other
    }
    
    var protoString: String { self }
    func string(with variables: inout Variables) -> String { protoString }
    
    func editView(title: String, onUpdate: @escaping (Self) -> Void) -> AnyView {
        TextField("", text: .init(get: {
            self
        }, set: {
            onUpdate($0)
        })).any
    }
}

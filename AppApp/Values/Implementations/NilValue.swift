//
//  NilValue.swift
//  AppApp
//
//  Created by Dylan Elliott on 28/11/2023.
//

import SwiftUI
import Armstrong

// sourcery: variableTypeName = "`nil`"
final class NilValue: EditableVariableValue {
    
    static var type: VariableType { .nil }
    
    var protoString: String { "NIL" }
    var valueString: String { protoString }
    
    init() {
    }
    
    static func makeDefault() -> NilValue {
        .init()
    }
    
    func editView(title: String, onUpdate: @escaping (NilValue) -> Void) -> AnyView {
        Text(protoString).any
    }
    
    func add(_ other: VariableValue) throws -> VariableValue {
        throw VariableValueError.variableCannotPerformOperation(.nil, "add")
    }
    
    func value(with variables: Variables) async throws -> VariableValue {
        self
    }
}

extension NilValue: CodeRepresentable {
    var codeRepresentation: String { "nil" }
}

//
//  String+VariableValue.swift
//  AppApp
//
//  Created by Dylan Elliott on 21/11/2023.
//

import SwiftUI

//extension String: VariableValue {
//    static var type: VariableType { .string }
//    
//    func add(_ other: VariableValue) throws -> VariableValue {
//        guard let other = other as? String else { throw VariableValueError.wrongTypeForOperation }
//        return self + other
//    }
//    
//    var protoString: String { self }
//    var valueString: String { self }
//    func value(with variables: inout Variables) throws -> VariableValue? { self }
//    
//    func editView(title: String, onUpdate: @escaping (Self) -> Void) -> AnyView {
//        TextField("", text: .init(get: {
//            self
//        }, set: {
//            onUpdate($0)
//        })).any
//    }
//}

final class StringValue: VariableValue {
    static var type: VariableType { .string }
    var value: String
    
    init(value: String) {
        self.value = value
    }
    
    func add(_ other: VariableValue) throws -> VariableValue {
        return StringValue(value: value + other.valueString)
    }
    
    var protoString: String { value }
    var valueString: String { value }
    func value(with variables: inout Variables) throws -> VariableValue? { self }
    
    func editView(title: String, onUpdate: @escaping (StringValue) -> Void) -> AnyView {
        TextField("", text: .init(get: {
            self.value
        }, set: {
            self.value = $0
            onUpdate(self)
        })).any
    }
}

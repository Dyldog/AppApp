//
//  PrintVarStep.swift
//  AppApp
//
//  Created by Dylan Elliott on 21/11/2023.
//

import SwiftUI

final class PrintVarStep: Step, Codable {
    static var type: VariableType { fatalError() }

    static var title: String { "Print variable" }
    var varName: Value
    
    var protoString: String { "{ print($\(varName)) }"}
    var valueString: String { protoString }
    
    required init(varName: Value) {
        self.varName = varName
    }
    
    func run(with variables: Binding<Variables>) async throws {
        guard let nameValue = try await varName.value(with: variables) else {
            throw VariableValueError.valueNotFoundForVariable(varName.protoString)
        }
        print("\(varName): \(variables.wrappedValue.value(for: nameValue.valueString) as Any)")
    }
    
    static func defaultValue(for property: Properties) -> Any {
        switch property {
        case .varName: return Value(value: Variable(value: StringValue(value: "$0")))
        }
    }
    
    func add(_ other: VariableValue) throws -> VariableValue {
        fatalError()
    }
    
    func value(with variables: Binding<Variables>) async throws -> VariableValue? {
        self
    }
}

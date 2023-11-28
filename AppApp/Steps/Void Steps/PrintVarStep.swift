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
    
    var protoString: String { "{ print($\(varName.protoString)) }"}
    var valueString: String { "{ print($\(varName.valueString)) }"}
    
    required init(varName: Value) {
        self.varName = varName
    }
    
    func run(with variables: Variables) async throws {
        let nameValue = try await varName.value(with: variables)
        print("\(varName): \(await variables.value(for: nameValue.valueString) as Any)")
    }
    
    static func defaultValue(for property: Properties) -> any EditableVariableValue {
        switch property {
        case .varName: return Value(value: Variable(value: StringValue(value: "$0")))
        }
    }
}

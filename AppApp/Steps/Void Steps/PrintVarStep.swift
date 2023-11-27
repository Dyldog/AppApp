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
    
    required init(varName: Value) {
        self.varName = varName
    }
    
    func run(with variables: Variables) async throws {
        guard let nameValue = try await varName.value(with: variables) else {
            throw VariableValueError.valueNotFoundForVariable(varName.protoString)
        }
        print("\(varName): \(await variables.value(for: nameValue.valueString) as Any)")
    }
    
    static func defaultValue(for property: Properties) -> Any {
        switch property {
        case .varName: return Value(value: Variable(value: StringValue(value: "$0")))
        }
    }
}

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
    var varName: AnyValue
    
    var protoString: String { "{ print($\(varName.protoString)) }"}
    var valueString: String { "{ print($\(varName.valueString)) }"}
    
    required init(varName: AnyValue) {
        self.varName = varName
    }
    
    func run(with variables: Variables) async throws {
        let value = try await varName.value(with: variables)
        print("\(varName.valueString): \(value.valueString)")
    }
    
    static func defaultValue(for property: Properties) -> any EditableVariableValue {
        switch property {
        case .varName: return AnyValue(value: Variable(value: StringValue(value: "$0")))
        }
    }
}

extension PrintVarStep: CodeRepresentable {
    var codeRepresentation: String {
        "print(\(varName.codeRepresentation)"
    }
}

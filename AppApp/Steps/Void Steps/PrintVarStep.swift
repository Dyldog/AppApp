//
//  PrintVarStep.swift
//  AppApp
//
//  Created by Dylan Elliott on 21/11/2023.
//

import SwiftUI

final class PrintVarStep: Step, Codable {
    static var title: String { "Print variable" }
    var varName: Value
    
    required init(varName: Value) {
        self.varName = varName
    }
    
    var protoString: String { "{ print($\(varName)) }"}
    
    func run(with variables: Binding<Variables>) async throws {
        guard let nameValue = try await varName.value(with: variables) else {
            throw VariableValueError.valueNotFoundForVariable(varName.protoString)
        }
        print("\(varName): \(variables.wrappedValue.value(for: nameValue.valueString) as Any)")
    }
    
    static func make(factory: (Properties) -> Any) -> Self {
        .init(
            varName: factory(.name) as! Value
        )
    }
    
    func value(for property: Properties) -> Any? {
        switch property {
        case .name: varName
        }
    }
    
    func set(_ value: Any, for property: Properties) {
        switch property {
        case .name: varName = value as! Value
        }
    }
    
    enum Properties: String, ViewProperty {
        case name
        
        var defaultValue: Any {
            switch self {
            case .name: return StringValue(value: "Text")
            }
        }
    }
}

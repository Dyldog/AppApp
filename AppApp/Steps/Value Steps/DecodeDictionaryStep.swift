//
//  DecodeDictionaryStep.swift
//  AppApp
//
//  Created by Dylan Elliott on 21/11/2023.
//

import SwiftUI

final class DecodeDictionaryStep: ValueStep {
    static var title: String { "Decode a dictionary from JSON" }
    var value: AnyValue
    
    var protoString: String { "{ DECODE($\(value.protoString)) }" }
    var valueString: String { "{ DECODE($\(value.valueString)) }" }
    
    init(value: AnyValue) {
        self.value = value
    }
    
    static func defaultValue(for property: Properties) -> any EditableVariableValue {
        switch property {
        case .value: return AnyValue(value: Variable(value: StringValue(value: "$0")))
        }
    }
    
    func run(with variables: Variables) async throws -> VariableValue {
        let value = try await value.value(with: variables)
        
        return DictionaryValue.from(try JSONSerialization.jsonObject(
            with: value.valueString.data(using: .utf8)!,
            options: []
        ) as! [String: Any])
    }
}

extension DecodeDictionaryStep: CodeRepresentable {
    var codeRepresentation: String {
        "try! JSONSerialization.jsonObject(with: \(value.codeRepresentation).data(using: .utf8)!, options: []) as! [String: Any]"
    }
}

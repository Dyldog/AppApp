//
//  DecodeDictionaryStep.swift
//  AppApp
//
//  Created by Dylan Elliott on 21/11/2023.
//

import SwiftUI
import Armstrong

final class DecodeArrayStep: ValueStep {
    static var title: String { "Decode an array from JSON" }
    var value: TypedValue<IntValue>
    
    var protoString: String { "{ DECODE($\(value.protoString)) }" }
    var valueString: String { "{ DECODE($\(value.valueString)) }" }
    
    init(value: TypedValue<IntValue>) {
        self.value = value
    }
    
    static func defaultValue(for property: Properties) -> any EditableVariableValue {
        switch property {
        case .value: return TypedValue<IntValue>.variable(.named("$0"))
        }
    }
    
    func run(with variables: Variables) async throws -> VariableValue {
        let value = try await value.value(with: variables)
        return ArrayValue.from(try JSONSerialization.jsonObject(
            with: value.valueString.data(using: .utf8)!,
            options: []
        ) as! [Any])
    }
}

extension DecodeArrayStep: CodeRepresentable {
    var codeRepresentation: String {
        "try! JSONSerialization.jsonObject(with: \(value.codeRepresentation).data(using: .utf8)!, options: []) as! [String: Any]"
    }
}

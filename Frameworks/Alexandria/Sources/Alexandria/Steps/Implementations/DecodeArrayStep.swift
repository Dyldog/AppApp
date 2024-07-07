//
//  DecodeDictionaryStep.swift
//  AppApp
//
//  Created by Dylan Elliott on 21/11/2023.
//

import SwiftUI
import Armstrong

public final class DecodeArrayStep: ValueStep {
    
    public static let categories: [ValueCategory] = [.dataProcessing]
    public static var type: VariableType { .decodeArrayStep }
    public static var title: String { "Decode an array from JSON" }
    public var value: TypedValue<IntValue>
    
    public var protoString: String { "{ DECODE($\(value.protoString)) }" }
    public var valueString: String { "{ DECODE($\(value.valueString)) }" }
    
    public init(value: TypedValue<IntValue>) {
        self.value = value
    }
    
    public static func defaultValue(for property: Properties) -> any EditableVariableValue {
        switch property {
        case .value: return TypedValue<IntValue>.variable(.named("$0"))
        }
    }
    
    public func run(with variables: Variables, and scope: Scope) throws -> VariableValue {
        let value = try value.value(with: variables, and: scope)
        return ArrayValue.from(try JSONSerialization.jsonObject(
            with: value.valueString.data(using: .utf8)!,
            options: []
        ) as! [Any])
    }
}

extension DecodeArrayStep: CodeRepresentable {
    public var codeRepresentation: String {
        "try! JSONSerialization.jsonObject(with: \(value.codeRepresentation).data(using: .utf8)!, options: []) as! [String: Any]"
    }
}

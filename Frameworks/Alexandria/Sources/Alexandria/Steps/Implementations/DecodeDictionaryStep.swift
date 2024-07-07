//
//  DecodeDictionaryStep.swift
//  AppApp
//
//  Created by Dylan Elliott on 21/11/2023.
//

import SwiftUI
import Armstrong

public final class DecodeDictionaryStep: ValueStep {
    
    public static let categories: [ValueCategory] = [.dataProcessing]
    public static var type: VariableType { .decodeDictionaryStep }
    public static var title: String { "Decode a dictionary from JSON" }
    public var value: AnyValue
    
    public var protoString: String { "{ DECODE($\(value.protoString)) }" }
    public var valueString: String { "{ DECODE($\(value.valueString)) }" }
    
    public init(value: AnyValue) {
        self.value = value
    }
    
    public static func defaultValue(for property: Properties) -> any EditableVariableValue {
        switch property {
        case .value: return AnyValue(value: Variable(value: StringValue(value: "$0").any))
        }
    }
    
    public func run(with variables: Variables, and scope: Scope) throws -> VariableValue {
        let value = try value.value(with: variables, and: scope)
        
        return DictionaryValue.from(try JSONSerialization.jsonObject(
            with: value.valueString.data(using: .utf8)!,
            options: []
        ) as! [String: Any])
    }
}

extension DecodeDictionaryStep: CodeRepresentable {
    public var codeRepresentation: String {
        "try! JSONSerialization.jsonObject(with: \(value.codeRepresentation).data(using: .utf8)!, options: []) as! [String: Any]"
    }
}

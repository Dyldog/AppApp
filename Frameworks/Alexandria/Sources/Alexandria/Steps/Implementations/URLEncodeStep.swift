//
//  URLEncodeStep.swift
//  AppApp
//
//  Created by Dylan Elliott on 10/12/2023.
//

import Foundation
import Armstrong

public final class URLEncodeStep: ValueStep {
    
    public static let categories: [ValueCategory] = [.dataProcessing]
    public static var type: VariableType { .uRLEncodeStep }
    public static var title: String { "URL encode a string" }
    
    public var value: AnyValue
    
    public var protoString: String { "\(value.protoString).URLEncoded" }
    public var valueString: String { "\(value.valueString).URLEncoded" }
    
    public init(value: AnyValue) {
        self.value = value
    }
    
    public static func defaultValue(for property: Properties) -> any EditableVariableValue {
        switch property {
        case .value: return AnyValue.string("1 2 3")
        }
    }

    public func run(with variables: Variables, and scope: Scope) throws -> VariableValue {
        let value: StringValue = try value.value(with: variables, and: scope)
        return StringValue(value: value.value.addingPercentEncoding(withAllowedCharacters: .urlQueryAllowed)!)
    }
}

extension URLEncodeStep: CodeRepresentable {
    public var codeRepresentation: String {
        "\(value.codeRepresentation).addingPercentEncoding(withAllowedCharacters: .urlQueryAllowed)!"
    }
}


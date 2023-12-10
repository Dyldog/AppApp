//
//  URLEncodeStep.swift
//  AppApp
//
//  Created by Dylan Elliott on 10/12/2023.
//

import Foundation
import Armstrong

final class URLEncodeStep: ValueStep {
    static var title: String { "URL encode a string" }
    
    var value: AnyValue
    
    var protoString: String { "\(value.protoString).URLEncoded" }
    var valueString: String { "\(value.valueString).URLEncoded" }
    
    init(value: AnyValue) {
        self.value = value
    }
    
    static func defaultValue(for property: Properties) -> any EditableVariableValue {
        switch property {
        case .value: return AnyValue.string("1 2 3")
        }
    }

    func run(with variables: Variables) async throws -> VariableValue {
        let value: StringValue = try await value.value(with: variables)
        return StringValue(value: value.value.addingPercentEncoding(withAllowedCharacters: .urlQueryAllowed)!)
    }
}

extension URLEncodeStep: CodeRepresentable {
    var codeRepresentation: String {
        "\(value.codeRepresentation).addingPercentEncoding(withAllowedCharacters: .urlQueryAllowed)!"
    }
}


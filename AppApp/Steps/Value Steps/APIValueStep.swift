//
//  APIValueStep.swift
//  AppApp
//
//  Created by Dylan Elliott on 21/11/2023.
//

import SwiftUI
import Armstrong

final class APIValueStep: ValueStep {
    static var title: String { "Get value from API" }
    var url: AnyValue
    
    var protoString: String { "{ $\(url.protoString) }" }
    var valueString: String { "{ $\(url.valueString) }" }
    
    init(url: AnyValue) {
        self.url = url
    }
    
    static func defaultValue(for property: Properties) -> any EditableVariableValue {
        switch property {
        case .url: return AnyValue(value: StringValue(value: "https://swapi.dev/api/people/1"))
        }
    }
    
    func run(with variables: Variables) async throws -> VariableValue {
        let value = try await url.value(with: variables)
        
        guard
            let url = URL(string: value.valueString)
        else { throw VariableValueError.wrongTypeForOperation }
        
        return StringValue(value: try String(contentsOf: url))
    }
}

extension APIValueStep: CodeRepresentable {
    var codeRepresentation: String {
        "try! String(contentsOf: URL(string: \(url.codeRepresentation))!)"
    }
}

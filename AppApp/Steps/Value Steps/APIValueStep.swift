//
//  APIValueStep.swift
//  AppApp
//
//  Created by Dylan Elliott on 21/11/2023.
//

import SwiftUI

final class APIValueStep: ValueStep {
    static var title: String { "Get value from API" }
    var url: Value
    
    var protoString: String { "{ $\(url.valueString) }" }
    
    init(url: Value) {
        self.url = url
    }
    
    static func defaultValue(for property: Properties) -> Any {
        switch property {
        case .url: return Value(value: StringValue(value: "https://swapi.dev/api/people/1"))
        }
    }
    
    func run(with variables: Binding<Variables>) async throws -> VariableValue {
        guard
            let value = try await url.value(with: variables),
            let url = URL(string: value.valueString)
        else { throw VariableValueError.wrongTypeForOperation }
        
        return StringValue(value: try String(contentsOf: url))
    }
}

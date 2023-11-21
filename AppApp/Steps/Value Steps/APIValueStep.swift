//
//  APIValueStep.swift
//  AppApp
//
//  Created by Dylan Elliott on 21/11/2023.
//

import Foundation

final class  APIValueStep: ValueStep {
    static var title: String { "Get value from API" }
    @Published var url: Value
    
    init(url: Value) {
        self.url = url
    }
    
    var protoString: String { "{ $\(url) }" }
    
    func run(with variables: inout Variables) throws -> VariableValue {
        guard
            let value = try url.value(with: &variables),
            let url = URL(string: value.valueString)
        else { throw VariableValueError.wrongTypeForOperation }
        
        return StringValue(value: try String(contentsOf: url))
    }
    
    static func make(factory: (Properties) -> VariableValue) -> APIValueStep {
        return APIValueStep(
            url: factory(.url) as! Value
        )
    }
    
    func value(for property: Properties) -> (VariableValue)? {
        switch property {
        case .url: return url
        }
    }
    
    func set(_ value: VariableValue, for property: Properties) {
        switch property {
        case .url: self.url = value as! Value
        }
    }
    
    enum Properties: String, ViewProperty {
        case url
        
        var defaultValue: VariableValue {
            switch self {
            case .url: return StringValue(value: "https://google.com")
            }
        }
    }
}

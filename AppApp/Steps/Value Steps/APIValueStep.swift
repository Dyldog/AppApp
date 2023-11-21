//
//  APIValueStep.swift
//  AppApp
//
//  Created by Dylan Elliott on 21/11/2023.
//

import Foundation

final class  APIValueStep: ValueStep {
    static var title: String { "Get value from API" }
    @Published var url: VariableValue
    
    init(url: VariableValue) {
        self.url = url
    }
    
    var protoString: String { "{ $\(url) }" }
    
    func run(with variables: inout Variables) throws -> VariableValue {
        guard let url = URL(string: try url.string(with: &variables))
        else { throw VariableValueError.wrongTypeForOperation }
        
        return try String(contentsOf: url)
    }
    
    static func make(factory: (Properties) -> VariableValue) -> APIValueStep {
        return APIValueStep(
            url: factory(.url)
        )
    }
    
    func value(for property: Properties) -> (VariableValue)? {
        switch property {
        case .url: return url
        }
    }
    
    func set(_ value: VariableValue, for property: Properties) {
        switch property {
        case .url: self.url = value as! VariableType
        }
    }
    
    enum Properties: String, ViewProperty {
        case url
        
        var defaultValue: VariableValue {
            switch self {
            case .url: return "https://google.com"
            }
        }
    }
}

//
//  ValueStep.swift
//  AppApp
//
//  Created by Dylan Elliott on 21/11/2023.
//

import Foundation

protocol ValueStep: StepType {
    func run(with variables: inout Variables) throws -> VariableValue
}


final class StaticValueStep: ValueStep {
    static var title: String { "Static value" }
    @Published var value: Value
    @Published var type: VariableType
    
    init(value: Value, type: VariableType) {
        self.value = value
        self.type = type
    }
    
    var protoString: String { value.protoString }
    
    func run(with variables: inout Variables) throws -> VariableValue {
        guard let typedValue = type.value(from: try value.string(with: &variables))
        else { throw VariableValueError.wrongTypeForOperation }
        return typedValue
    }
    
    static func make(factory: (Properties) -> VariableValue) -> StaticValueStep {
        return StaticValueStep(
            value: factory(.value) as! Value,
            type: factory(.type) as! VariableType
        )
    }
    
    func value(for property: Properties) -> (VariableValue)? {
        switch property {
        case .value: return value
        case .type: return type
        }
    }
    
    func set(_ value: VariableValue, for property: Properties) {
        switch property {
        case .value: self.value = value as! Value
        case .type: self.type = value as! VariableType
        }
    }
    
    enum Properties: String, ViewProperty {
        case value
        case type
        
        var defaultValue: VariableValue {
            switch self {
            case .value: return "TITLE"
            case .type: return VariableType.string
            }
        }
    }
}

final class VariableStep: ValueStep {
    static var title: String { "Get variable" }
    @Published var varName: String
    @Published var type: VariableType
    
    init(varName: String, type: VariableType) {
        self.varName = varName
        self.type = type
    }
    
    var protoString: String { "{ $\(varName) }" }
    
    func run(with variables: inout Variables) throws -> VariableValue {
        guard let value = variables.value(for: varName)
        else { throw VariableValueError.valueNotFoundForVariable }
        
        guard let typedValue = type.value(from: try value.string(with: &variables))
        else { throw VariableValueError.wrongTypeForOperation }
        
        
        return typedValue
    }
    
    static func make(factory: (Properties) -> VariableValue) -> VariableStep {
        return VariableStep(
            varName: factory(.varName).protoString,
            type: factory(.type) as! VariableType
        )
    }
    
    func value(for property: Properties) -> (VariableValue)? {
        switch property {
        case .varName: return varName
        case .type: return type
        }
    }
    
    func set(_ value: VariableValue, for property: Properties) {
        switch property {
        case .varName: self.varName = value.protoString
        case .type: self.type = value as! VariableType
        }
    }
    
    enum Properties: String, ViewProperty {
        case varName
        case type
        
        var defaultValue: VariableValue {
            switch self {
            case .varName: return "VAR"
            case .type: return VariableType.string
            }
        }
    }
}

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

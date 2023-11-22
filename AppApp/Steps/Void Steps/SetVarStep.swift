//
//  SetVarStep.swift
//  AppApp
//
//  Created by Dylan Elliott on 21/11/2023.
//

import Foundation

final class SetVarStep: Step, ObservableObject {
    
    static var title: String { "Set variable" }
    @Published var varName: Value
    @Published var value: Value
    
    required init(varName: Value, value: Value) {
        self.varName = varName
        self.value = value
//        self.type = type
    }
    
    var protoString: String { "{ $\(varName.protoString) = \(value.protoString) }" }
    
    func run(with variables: inout Variables) throws {
        guard
            let varValue = try varName.value(with: &variables),
            let valueValue = try value.value(with: &variables)
        else { throw VariableValueError.valueNotFoundForVariable }
            
        variables.set(valueValue, for: varValue.valueString)
    }
    
    static func make(factory: (Properties) -> VariableValue) -> Self {
        .init(
            varName: factory(.name) as! Value,
            value: factory(.value) as! Value
//            type: factory(.type) as! VariableType
        )
    }
    
    func value(for property: Properties) -> (VariableValue)? {
        switch property {
        case .name: varName
        case .value: value
//        case .type: type
        }
    }
        
    func set(_ value: VariableValue, for property: Properties) {
        objectWillChange.send()
        switch property {
        case .name: varName = value as! Value
        case .value: self.value = value as! Value
//        case .type: type = value as! VariableType
        }
    }
    
    enum Properties: String, ViewProperty {
        case name
        case value
//        case type
        
        var defaultValue: VariableValue {
            switch self {
            case .name: return Variable(name: "VAR" as Value)
            case .value: return Variable(name: "$0" as Value)
//            case .type: return VariableType.string
            }
        }
    }
}

extension SetVarStep: Codable {
    enum CodingKeys: String, CodingKey {
        case varName
        case value
    }
    
    convenience init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        self.init(
            varName: try container.decode(Value.self, forKey: .varName),
            value: try container.decode(Value.self, forKey: .value)
        )
    }
    
    func encode(to encoder: Encoder) throws {
        var container = encoder.container(keyedBy: CodingKeys.self)
        try container.encode(varName, forKey: .varName)
        try container.encode(value, forKey: .value)
    }
}

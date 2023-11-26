//
//  String+VariableValue.swift
//  AppApp
//
//  Created by Dylan Elliott on 21/11/2023.
//

import SwiftUI

//extension String: VariableValue {
//    static var type: VariableType { .string }
//    
//    func add(_ other: VariableValue) throws -> VariableValue {
//        guard let other = other as? String else { throw VariableValueError.wrongTypeForOperation }
//        return self + other
//    }
//    
//    var protoString: String { self }
//    var valueString: String { self }
//    func value(with variables: Binding<Variables>) throws -> VariableValue? { self }
//    
//    func editView(title: String, onUpdate: @escaping (Self) -> Void) -> AnyView {
//        TextField("", text: .init(get: {
//            self
//        }, set: {
//            onUpdate($0)
//        })).any
//    }
//}

final class StringValue: PrimitiveEditableVariableValue {
    
    enum Properties: String, PrimitiveViewProperty {
        case value
        
        var defaultValue: Any {
            switch self {
            case .value: return "TEXT"
            }
        }
    }
    
    static var type: VariableType { .string }
    var value: String
    
    init(value: String) {
        self.value = value
    }
    
    func add(_ other: VariableValue) throws -> VariableValue {
        return StringValue(value: value + other.valueString)
    }
    
    var protoString: String { value }
    var valueString: String { value }
    func value(with variables: Binding<Variables>) throws -> VariableValue? { self }
    
    func editView(onUpdate: @escaping (StringValue) -> Void) -> AnyView {
        TextField("", text: .init(get: {
            self.value
        }, set: {
            self.value = $0
            onUpdate(self)
        })).any
    }
    
    static func == (lhs: StringValue, rhs: StringValue) -> Bool {
        return lhs.value == rhs.value
    }
    
    static func make(factory: (Properties) -> Any) -> StringValue {
        .init(value: factory(.value) as! String)
    }
    
    func value(for property: Properties) -> Any? {
        switch property {
        case .value: return value
        }
    }
    
    func set(_ value: Any, for property: Properties) {
        switch property {
        case .value: self.value = value as! String
        }
    }
    
}

extension StringValue: Hashable {
    func hash(into hasher: inout Hasher) {
        hasher.combine(value)
    }
}

extension StringValue: Codable {
    enum CodingKeys: String, CodingKey {
        case value
    }
    
    convenience init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        self.init(value: try container.decode(String.self, forKey: .value))
    }
    
    func encode(to encoder: Encoder) throws {
        var container = encoder.container(keyedBy: CodingKeys.self)
        try container.encode(value, forKey: .value)
    }
}

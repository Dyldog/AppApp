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
//    func value(with variables: Variables) throws -> VariableValue { self }
//    
//    func editView(title: String, onUpdate: @escaping (Self) -> Void) -> AnyView {
//        TextField("", text: .init(get: {
//            self
//        }, set: {
//            onUpdate($0)
//        })).any
//    }
//}

final class StringValue: EditableVariableValue {
    
    static var type: VariableType { .string }
    var value: String
    
    init(value: String) {
        self.value = value
    }
    
    static func makeDefault() -> StringValue {
        .init(value: "TEXT")
    }
    
    func add(_ other: VariableValue) throws -> VariableValue {
        value = value + other.valueString
        return self
    }
    
    var protoString: String { value }
    var valueString: String { value }
    func value(with variables: Variables) throws -> VariableValue { self }
    
    func editView(title: String, onUpdate: @escaping (StringValue) -> Void) -> AnyView {
        TextField("", text: .init(get: { [weak self] in
            self?.value ?? "ERROR666"
        }, set: { [weak self] in
            guard let self = self else { return }
            self.value = $0
            onUpdate(self)
        })).any
    }
    
    static func == (lhs: StringValue, rhs: StringValue) -> Bool {
        return lhs.value == rhs.value
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

extension StringValue: CodeRepresentable {
    var codeRepresentation: String {
        "\"\(value)\""
    }
}

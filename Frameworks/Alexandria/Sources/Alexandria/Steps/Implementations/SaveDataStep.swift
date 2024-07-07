//
//  File.swift
//  
//
//  Created by Dylan Elliott on 12/12/2023.
//

import Foundation
import Armstrong

public final class SaveDataStep: Step {
    
    public static let categories: [ValueCategory] = [.variables]
    public static var type: VariableType { .saveDataStep }
    public static var title: String { "Save data to device" }
    public var key: TypedValue<StringValue>
    public var data: AnyValue
    
    public var protoString: String { "SAVED[\(key.protoString)] = \(data.protoString)" }
    public var valueString: String { "SAVED[\(key.valueString)] = \(data.valueString)" }
    
    public init(key: TypedValue<StringValue>, data: AnyValue) {
        self.key = key
        self.data = data
    }
    
    public static func defaultValue(for property: Properties) -> any EditableVariableValue {
        switch property {
        case .key: return TypedValue.value(StringValue(value: "KEY"))
        case .data: return StringValue(value: "DATA").any
        }
    }

    public func run(with variables: Variables, and scope: Scope) throws {
        let value: EditableVariableValue = try data.value(with: variables, and: scope)
         UserDefaults.appApp.set(
            CodableVariableValue(value: value).encoded(),
            forKey: try key.value(with: variables, and: scope).valueString
        )
    }
}

extension SaveDataStep: CodeRepresentable {
    public var codeRepresentation: String {
        "TODO"
    }
}

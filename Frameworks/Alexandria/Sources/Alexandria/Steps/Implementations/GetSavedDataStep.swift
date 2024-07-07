//
//  File.swift
//  
//
//  Created by Dylan Elliott on 12/12/2023.
//

import Foundation
import Armstrong

public final class GetSavedDataStep: ValueStep {
    
    public static let categories: [ValueCategory] = [.variables]
    public static var type: VariableType { .getSavedDataStep }
    public static var title: String { "Retrieve data saved to device" }
    public var key: TypedValue<StringValue>
    
    public var protoString: String { "SAVED[\(key.protoString)]" }
    public var valueString: String { "SAVED[\(key.valueString)]" }
    
    public init(key: TypedValue<StringValue>) {
        self.key = key
    }
    
    public static func defaultValue(for property: Properties) -> any EditableVariableValue {
        switch property {
        case .key: return TypedValue.value(StringValue(value: "KEY"))
        }
    }

    public func run(with variables: Variables, and scope: Scope) throws -> VariableValue {
        guard let data =  UserDefaults.appApp.data(
            forKey: try key.value(with: variables, and: scope).valueString
        ) else { return NilValue.makeDefault() }
        return try JSONDecoder().decode(CodableVariableValue.self, from: data).value
    }
}

extension GetSavedDataStep: CodeRepresentable {
    public var codeRepresentation: String {
        "TODO"
    }
}

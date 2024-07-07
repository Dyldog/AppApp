//
//  
//  GetCurrentDateStep.swift
//  
//
//  Created by Dylan Elliott on 22/12/2023.
//
//

import Foundation
import Armstrong

public final class GetCurrentDateStep: ValueStep {
    
    public static let categories: [ValueCategory] = [.dateSteps]
    public static var title: String { "Get the current date" }
    public static var type: VariableType { .getCurrentDateStep }
    
    init() { }
    
    public var protoString: String { "$CURRENT_DATE" }
    public var valueString: String { "$CURRENT_DATE" }
    
    public func run(with variables: Variables, and scope: Scope) throws -> VariableValue {
        DateValue(value: .now)
    }

    public static func defaultValue(for property: Properties) -> any EditableVariableValue { }
    
    public func add(_ other: VariableValue) throws -> VariableValue {
        fatalError()
    }
}

extension GetCurrentDateStep: CodeRepresentable {
    public var codeRepresentation: String {
        "TODO"
    }
}


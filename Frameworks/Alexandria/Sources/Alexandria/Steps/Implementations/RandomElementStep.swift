//
//  File.swift
//  
//
//  Created by Dylan Elliott on 3/1/2024.
//

import SwiftUI
import Armstrong

public final class  RandomElementStep: ValueStep {
    
    public static let categories: [ValueCategory] = [.containerSteps]
    public static var type: VariableType { .randomElementStep }
    public static var title: String { "Get a random element from a list" }
    
    public var array: TypedValue<ArrayValue>
    
    public init(array: TypedValue<ArrayValue>) {
        self.array = array
    }
    
    public var protoString: String { "\(array.protoString).random()" }
    public var valueString: String { "\(array.valueString).random()" }
    
    public static func defaultValue(for property: Properties) -> EditableVariableValue {
        switch property {
        case .array: return ArrayValue.makeDefault().typed
        }
    }
    
    public func run(with variables: Variables, and scope: Scope) throws -> VariableValue {
        let array: ArrayValue = try array.value(with: variables, and: scope)
        
        guard let element = array.elements.randomElement() else { throw VariableValueError.emptyCollectionFound }
        
        return element
    }
}

extension RandomElementStep: CodeRepresentable {
    public var codeRepresentation: String {
        "\(array.codeRepresentation).randomElement()"
    }
}



//
//  File.swift
//  
//
//  Created by Dylan Elliott on 14/12/2023.
//

import Foundation
import Armstrong

// sourcery: skipCodable
public final class MakeRangeStep: ValueStep {
    public static let categories: [ValueCategory] = [.numberSteps]
    public static var type: VariableType { .makeRangeStep }
    public static var title: String { "Create range of numbers" }
    
    public var start: any NumericValue
    public var end: any NumericValue
    public var step: any NumericValue
    
    public var protoString: String { "[\(start.protoString) ...\(step.protoString)... \(end.protoString)]" }
    public var valueString: String { "[\(start.protoString) ...\(step.protoString)... \(end.protoString)]" }

    init(start: any NumericValue, end: any NumericValue, step: any NumericValue) {
        self.start = start
        self.end = end
        self.step = step
    }
    
    public static func defaultValue(for property: Properties) -> any EditableVariableValue {
        switch property {
        case .start: return IntValue(value: 0)
        case .end: return IntValue(value: 10)
        case .step: return IntValue(value: 1)
        }
    }

    public func run(with variables: Variables, and scope: Scope) throws -> VariableValue {
        let start: any NumericValue = try start.value(with: variables, and: scope)
        let end: any NumericValue = try end.value(with: variables, and: scope)
        let step: any NumericValue = try step.value(with: variables, and: scope)
        
        func hasPassed(current: any NumericValue, step: any NumericValue, max: any NumericValue) -> Bool {
            let isPositive = (step.value.floatValue / abs(step.value.floatValue)) > 0
            
            if isPositive {
                return current.value.floatValue >= max.value.floatValue
            } else {
                return current.value.floatValue <= max.value.floatValue
            }
        }
        
        var current: any NumericValue = start
        var values: [any NumericValue] = [start]
        let next = { try current.perform(operation: .add, with: step) }
        
        while hasPassed(current: try next(), step: step, max: end) == false {
            values.append(try next())
            current = try next()
        }
        
        return ArrayValue(type: Swift.type(of: start).type, elements: values)
    }
}

extension MakeRangeStep: CodeRepresentable {
    public var codeRepresentation: String {
        "TODO"
    }
}

extension MakeRangeStep {
    enum CodingKeys: String, CodingKey {
        case start
        case end
        case step
    }
    public convenience init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        
        self.init(
            start: try container.decode(CodableVariableValue.self, forKey: .start).as((any NumericValue).self),
            end: try container.decode(CodableVariableValue.self, forKey: .end).as((any NumericValue).self),
            step: try container.decode(CodableVariableValue.self, forKey: .step).as((any NumericValue).self)
        )
    }
    
    public func encode(to encoder: Encoder) throws {
        var container = encoder.container(keyedBy: CodingKeys.self)
        try container.encode(CodableVariableValue(value: start), forKey: .start)
        try container.encode(CodableVariableValue(value: end), forKey: .end)
        try container.encode(CodableVariableValue(value: step), forKey: .step)
    }
}

extension CodableVariableValue {
    func `as`<T>(_ type: T.Type) throws -> T {
        guard let value = self.value as? T else {
            throw VariableValueError.wrongTypeForOperation
        }
        
        return value
    }
}

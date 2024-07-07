//
//  
//  AddDateComponentStep.swift
//  
//
//  Created by Dylan Elliott on 22/12/2023.
//
//

import Foundation
import Armstrong

public final class AddDateComponentStep: ValueStep {
    
    public static let categories: [ValueCategory] = [.dateSteps]
    public static var title: String { "Add date component to date" }
    public static var type: VariableType { .addDateComponentStep }
    
    var date: TypedValue<DateValue>
    var component: CalendarComponentValue
    var value: IntValue
    
    public init(date: TypedValue<DateValue>, component: CalendarComponentValue, value: IntValue) {
        self.date = date
        self.component = component
        self.value = value
    }
    
    public var protoString: String { "\(date.protoString).\(component.protoString) += \(value.protoString)" }
    public var valueString: String { "\(date.valueString).\(component.valueString) += \(value.valueString)" }
    
    public func run(with variables: Variables, and scope: Scope) throws -> VariableValue {
        let date: DateValue = try date.value(with: variables, and: scope)
        let newDate = Calendar.autoupdatingCurrent.date(byAdding: component.value, value: value.value, to: date.value)
        return newDate.map { DateValue(value: $0) } ?? NilValue()
    }

    public static func defaultValue(for property: Properties) -> any EditableVariableValue {
        switch property {
        case .date: return DateValue.makeDefault().typed
        case .component: return CalendarComponentValue(value: .hour)
        case .value: return IntValue.makeDefault()
        }
    }
    
    public func add(_ other: VariableValue) throws -> VariableValue {
        fatalError()
    }
}

extension AddDateComponentStep: CodeRepresentable {
    public var codeRepresentation: String {
        "TODO"
    }
}


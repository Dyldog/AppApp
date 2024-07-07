//
//  File.swift
//  
//
//  Created by Dylan Elliott on 18/12/2023.
//

import Foundation
import Armstrong

public final class GetDateComponentStep: ValueStep {
    
    public static let categories: [ValueCategory] = [.dateSteps]
    public static var title: String { "Get date component" }
    public static var type: VariableType { .getDateComponentStep }
    
    var component: CalendarComponentValue
    var date: TypedValue<DateValue>
    
    init(component: CalendarComponentValue, date: TypedValue<DateValue>) {
        self.component = component
        self.date = date
    }
    
    public var protoString: String { "\(date.protoString).\(component.protoString.uppercased())" }
    public var valueString: String { "\(date.valueString).\(component.valueString.uppercased())" }
    
    public func run(with variables: Variables, and scope: Scope) throws -> VariableValue {
        let date = try date.value.value(with: variables, and: scope)
        let value = Calendar.current.component(component.value, from: date.value)
        return IntValue(value: value)
    }

    public static func defaultValue(for property: Properties) -> any EditableVariableValue {
        switch property {
        case .date: return TypedValue.value(DateValue.makeDefault())
        case .component: return CalendarComponentValue(value: .weekOfMonth)
        }
    }
    
    public func add(_ other: VariableValue) throws -> VariableValue {
        fatalError()
    }
}

extension GetDateComponentStep: CodeRepresentable {
    public var codeRepresentation: String {
        "TODO"
    }
}


// Generated using Sourcery 2.0.2 — https://github.com/krzysztofzablocki/Sourcery
// DO NOT EDIT

import SwiftUI
import DylKit







public final class CalendarComponentValue: PrimitiveEditableVariableValue, Codable, Copying {

    public static let categories: [ValueCategory] = [.dates]
    public static var type: VariableType { .calendarComponent }
    public static var defaultValue: Calendar.Component { .defaultValue }
    public var value: Calendar.Component
    public init(value: Calendar.Component) {
        self.value = value
    }
    public static func makeDefault() -> CalendarComponentValue {
        .init(value: defaultValue)
    }
    public func add(_ other: VariableValue) throws -> VariableValue {
        throw VariableValueError.variableCannotPerformOperation(Self.type, "add")
    }
    public var protoString: String { "\(value.title)" }
    public var valueString: String { protoString }
    public func value(with variables: Variables, and scope: Scope) throws -> VariableValue {
        self
    }
    public func copy() -> CalendarComponentValue {
        .init(
            value: value
        )
    }
}

extension CalendarComponentValue: CodeRepresentable {
    public var codeRepresentation: String {
        value.codeRepresentation
    }
}

extension Calendar.Component: Copying {
    public func copy() -> Calendar.Component {
        return self
    }
}

extension VariableType {
    public static var calendarComponent: VariableType { .init(title: "CalendarComponent") } // Calendar.Component
}








// AddDateComponentStep

extension AddDateComponentStep: Copying {
    public func copy() -> AddDateComponentStep {
        return AddDateComponentStep(
                    date: date,
                    component: component,
                    value: value
        )
    }
}

extension AddDateComponentStep {
     public enum Properties: String, ViewProperty, CaseIterable {
        case date
        case component
        case value
        public var defaultValue: any EditableVariableValue {
            switch self {
            case .date: return AddDateComponentStep.defaultValue(for: .date)
            case .component: return AddDateComponentStep.defaultValue(for: .component)
            case .value: return AddDateComponentStep.defaultValue(for: .value)
            }
        }
    }
    public static func make(factory: (Properties) -> any EditableVariableValue) -> Self {
        .init(
            date: factory(.date) as! TypedValue<DateValue>,
            component: factory(.component) as! CalendarComponentValue,
            value: factory(.value) as! IntValue
        )
    }

    public static func makeDefault() -> Self {
        .init(
            date: Properties.date.defaultValue as! TypedValue<DateValue>,
            component: Properties.component.defaultValue as! CalendarComponentValue,
            value: Properties.value.defaultValue as! IntValue
        )
    }
    public func value(for property: Properties) -> any EditableVariableValue {
        switch property {
            case .date: return date
            case .component: return component
            case .value: return value
        }
    }

    public func set(_ value: Any, for property: Properties) {
        switch property {
            case .date: self.date = value as! TypedValue<DateValue>
            case .component: self.component = value as! CalendarComponentValue
            case .value: self.value = value as! IntValue
        }
    }
}

extension VariableType {
    public static var addDateComponentStep: VariableType { .init(title: "AddDateComponentStep") } // AddDateComponentStep
}

extension AddDateComponentStep {
    enum CodingKeys: String, CodingKey {
        case date
        case component
        case value
    }

    public convenience init(from decoder: Decoder) throws {
        let valueContainer = try decoder.container(keyedBy: CodingKeys.self)
        self.init(
            date: (try? valueContainer.decode(TypedValue<DateValue>.self, forKey: .date)) ?? Properties.date.defaultValue as! TypedValue<DateValue>,
            component: (try? valueContainer.decode(CalendarComponentValue.self, forKey: .component)) ?? Properties.component.defaultValue as! CalendarComponentValue,
            value: (try? valueContainer.decode(IntValue.self, forKey: .value)) ?? Properties.value.defaultValue as! IntValue
        )
    }
    public func encode(to encoder: Encoder) throws {
        var container = encoder.container(keyedBy: CodingKeys.self)
        try container.encode(date, forKey: .date)
        try container.encode(component, forKey: .component)
        try container.encode(value, forKey: .value)
    }
}

// DateValue

extension DateValue: Copying {
    public func copy() -> DateValue {
        return DateValue(
                    value: value
        )
    }
}


extension VariableType {
    public static var date: VariableType { .init(title: "Date") } // DateValue
}

extension DateValue {
    enum CodingKeys: String, CodingKey {
        case value
    }

    public convenience init(from decoder: Decoder) throws {
        let valueContainer = try decoder.container(keyedBy: CodingKeys.self)
        self.init(
            value: (try? valueContainer.decode(Date.self, forKey: .value)) ?? Self.makeDefault().value
        )
    }
    public func encode(to encoder: Encoder) throws {
        var container = encoder.container(keyedBy: CodingKeys.self)
        try container.encode(value, forKey: .value)
    }
}

// GetCurrentDateStep

extension GetCurrentDateStep: Copying {
    public func copy() -> GetCurrentDateStep {
        return GetCurrentDateStep(
        )
    }
}

extension GetCurrentDateStep {
    public enum Properties: ViewProperty, CaseIterable {
        public var defaultValue: any EditableVariableValue { fatalError() }
        public var rawValue: String { fatalError() }
    }
    public static func make(factory: (Properties) -> any EditableVariableValue) -> Self {
        .init(
        )
    }

    public static func makeDefault() -> Self {
        .init(
        )
    }
    public func value(for property: Properties) -> any EditableVariableValue {
    }

    public func set(_ value: Any, for property: Properties) {
    }
}

extension VariableType {
    public static var getCurrentDateStep: VariableType { .init(title: "GetCurrentDateStep") } // GetCurrentDateStep
}

extension GetCurrentDateStep {
    enum CodingKeys: String, CodingKey {
        case dummyKey
    }

    public convenience init(from decoder: Decoder) throws {
        let valueContainer = try decoder.container(keyedBy: CodingKeys.self)
        self.init(
        )
    }
    public func encode(to encoder: Encoder) throws {
        var container = encoder.container(keyedBy: CodingKeys.self)
    }
}

// GetDateComponentStep

extension GetDateComponentStep: Copying {
    public func copy() -> GetDateComponentStep {
        return GetDateComponentStep(
                    component: component,
                    date: date
        )
    }
}

extension GetDateComponentStep {
     public enum Properties: String, ViewProperty, CaseIterable {
        case component
        case date
        public var defaultValue: any EditableVariableValue {
            switch self {
            case .component: return GetDateComponentStep.defaultValue(for: .component)
            case .date: return GetDateComponentStep.defaultValue(for: .date)
            }
        }
    }
    public static func make(factory: (Properties) -> any EditableVariableValue) -> Self {
        .init(
            component: factory(.component) as! CalendarComponentValue,
            date: factory(.date) as! TypedValue<DateValue>
        )
    }

    public static func makeDefault() -> Self {
        .init(
            component: Properties.component.defaultValue as! CalendarComponentValue,
            date: Properties.date.defaultValue as! TypedValue<DateValue>
        )
    }
    public func value(for property: Properties) -> any EditableVariableValue {
        switch property {
            case .component: return component
            case .date: return date
        }
    }

    public func set(_ value: Any, for property: Properties) {
        switch property {
            case .component: self.component = value as! CalendarComponentValue
            case .date: self.date = value as! TypedValue<DateValue>
        }
    }
}

extension VariableType {
    public static var getDateComponentStep: VariableType { .init(title: "GetDateComponentStep") } // GetDateComponentStep
}

extension GetDateComponentStep {
    enum CodingKeys: String, CodingKey {
        case component
        case date
    }

    public convenience init(from decoder: Decoder) throws {
        let valueContainer = try decoder.container(keyedBy: CodingKeys.self)
        self.init(
            component: (try? valueContainer.decode(CalendarComponentValue.self, forKey: .component)) ?? Properties.component.defaultValue as! CalendarComponentValue,
            date: (try? valueContainer.decode(TypedValue<DateValue>.self, forKey: .date)) ?? Properties.date.defaultValue as! TypedValue<DateValue>
        )
    }
    public func encode(to encoder: Encoder) throws {
        var container = encoder.container(keyedBy: CodingKeys.self)
        try container.encode(component, forKey: .component)
        try container.encode(date, forKey: .date)
    }
}
















public class Greg: AAProvider {
    public static var steps: [any StepType.Type] {
    [
        AddDateComponentStep.self,
        GetCurrentDateStep.self,
        GetDateComponentStep.self
    ]
    }
    public static var values: [any EditableVariableValue.Type] {
    [
    AddDateComponentStep.self,
    DateValue.self,
    GetCurrentDateStep.self,
    GetDateComponentStep.self,
    CalendarComponentValue.self
    ]
    }
    public static var views: [any MakeableView.Type] {
    [
    ]
    }
}

import Armstrong
import DylKit




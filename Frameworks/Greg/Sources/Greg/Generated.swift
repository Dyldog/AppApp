// Generated using Sourcery 2.0.2 — https://github.com/krzysztofzablocki/Sourcery
// DO NOT EDIT

import DylKit
import SwiftUI

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

    public func add(_: VariableValue) throws -> VariableValue {
        throw VariableValueError.variableCannotPerformOperation(Self.type, "add")
    }

    public var protoString: String { "\(value.title)" }
    public var valueString: String { protoString }
    public func value(with _: Variables, and _: Scope) throws -> VariableValue {
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

public extension VariableType {
    static var calendarComponent: VariableType { .init(title: "CalendarComponent") } // Calendar.Component
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

public extension AddDateComponentStep {
    enum Properties: String, ViewProperty, CaseIterable {
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

    static func make(factory: (Properties) -> any EditableVariableValue) -> Self {
        .init(
            date: factory(.date) as! TypedValue<DateValue>,
            component: factory(.component) as! CalendarComponentValue,
            value: factory(.value) as! IntValue
        )
    }

    static func makeDefault() -> Self {
        .init(
            date: Properties.date.defaultValue as! TypedValue<DateValue>,
            component: Properties.component.defaultValue as! CalendarComponentValue,
            value: Properties.value.defaultValue as! IntValue
        )
    }

    func value(for property: Properties) -> any EditableVariableValue {
        switch property {
        case .date: return date
        case .component: return component
        case .value: return value
        }
    }

    func set(_ value: Any, for property: Properties) {
        switch property {
        case .date: date = value as! TypedValue<DateValue>
        case .component: component = value as! CalendarComponentValue
        case .value: self.value = value as! IntValue
        }
    }
}

public extension VariableType {
    static var addDateComponentStep: VariableType { .init(title: "AddDateComponentStep") } // AddDateComponentStep
}

public extension AddDateComponentStep {
    internal enum CodingKeys: String, CodingKey {
        case date
        case component
        case value
    }

    convenience init(from decoder: Decoder) throws {
        let valueContainer = try decoder.container(keyedBy: CodingKeys.self)
        self.init(
            date: (try? valueContainer.decode(TypedValue<DateValue>.self, forKey: .date)) ?? Properties.date.defaultValue as! TypedValue<DateValue>,
            component: (try? valueContainer.decode(CalendarComponentValue.self, forKey: .component)) ?? Properties.component.defaultValue as! CalendarComponentValue,
            value: (try? valueContainer.decode(IntValue.self, forKey: .value)) ?? Properties.value.defaultValue as! IntValue
        )
    }

    func encode(to encoder: Encoder) throws {
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

public extension VariableType {
    static var date: VariableType { .init(title: "Date") } // DateValue
}

public extension DateValue {
    internal enum CodingKeys: String, CodingKey {
        case value
    }

    convenience init(from decoder: Decoder) throws {
        let valueContainer = try decoder.container(keyedBy: CodingKeys.self)
        self.init(
            value: (try? valueContainer.decode(Date.self, forKey: .value)) ?? Self.makeDefault().value
        )
    }

    func encode(to encoder: Encoder) throws {
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

public extension GetCurrentDateStep {
    enum Properties: ViewProperty, CaseIterable {
        public var defaultValue: any EditableVariableValue { fatalError() }
        public var rawValue: String { fatalError() }
    }

    static func make(factory _: (Properties) -> any EditableVariableValue) -> Self {
        .init(
        )
    }

    static func makeDefault() -> Self {
        .init(
        )
    }

    func value(for _: Properties) -> any EditableVariableValue {}

    func set(_: Any, for _: Properties) {}
}

public extension VariableType {
    static var getCurrentDateStep: VariableType { .init(title: "GetCurrentDateStep") } // GetCurrentDateStep
}

public extension GetCurrentDateStep {
    internal enum CodingKeys: String, CodingKey {
        case dummyKey
    }

    convenience init(from decoder: Decoder) throws {
        let valueContainer = try decoder.container(keyedBy: CodingKeys.self)
        self.init(
        )
    }

    func encode(to encoder: Encoder) throws {
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

public extension GetDateComponentStep {
    enum Properties: String, ViewProperty, CaseIterable {
        case component
        case date
        public var defaultValue: any EditableVariableValue {
            switch self {
            case .component: return GetDateComponentStep.defaultValue(for: .component)
            case .date: return GetDateComponentStep.defaultValue(for: .date)
            }
        }
    }

    static func make(factory: (Properties) -> any EditableVariableValue) -> Self {
        .init(
            component: factory(.component) as! CalendarComponentValue,
            date: factory(.date) as! TypedValue<DateValue>
        )
    }

    static func makeDefault() -> Self {
        .init(
            component: Properties.component.defaultValue as! CalendarComponentValue,
            date: Properties.date.defaultValue as! TypedValue<DateValue>
        )
    }

    func value(for property: Properties) -> any EditableVariableValue {
        switch property {
        case .component: return component
        case .date: return date
        }
    }

    func set(_ value: Any, for property: Properties) {
        switch property {
        case .component: component = value as! CalendarComponentValue
        case .date: date = value as! TypedValue<DateValue>
        }
    }
}

public extension VariableType {
    static var getDateComponentStep: VariableType { .init(title: "GetDateComponentStep") } // GetDateComponentStep
}

public extension GetDateComponentStep {
    internal enum CodingKeys: String, CodingKey {
        case component
        case date
    }

    convenience init(from decoder: Decoder) throws {
        let valueContainer = try decoder.container(keyedBy: CodingKeys.self)
        self.init(
            component: (try? valueContainer.decode(CalendarComponentValue.self, forKey: .component)) ?? Properties.component.defaultValue as! CalendarComponentValue,
            date: (try? valueContainer.decode(TypedValue<DateValue>.self, forKey: .date)) ?? Properties.date.defaultValue as! TypedValue<DateValue>
        )
    }

    func encode(to encoder: Encoder) throws {
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
            GetDateComponentStep.self,
        ]
    }

    public static var values: [any EditableVariableValue.Type] {
        [
            AddDateComponentStep.self,
            DateValue.self,
            GetCurrentDateStep.self,
            GetDateComponentStep.self,
            CalendarComponentValue.self,
        ]
    }

    public static var views: [any MakeableView.Type] {
        [
        ]
    }
}

import Armstrong
import DylKit

// Generated using Sourcery 2.0.2 — https://github.com/krzysztofzablocki/Sourcery
// DO NOT EDIT

public class Armstrong: AAProvider {
    public static var steps: [any StepType.Type] {
        [
            SetVarStep.self,
        ]
    }

    public static var values: [any EditableVariableValue.Type] {
        [
            AnyMakeableView.self,
            AnyValue.self,
            ArrayValue.self,
            BoolValue.self,
            ColorValue.self,
            DictionaryValue.self,
            MakeableBase.self,
            MakeableLabel.self,
            MakeableStack.self,
            NilValue.self,
            NumericalOperationTypeValue.self,
            NumericalOperationValue.self,
            ResultValue.self,
            ScreenNameValue.self,
            ScreenValue.self,
            SetVarStep.self,
            StepArray.self,
            StringValue.self,
            Variable.self,
            VariableTypeValue.self,
            FloatValue.self,
            IntValue.self,
            AxisValue.self,
            FontWeightValue.self,
            NumericTypeValue.self,
        ]
    }

    public static var views: [any MakeableView.Type] {
        [
            MakeableBase.self,
            MakeableLabel.self,
            MakeableStack.self,
            ScreenValue.self,
        ]
    }
}

public enum NumericType: String, Codable, CaseIterable {
    public static var defaultValue: NumericType = .int
    public var title: String { rawValue.capitalized }

    case float
    case int
    public func make(from string: String) throws -> any VariableValue {
        switch self {
        case .float:
            guard let value = Float(string) else { throw VariableValueError.wrongTypeForOperation }
            return FloatValue(value: value)
        case .int:
            guard let value = Int(string) else { throw VariableValueError.wrongTypeForOperation }
            return IntValue(value: value)
        }
    }
}

extension NumericType: CodeRepresentable {
    public var codeRepresentation: String {
        title
    }
}

import DylKit
import SwiftUI

public extension MakeableBase {
    func make(isRunning: Bool, showEditControls: Bool, scope: Scope, onContentUpdate: @escaping (any MakeableView) -> Void, onRuntimeUpdate: @escaping (@escaping Block) -> Void, error: Binding<VariableValueError?>) -> AnyView {
        MakeableBaseView(isRunning: isRunning, showEditControls: showEditControls, scope: scope, base: self, onContentUpdate: onContentUpdate, onRuntimeUpdate: onRuntimeUpdate, error: error).any
    }
}

public extension MakeableLabel {
    func make(isRunning: Bool, showEditControls: Bool, scope: Scope, onContentUpdate: @escaping (any MakeableView) -> Void, onRuntimeUpdate: @escaping (@escaping Block) -> Void, error: Binding<VariableValueError?>) -> AnyView {
        MakeableLabelView(isRunning: isRunning, showEditControls: showEditControls, scope: scope, label: self, onContentUpdate: onContentUpdate, onRuntimeUpdate: onRuntimeUpdate, error: error).any
    }
}

public extension MakeableStack {
    func make(isRunning: Bool, showEditControls: Bool, scope: Scope, onContentUpdate: @escaping (any MakeableView) -> Void, onRuntimeUpdate: @escaping (@escaping Block) -> Void, error: Binding<VariableValueError?>) -> AnyView {
        MakeableStackView(isRunning: isRunning, showEditControls: showEditControls, scope: scope, stack: self, onContentUpdate: onContentUpdate, onRuntimeUpdate: onRuntimeUpdate, error: error).any
    }
}

public extension ScreenValue {
    func make(isRunning: Bool, showEditControls: Bool, scope: Scope, onContentUpdate: @escaping (any MakeableView) -> Void, onRuntimeUpdate: @escaping (@escaping Block) -> Void, error: Binding<VariableValueError?>) -> AnyView {
        ScreenValueView(isRunning: isRunning, showEditControls: showEditControls, scope: scope, screen: self, onContentUpdate: onContentUpdate, onRuntimeUpdate: onRuntimeUpdate, error: error).any
    }
}

public final class AxisValue: PrimitiveEditableVariableValue, Codable, Copying {
    public static let categories: [ValueCategory] = [.layout]
    public static var type: VariableType { .axis }
    public static var defaultValue: Axis { .defaultValue }
    public var value: Axis
    public init(value: Axis) {
        self.value = value
    }

    public static func makeDefault() -> AxisValue {
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

    public func copy() -> AxisValue {
        .init(
            value: value
        )
    }
}

extension AxisValue: CodeRepresentable {
    public var codeRepresentation: String {
        value.codeRepresentation
    }
}

extension Axis: Copying {
    public func copy() -> Axis {
        return self
    }
}

public extension VariableType {
    static var axis: VariableType { .init(title: "Axis") } // Axis
}

public final class FontWeightValue: PrimitiveEditableVariableValue, Codable, Copying {
    public static let categories: [ValueCategory] = [.text]
    public static var type: VariableType { .fontWeight }
    public static var defaultValue: Font.Weight { .defaultValue }
    public var value: Font.Weight
    public init(value: Font.Weight) {
        self.value = value
    }

    public static func makeDefault() -> FontWeightValue {
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

    public func copy() -> FontWeightValue {
        .init(
            value: value
        )
    }
}

extension FontWeightValue: CodeRepresentable {
    public var codeRepresentation: String {
        value.codeRepresentation
    }
}

extension Font.Weight: Copying {
    public func copy() -> Font.Weight {
        return self
    }
}

public extension VariableType {
    static var fontWeight: VariableType { .init(title: "FontWeight") } // Font.Weight
}

public final class NumericTypeValue: PrimitiveEditableVariableValue, Codable, Copying {
    public static let categories: [ValueCategory] = [.numbers]
    public static var type: VariableType { .numericType }
    public static var defaultValue: NumericType { .defaultValue }
    public var value: NumericType
    public init(value: NumericType) {
        self.value = value
    }

    public static func makeDefault() -> NumericTypeValue {
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

    public func copy() -> NumericTypeValue {
        .init(
            value: value
        )
    }
}

extension NumericTypeValue: CodeRepresentable {
    public var codeRepresentation: String {
        value.codeRepresentation
    }
}

extension NumericType: Copying {
    public func copy() -> NumericType {
        return self
    }
}

public extension VariableType {
    static var numericType: VariableType { .init(title: "NumericType") } // NumericType
}

public final class FloatValue: EditableVariableValue, Codable, Copying, NumericValue {
    public static let categories: [ValueCategory] = [.numbers]
    public static var type: VariableType { .float }
    public var value: Float
    public static var defaultValue: Float = .defaultValue
    public init(value: Float) {
        self.value = value
    }

    public static func makeDefault() -> FloatValue {
        .init(value: defaultValue)
    }

    public func editView(scope: Scope, title: String, onUpdate: @escaping (FloatValue) -> Void) -> AnyView {
        HStack {
            Text(title.capitalized).bold().scope(scope)
            Spacer()
            TextField("", text: .init(get: { [weak self] in
                self?.protoString ?? "ERROR"
            }, set: { [weak self] in
                guard let self = self else { return }
                self.value = Float($0) ?? self.value
                onUpdate(self)
            }))
            .multilineTextAlignment(.trailing)
            .scope(scope)
        }.any
    }

    public func add(_ other: VariableValue) throws -> VariableValue {
        guard let other = other as? FloatValue else { throw VariableValueError.wrongTypeForOperation }
        value = value + other.value
        return self
    }

    public var protoString: String { "\(value)" }
    public var valueString: String { "\(value)" }
    public func value(with _: Variables, and _: Scope) throws -> VariableValue {
        self
    }

    public func copy() -> FloatValue {
        .init(
            value: value
        )
    }
}

extension FloatValue: CodeRepresentable {
    public var codeRepresentation: String {
        "\(value)"
    }
}

extension Float: Copying {
    public func copy() -> Float {
        return Float(
        )
    }
}

public extension VariableType {
    static var float: VariableType { .init(title: "Float") } // Float
}

public final class IntValue: EditableVariableValue, Codable, Copying, NumericValue {
    public static let categories: [ValueCategory] = [.numbers]
    public static var type: VariableType { .int }
    public var value: Int
    public static var defaultValue: Int = .defaultValue
    public init(value: Int) {
        self.value = value
    }

    public static func makeDefault() -> IntValue {
        .init(value: defaultValue)
    }

    public func editView(scope: Scope, title: String, onUpdate: @escaping (IntValue) -> Void) -> AnyView {
        HStack {
            Text(title.capitalized).bold().scope(scope)
            Spacer()
            TextField("", text: .init(get: { [weak self] in
                self?.protoString ?? "ERROR"
            }, set: { [weak self] in
                guard let self = self else { return }
                self.value = Int($0) ?? self.value
                onUpdate(self)
            }))
            .multilineTextAlignment(.trailing)
            .scope(scope)
        }.any
    }

    public func add(_ other: VariableValue) throws -> VariableValue {
        guard let other = other as? IntValue else { throw VariableValueError.wrongTypeForOperation }
        value = value + other.value
        return self
    }

    public var protoString: String { "\(value)" }
    public var valueString: String { "\(value)" }
    public func value(with _: Variables, and _: Scope) throws -> VariableValue {
        self
    }

    public func copy() -> IntValue {
        .init(
            value: value
        )
    }
}

extension IntValue: CodeRepresentable {
    public var codeRepresentation: String {
        "\(value)"
    }
}

extension Int: Copying {
    public func copy() -> Int {
        return Int(
        )
    }
}

public extension VariableType {
    static var int: VariableType { .init(title: "Int") } // Int
}

// AnyMakeableView

extension AnyMakeableView: Copying {
    public func copy() -> AnyMakeableView {
        return AnyMakeableView(
            value: value
        )
    }
}

public extension VariableType {
    static var view: VariableType { .init(title: "view") } // AnyMakeableView
}

// AnyValue

extension AnyValue: Copying {
    public func copy() -> AnyValue {
        return AnyValue(
            value: value
        )
    }
}

public extension VariableType {
    static var anyValue: VariableType { .init(title: "anyValue") } // AnyValue
}

// ArrayValue

extension ArrayValue: Copying {
    public func copy() -> ArrayValue {
        return ArrayValue(
            type: type,
            elements: elements
        )
    }
}

public extension VariableType {
    static var list: VariableType { .init(title: "list") } // ArrayValue
}

// BoolValue

extension BoolValue: Copying {
    public func copy() -> BoolValue {
        return BoolValue(
            value: value
        )
    }
}

public extension VariableType {
    static var boolean: VariableType { .init(title: "boolean") } // BoolValue
}

public extension BoolValue {
    internal enum CodingKeys: String, CodingKey {
        case value
    }

    convenience init(from decoder: Decoder) throws {
        let valueContainer = try decoder.container(keyedBy: CodingKeys.self)
        self.init(
            value: (try? valueContainer.decode(Bool.self, forKey: .value)) ?? Self.makeDefault().value
        )
    }

    func encode(to encoder: Encoder) throws {
        var container = encoder.container(keyedBy: CodingKeys.self)
        try container.encode(value, forKey: .value)
    }
}

// ColorValue

extension ColorValue: Copying {
    public func copy() -> ColorValue {
        return ColorValue(
            value: value
        )
    }
}

public extension VariableType {
    static var color: VariableType { .init(title: "Color") } // ColorValue
}

public extension ColorValue {
    internal enum CodingKeys: String, CodingKey {
        case value
    }

    convenience init(from decoder: Decoder) throws {
        let valueContainer = try decoder.container(keyedBy: CodingKeys.self)
        self.init(
            value: (try? valueContainer.decode(Color.self, forKey: .value)) ?? Self.makeDefault().value
        )
    }

    func encode(to encoder: Encoder) throws {
        var container = encoder.container(keyedBy: CodingKeys.self)
        try container.encode(value, forKey: .value)
    }
}

// DictionaryValue

extension DictionaryValue: Copying {
    public func copy() -> DictionaryValue {
        return DictionaryValue(
            elements: elements
        )
    }
}

public extension VariableType {
    static var dictionary: VariableType { .init(title: "Dictionary") } // DictionaryValue
}

// MakeableBase

extension MakeableBase: Copying {
    public func copy() -> MakeableBase {
        return MakeableBase(
            padding: padding,
            backgroundColor: backgroundColor.copy(),
            cornerRadius: cornerRadius
        )
    }
}

public extension MakeableBase {
    enum Properties: String, ViewProperty, CaseIterable {
        case padding
        case backgroundColor
        case cornerRadius
        public var defaultValue: any EditableVariableValue {
            switch self {
            case .padding: return MakeableBase.defaultValue(for: .padding)
            case .backgroundColor: return MakeableBase.defaultValue(for: .backgroundColor)
            case .cornerRadius: return MakeableBase.defaultValue(for: .cornerRadius)
            }
        }
    }

    static func make(factory: (Properties) -> any EditableVariableValue) -> Self {
        .init(
            padding: factory(.padding) as! IntValue,
            backgroundColor: factory(.backgroundColor) as! ColorValue,
            cornerRadius: factory(.cornerRadius) as! IntValue
        )
    }

    static func makeDefault() -> Self {
        .init(
            padding: Properties.padding.defaultValue as! IntValue,
            backgroundColor: Properties.backgroundColor.defaultValue as! ColorValue,
            cornerRadius: Properties.cornerRadius.defaultValue as! IntValue
        )
    }

    func value(for property: Properties) -> any EditableVariableValue {
        switch property {
        case .padding: return padding
        case .backgroundColor: return backgroundColor
        case .cornerRadius: return cornerRadius
        }
    }

    func set(_ value: Any, for property: Properties) {
        switch property {
        case .padding: padding = value as! IntValue
        case .backgroundColor: backgroundColor = value as! ColorValue
        case .cornerRadius: cornerRadius = value as! IntValue
        }
    }
}

public extension VariableType {
    static var base: VariableType { .init(title: "Base") } // MakeableBase
}

public extension MakeableBase {
    internal enum CodingKeys: String, CodingKey {
        case padding
        case backgroundColor
        case cornerRadius
    }

    convenience init(from decoder: Decoder) throws {
        let valueContainer = try decoder.container(keyedBy: CodingKeys.self)
        self.init(
            padding: (try? valueContainer.decode(IntValue.self, forKey: .padding)) ?? Properties.padding.defaultValue as! IntValue,
            backgroundColor: (try? valueContainer.decode(ColorValue.self, forKey: .backgroundColor)) ?? Properties.backgroundColor.defaultValue as! ColorValue,
            cornerRadius: (try? valueContainer.decode(IntValue.self, forKey: .cornerRadius)) ?? Properties.cornerRadius.defaultValue as! IntValue
        )
    }

    func encode(to encoder: Encoder) throws {
        var container = encoder.container(keyedBy: CodingKeys.self)
        try container.encode(padding, forKey: .padding)
        try container.encode(backgroundColor, forKey: .backgroundColor)
        try container.encode(cornerRadius, forKey: .cornerRadius)
    }
}

// MakeableLabel

extension MakeableLabel: Copying {
    public func copy() -> MakeableLabel {
        return MakeableLabel(
            id: id,
            text: text.copy(),
            fontSize: fontSize,
            fontWeight: fontWeight,
            italic: italic.copy(),
            base: base.copy(),
            textColor: textColor.copy(),
            isMultiline: isMultiline.copy()
        )
    }
}

public extension MakeableLabel {
    enum Properties: String, ViewProperty, CaseIterable {
        case text
        case fontSize
        case fontWeight
        case italic
        case base
        case textColor
        case isMultiline
        public var defaultValue: any EditableVariableValue {
            switch self {
            case .text: return MakeableLabel.defaultValue(for: .text)
            case .fontSize: return MakeableLabel.defaultValue(for: .fontSize)
            case .fontWeight: return MakeableLabel.defaultValue(for: .fontWeight)
            case .italic: return MakeableLabel.defaultValue(for: .italic)
            case .base: return MakeableLabel.defaultValue(for: .base)
            case .textColor: return MakeableLabel.defaultValue(for: .textColor)
            case .isMultiline: return MakeableLabel.defaultValue(for: .isMultiline)
            }
        }
    }

    static func make(factory: (Properties) -> any EditableVariableValue) -> Self {
        .init(
            id: UUID(),
            text: factory(.text) as! AnyValue,
            fontSize: factory(.fontSize) as! IntValue,
            fontWeight: factory(.fontWeight) as! FontWeightValue,
            italic: factory(.italic) as! BoolValue,
            base: factory(.base) as! MakeableBase,
            textColor: factory(.textColor) as! ColorValue,
            isMultiline: factory(.isMultiline) as! BoolValue
        )
    }

    static func makeDefault() -> Self {
        .init(
            id: UUID(),
            text: Properties.text.defaultValue as! AnyValue,
            fontSize: Properties.fontSize.defaultValue as! IntValue,
            fontWeight: Properties.fontWeight.defaultValue as! FontWeightValue,
            italic: Properties.italic.defaultValue as! BoolValue,
            base: Properties.base.defaultValue as! MakeableBase,
            textColor: Properties.textColor.defaultValue as! ColorValue,
            isMultiline: Properties.isMultiline.defaultValue as! BoolValue
        )
    }

    func value(for property: Properties) -> any EditableVariableValue {
        switch property {
        case .text: return text
        case .fontSize: return fontSize
        case .fontWeight: return fontWeight
        case .italic: return italic
        case .base: return base
        case .textColor: return textColor
        case .isMultiline: return isMultiline
        }
    }

    func set(_ value: Any, for property: Properties) {
        switch property {
        case .text: text = value as! AnyValue
        case .fontSize: fontSize = value as! IntValue
        case .fontWeight: fontWeight = value as! FontWeightValue
        case .italic: italic = value as! BoolValue
        case .base: base = value as! MakeableBase
        case .textColor: textColor = value as! ColorValue
        case .isMultiline: isMultiline = value as! BoolValue
        }
    }
}

public extension VariableType {
    static var label: VariableType { .init(title: "Label") } // MakeableLabel
}

public extension MakeableLabel {
    internal enum CodingKeys: String, CodingKey {
        case id
        case text
        case fontSize
        case fontWeight
        case italic
        case base
        case textColor
        case isMultiline
    }

    convenience init(from decoder: Decoder) throws {
        let valueContainer = try decoder.container(keyedBy: CodingKeys.self)
        self.init(
            id: (try? valueContainer.decode(UUID.self, forKey: .id)) ?? UUID(),
            text: (try? valueContainer.decode(AnyValue.self, forKey: .text)) ?? Properties.text.defaultValue as! AnyValue,
            fontSize: (try? valueContainer.decode(IntValue.self, forKey: .fontSize)) ?? Properties.fontSize.defaultValue as! IntValue,
            fontWeight: (try? valueContainer.decode(FontWeightValue.self, forKey: .fontWeight)) ?? Properties.fontWeight.defaultValue as! FontWeightValue,
            italic: (try? valueContainer.decode(BoolValue.self, forKey: .italic)) ?? Properties.italic.defaultValue as! BoolValue,
            base: (try? valueContainer.decode(MakeableBase.self, forKey: .base)) ?? Properties.base.defaultValue as! MakeableBase,
            textColor: (try? valueContainer.decode(ColorValue.self, forKey: .textColor)) ?? Properties.textColor.defaultValue as! ColorValue,
            isMultiline: (try? valueContainer.decode(BoolValue.self, forKey: .isMultiline)) ?? Properties.isMultiline.defaultValue as! BoolValue
        )
    }

    func encode(to encoder: Encoder) throws {
        var container = encoder.container(keyedBy: CodingKeys.self)
        try container.encode(id, forKey: .id)
        try container.encode(text, forKey: .text)
        try container.encode(fontSize, forKey: .fontSize)
        try container.encode(fontWeight, forKey: .fontWeight)
        try container.encode(italic, forKey: .italic)
        try container.encode(base, forKey: .base)
        try container.encode(textColor, forKey: .textColor)
        try container.encode(isMultiline, forKey: .isMultiline)
    }
}

// MakeableStack

extension MakeableStack: Copying {
    public func copy() -> MakeableStack {
        return MakeableStack(
            id: id,
            base: base.copy(),
            axis: axis,
            content: content.copy()
        )
    }
}

public extension MakeableStack {
    enum Properties: String, ViewProperty, CaseIterable {
        case base
        case axis
        case content
        public var defaultValue: any EditableVariableValue {
            switch self {
            case .base: return MakeableStack.defaultValue(for: .base)
            case .axis: return MakeableStack.defaultValue(for: .axis)
            case .content: return MakeableStack.defaultValue(for: .content)
            }
        }
    }

    static func make(factory: (Properties) -> any EditableVariableValue) -> Self {
        .init(
            id: UUID(),
            base: factory(.base) as! MakeableBase,
            axis: factory(.axis) as! AxisValue,
            content: factory(.content) as! TypedValue<ArrayValue>
        )
    }

    static func makeDefault() -> Self {
        .init(
            id: UUID(),
            base: Properties.base.defaultValue as! MakeableBase,
            axis: Properties.axis.defaultValue as! AxisValue,
            content: Properties.content.defaultValue as! TypedValue<ArrayValue>
        )
    }

    func value(for property: Properties) -> any EditableVariableValue {
        switch property {
        case .base: return base
        case .axis: return axis
        case .content: return content
        }
    }

    func set(_ value: Any, for property: Properties) {
        switch property {
        case .base: base = value as! MakeableBase
        case .axis: axis = value as! AxisValue
        case .content: content = value as! TypedValue<ArrayValue>
        }
    }
}

public extension VariableType {
    static var stack: VariableType { .init(title: "Stack") } // MakeableStack
}

public extension MakeableStack {
    internal enum CodingKeys: String, CodingKey {
        case id
        case base
        case axis
        case content
    }

    convenience init(from decoder: Decoder) throws {
        let valueContainer = try decoder.container(keyedBy: CodingKeys.self)
        self.init(
            id: (try? valueContainer.decode(UUID.self, forKey: .id)) ?? UUID(),
            base: (try? valueContainer.decode(MakeableBase.self, forKey: .base)) ?? Properties.base.defaultValue as! MakeableBase,
            axis: (try? valueContainer.decode(AxisValue.self, forKey: .axis)) ?? Properties.axis.defaultValue as! AxisValue,
            content: (try? valueContainer.decode(TypedValue<ArrayValue>.self, forKey: .content)) ?? Properties.content.defaultValue as! TypedValue<ArrayValue>
        )
    }

    func encode(to encoder: Encoder) throws {
        var container = encoder.container(keyedBy: CodingKeys.self)
        try container.encode(id, forKey: .id)
        try container.encode(base, forKey: .base)
        try container.encode(axis, forKey: .axis)
        try container.encode(content, forKey: .content)
    }
}

// NilValue

extension NilValue: Copying {
    public func copy() -> NilValue {
        return NilValue(
        )
    }
}

public extension VariableType {
    static var `nil`: VariableType { .init(title: "`nil`") } // NilValue
}

// NumericalOperationTypeValue

extension NumericalOperationTypeValue: Copying {
    public func copy() -> NumericalOperationTypeValue {
        return NumericalOperationTypeValue(
            value: value
        )
    }
}

public extension VariableType {
    static var numericalOperationType: VariableType { .init(title: "NumericalOperationType") } // NumericalOperationTypeValue
}

public extension NumericalOperationTypeValue {
    internal enum CodingKeys: String, CodingKey {
        case value
    }

    convenience init(from decoder: Decoder) throws {
        let valueContainer = try decoder.container(keyedBy: CodingKeys.self)
        self.init(
            value: (try? valueContainer.decode(NumericalOperationType.self, forKey: .value)) ?? Self.makeDefault().value
        )
    }

    func encode(to encoder: Encoder) throws {
        var container = encoder.container(keyedBy: CodingKeys.self)
        try container.encode(value, forKey: .value)
    }
}

// NumericalOperationValue

extension NumericalOperationValue: Copying {
    public func copy() -> NumericalOperationValue {
        return NumericalOperationValue(
            lhs: lhs.copy(),
            rhs: rhs.copy(),
            operation: operation.copy()
        )
    }
}

public extension NumericalOperationValue {
    enum Properties: String, ViewProperty, CaseIterable {
        case lhs
        case rhs
        case operation
        public var defaultValue: any EditableVariableValue {
            switch self {
            case .lhs: return NumericalOperationValue.defaultValue(for: .lhs)
            case .rhs: return NumericalOperationValue.defaultValue(for: .rhs)
            case .operation: return NumericalOperationValue.defaultValue(for: .operation)
            }
        }
    }

    static func make(factory: (Properties) -> any EditableVariableValue) -> Self {
        .init(
            lhs: factory(.lhs) as! AnyValue,
            rhs: factory(.rhs) as! AnyValue,
            operation: factory(.operation) as! NumericalOperationTypeValue
        )
    }

    static func makeDefault() -> Self {
        .init(
            lhs: Properties.lhs.defaultValue as! AnyValue,
            rhs: Properties.rhs.defaultValue as! AnyValue,
            operation: Properties.operation.defaultValue as! NumericalOperationTypeValue
        )
    }

    func value(for property: Properties) -> any EditableVariableValue {
        switch property {
        case .lhs: return lhs
        case .rhs: return rhs
        case .operation: return operation
        }
    }

    func set(_ value: Any, for property: Properties) {
        switch property {
        case .lhs: lhs = value as! AnyValue
        case .rhs: rhs = value as! AnyValue
        case .operation: operation = value as! NumericalOperationTypeValue
        }
    }
}

public extension VariableType {
    static var numericalOperation: VariableType { .init(title: "NumericalOperation") } // NumericalOperationValue
}

public extension NumericalOperationValue {
    internal enum CodingKeys: String, CodingKey {
        case lhs
        case rhs
        case operation
    }

    convenience init(from decoder: Decoder) throws {
        let valueContainer = try decoder.container(keyedBy: CodingKeys.self)
        self.init(
            lhs: (try? valueContainer.decode(AnyValue.self, forKey: .lhs)) ?? Properties.lhs.defaultValue as! AnyValue,
            rhs: (try? valueContainer.decode(AnyValue.self, forKey: .rhs)) ?? Properties.rhs.defaultValue as! AnyValue,
            operation: (try? valueContainer.decode(NumericalOperationTypeValue.self, forKey: .operation)) ?? Properties.operation.defaultValue as! NumericalOperationTypeValue
        )
    }

    func encode(to encoder: Encoder) throws {
        var container = encoder.container(keyedBy: CodingKeys.self)
        try container.encode(lhs, forKey: .lhs)
        try container.encode(rhs, forKey: .rhs)
        try container.encode(operation, forKey: .operation)
    }
}

// ResultValue

extension ResultValue: Copying {
    public func copy() -> ResultValue {
        return ResultValue(
            steps: steps.copy()
        )
    }
}

public extension VariableType {
    static var result: VariableType { .init(title: "Result") } // ResultValue
}

public extension ResultValue {
    internal enum CodingKeys: String, CodingKey {
        case steps
    }

    convenience init(from decoder: Decoder) throws {
        let valueContainer = try decoder.container(keyedBy: CodingKeys.self)
        self.init(
            steps: (try? valueContainer.decode(StepArray.self, forKey: .steps)) ?? Self.makeDefault().steps
        )
    }

    func encode(to encoder: Encoder) throws {
        var container = encoder.container(keyedBy: CodingKeys.self)
        try container.encode(steps, forKey: .steps)
    }
}

// ScreenNameValue

extension ScreenNameValue: Copying {
    public func copy() -> ScreenNameValue {
        return ScreenNameValue(
            value: value
        )
    }
}

public extension VariableType {
    static var screenName: VariableType { .init(title: "ScreenName") } // ScreenNameValue
}

public extension ScreenNameValue {
    internal enum CodingKeys: String, CodingKey {
        case value
    }

    convenience init(from decoder: Decoder) throws {
        let valueContainer = try decoder.container(keyedBy: CodingKeys.self)
        self.init(
            value: (try? valueContainer.decode(String.self, forKey: .value)) ?? Self.makeDefault().value
        )
    }

    func encode(to encoder: Encoder) throws {
        var container = encoder.container(keyedBy: CodingKeys.self)
        try container.encode(value, forKey: .value)
    }
}

// ScreenValue

extension ScreenValue: Copying {
    public func copy() -> ScreenValue {
        return ScreenValue(
            id: id,
            name: name.copy(),
            arguments: arguments.copy()
        )
    }
}

public extension ScreenValue {
    enum Properties: String, ViewProperty, CaseIterable {
        case name
        case arguments
        public var defaultValue: any EditableVariableValue {
            switch self {
            case .name: return ScreenValue.defaultValue(for: .name)
            case .arguments: return ScreenValue.defaultValue(for: .arguments)
            }
        }
    }

    static func make(factory: (Properties) -> any EditableVariableValue) -> Self {
        .init(
            id: UUID(),
            name: factory(.name) as! ScreenNameValue,
            arguments: factory(.arguments) as! DictionaryValue
        )
    }

    static func makeDefault() -> Self {
        .init(
            id: UUID(),
            name: Properties.name.defaultValue as! ScreenNameValue,
            arguments: Properties.arguments.defaultValue as! DictionaryValue
        )
    }

    func value(for property: Properties) -> any EditableVariableValue {
        switch property {
        case .name: return name
        case .arguments: return arguments
        }
    }

    func set(_ value: Any, for property: Properties) {
        switch property {
        case .name: name = value as! ScreenNameValue
        case .arguments: arguments = value as! DictionaryValue
        }
    }
}

public extension VariableType {
    static var screen: VariableType { .init(title: "Screen") } // ScreenValue
}

public extension ScreenValue {
    internal enum CodingKeys: String, CodingKey {
        case id
        case name
        case arguments
    }

    convenience init(from decoder: Decoder) throws {
        let valueContainer = try decoder.container(keyedBy: CodingKeys.self)
        self.init(
            id: (try? valueContainer.decode(UUID.self, forKey: .id)) ?? UUID(),
            name: (try? valueContainer.decode(ScreenNameValue.self, forKey: .name)) ?? Properties.name.defaultValue as! ScreenNameValue,
            arguments: (try? valueContainer.decode(DictionaryValue.self, forKey: .arguments)) ?? Properties.arguments.defaultValue as! DictionaryValue
        )
    }

    func encode(to encoder: Encoder) throws {
        var container = encoder.container(keyedBy: CodingKeys.self)
        try container.encode(id, forKey: .id)
        try container.encode(name, forKey: .name)
        try container.encode(arguments, forKey: .arguments)
    }
}

// SetVarStep

extension SetVarStep: Copying {
    public func copy() -> SetVarStep {
        return SetVarStep(
            varName: varName.copy(),
            value: value.copy()
        )
    }
}

public extension SetVarStep {
    enum Properties: String, ViewProperty, CaseIterable {
        case varName
        case value
        public var defaultValue: any EditableVariableValue {
            switch self {
            case .varName: return SetVarStep.defaultValue(for: .varName)
            case .value: return SetVarStep.defaultValue(for: .value)
            }
        }
    }

    static func make(factory: (Properties) -> any EditableVariableValue) -> Self {
        .init(
            varName: factory(.varName) as! AnyValue,
            value: factory(.value) as! AnyValue
        )
    }

    static func makeDefault() -> Self {
        .init(
            varName: Properties.varName.defaultValue as! AnyValue,
            value: Properties.value.defaultValue as! AnyValue
        )
    }

    func value(for property: Properties) -> any EditableVariableValue {
        switch property {
        case .varName: return varName
        case .value: return value
        }
    }

    func set(_ value: Any, for property: Properties) {
        switch property {
        case .varName: varName = value as! AnyValue
        case .value: self.value = value as! AnyValue
        }
    }
}

public extension VariableType {
    static var setVarStep: VariableType { .init(title: "SetVarStep") } // SetVarStep
}

public extension SetVarStep {
    internal enum CodingKeys: String, CodingKey {
        case varName
        case value
    }

    convenience init(from decoder: Decoder) throws {
        let valueContainer = try decoder.container(keyedBy: CodingKeys.self)
        self.init(
            varName: (try? valueContainer.decode(AnyValue.self, forKey: .varName)) ?? Properties.varName.defaultValue as! AnyValue,
            value: (try? valueContainer.decode(AnyValue.self, forKey: .value)) ?? Properties.value.defaultValue as! AnyValue
        )
    }

    func encode(to encoder: Encoder) throws {
        var container = encoder.container(keyedBy: CodingKeys.self)
        try container.encode(varName, forKey: .varName)
        try container.encode(value, forKey: .value)
    }
}

// StepArray

extension StepArray: Copying {
    public func copy() -> StepArray {
        return StepArray(
            value: value
        )
    }
}

public extension VariableType {
    static var stepArray: VariableType { .init(title: "StepArray") } // StepArray
}

// StringValue

extension StringValue: Copying {
    public func copy() -> StringValue {
        return StringValue(
            value: value
        )
    }
}

public extension VariableType {
    static var string: VariableType { .init(title: "String") } // StringValue
}

// TypeableValue

// TypedValue

extension TypedValue: Copying {
    public func copy() -> TypedValue {
        return TypedValue(
            value: value
        )
    }
}

public extension TypedValue {
    internal enum CodingKeys: String, CodingKey {
        case value
    }

    convenience init(from decoder: Decoder) throws {
        let valueContainer = try decoder.container(keyedBy: CodingKeys.self)
        self.init(
            value: (try? valueContainer.decode(TypedValueOption<T>.self, forKey: .value)) ?? Self.makeDefault().value
        )
    }

    func encode(to encoder: Encoder) throws {
        var container = encoder.container(keyedBy: CodingKeys.self)
        try container.encode(value, forKey: .value)
    }
}

// Variable

extension Variable: Copying {
    public func copy() -> Variable {
        return Variable(
            value: value.copy()
        )
    }
}

public extension VariableType {
    static var variable: VariableType { .init(title: "Variable") } // Variable
}

// VariableTypeValue

extension VariableTypeValue: Copying {
    public func copy() -> VariableTypeValue {
        return VariableTypeValue(
            value: value
        )
    }
}

public extension VariableType {
    static var type: VariableType { .init(title: "type") } // VariableTypeValue
}

public extension VariableTypeValue {
    internal enum CodingKeys: String, CodingKey {
        case value
    }

    convenience init(from decoder: Decoder) throws {
        let valueContainer = try decoder.container(keyedBy: CodingKeys.self)
        self.init(
            value: (try? valueContainer.decode(VariableType.self, forKey: .value)) ?? Self.makeDefault().value
        )
    }

    func encode(to encoder: Encoder) throws {
        var container = encoder.container(keyedBy: CodingKeys.self)
        try container.encode(value, forKey: .value)
    }
}

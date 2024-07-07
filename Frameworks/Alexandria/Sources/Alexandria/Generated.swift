// Generated using Sourcery 2.0.2 — https://github.com/krzysztofzablocki/Sourcery
// DO NOT EDIT

public class Alexandria: AAProvider {
    public static var steps: [any StepType.Type] {
        [
            APIValueStep.self,
            AddToVarStep.self,
            ArrayValueStep.self,
            DecodeArrayStep.self,
            DecodeDictionaryStep.self,
            DictionaryKeysStep.self,
            DictionaryValueForKeyStep.self,
            ForEachStep.self,
            FunctionStep.self,
            GetNumberStep.self,
            GetSavedDataStep.self,
            IfStep.self,
            MakeRangeStep.self,
            MapStep.self,
            PrintVarStep.self,
            RandomElementStep.self,
            SaveDataStep.self,
            StaticValueStep.self,
            URLEncodeStep.self,
            VariableStep.self,
        ]
    }

    public static var values: [any EditableVariableValue.Type] {
        [
            APIValueStep.self,
            AddToVarStep.self,
            ArrayValueStep.self,
            ComparisonTypeValue.self,
            ComparisonValue.self,
            ConditionalActionValue.self,
            DecodeArrayStep.self,
            DecodeDictionaryStep.self,
            DictionaryKeysStep.self,
            DictionaryValueForKeyStep.self,
            ForEachStep.self,
            FunctionStep.self,
            FunctionValue.self,
            GetNumberStep.self,
            GetSavedDataStep.self,
            IfStep.self,
            LocationValue.self,
            MakeRangeStep.self,
            MakeableButton.self,
            MakeableField.self,
            MakeableList.self,
            MakeableMap.self,
            MakeableToggle.self,
            MapStep.self,
            OptionalValue.self,
            PrintVarStep.self,
            RandomElementStep.self,
            SaveDataStep.self,
            StaticValueStep.self,
            TemporaryValue.self,
            URLEncodeStep.self,
            VariableStep.self,
            ButtonStyleValue.self,
            TextAlignmentValue.self,
        ]
    }

    public static var views: [any MakeableView.Type] {
        [
            MakeableButton.self,
            MakeableField.self,
            MakeableList.self,
            MakeableMap.self,
            MakeableToggle.self,
        ]
    }
}

import Armstrong
import DylKit

import DylKit
import SwiftUI

public extension MakeableButton {
    func make(isRunning: Bool, showEditControls: Bool, scope: Scope, onContentUpdate: @escaping (any MakeableView) -> Void, onRuntimeUpdate: @escaping (@escaping Block) -> Void, error: Binding<VariableValueError?>) -> AnyView {
        MakeableButtonView(isRunning: isRunning, showEditControls: showEditControls, scope: scope, button: self, onContentUpdate: onContentUpdate, onRuntimeUpdate: onRuntimeUpdate, error: error).any
    }
}

public extension MakeableField {
    func make(isRunning: Bool, showEditControls: Bool, scope: Scope, onContentUpdate: @escaping (any MakeableView) -> Void, onRuntimeUpdate: @escaping (@escaping Block) -> Void, error: Binding<VariableValueError?>) -> AnyView {
        MakeableFieldView(isRunning: isRunning, showEditControls: showEditControls, scope: scope, field: self, onContentUpdate: onContentUpdate, onRuntimeUpdate: onRuntimeUpdate, error: error).any
    }
}

public extension MakeableList {
    func make(isRunning: Bool, showEditControls: Bool, scope: Scope, onContentUpdate: @escaping (any MakeableView) -> Void, onRuntimeUpdate: @escaping (@escaping Block) -> Void, error: Binding<VariableValueError?>) -> AnyView {
        MakeableListView(isRunning: isRunning, showEditControls: showEditControls, scope: scope, listView: self, onContentUpdate: onContentUpdate, onRuntimeUpdate: onRuntimeUpdate, error: error).any
    }
}

public extension MakeableMap {
    func make(isRunning: Bool, showEditControls: Bool, scope: Scope, onContentUpdate: @escaping (any MakeableView) -> Void, onRuntimeUpdate: @escaping (@escaping Block) -> Void, error: Binding<VariableValueError?>) -> AnyView {
        MakeableMapView(isRunning: isRunning, showEditControls: showEditControls, scope: scope, map: self, onContentUpdate: onContentUpdate, onRuntimeUpdate: onRuntimeUpdate, error: error).any
    }
}

public extension MakeableToggle {
    func make(isRunning: Bool, showEditControls: Bool, scope: Scope, onContentUpdate: @escaping (any MakeableView) -> Void, onRuntimeUpdate: @escaping (@escaping Block) -> Void, error: Binding<VariableValueError?>) -> AnyView {
        MakeableToggleView(isRunning: isRunning, showEditControls: showEditControls, scope: scope, toggle: self, onContentUpdate: onContentUpdate, onRuntimeUpdate: onRuntimeUpdate, error: error).any
    }
}

public final class ButtonStyleValue: PrimitiveEditableVariableValue, Codable, Copying {
    public static let categories: [ValueCategory] = [.layout]
    public static var type: VariableType { .buttonStyle }
    public static var defaultValue: ButtonStyle { .defaultValue }
    public var value: ButtonStyle
    public init(value: ButtonStyle) {
        self.value = value
    }

    public static func makeDefault() -> ButtonStyleValue {
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

    public func copy() -> ButtonStyleValue {
        .init(
            value: value
        )
    }
}

extension ButtonStyleValue: CodeRepresentable {
    public var codeRepresentation: String {
        value.codeRepresentation
    }
}

extension ButtonStyle: Copying {
    public func copy() -> ButtonStyle {
        return self
    }
}

public extension VariableType {
    static var buttonStyle: VariableType { .init(title: "ButtonStyle") } // ButtonStyle
}

public final class TextAlignmentValue: PrimitiveEditableVariableValue, Codable, Copying {
    public static let categories: [ValueCategory] = [.text]
    public static var type: VariableType { .textAlignment }
    public static var defaultValue: TextAlignment { .defaultValue }
    public var value: TextAlignment
    public init(value: TextAlignment) {
        self.value = value
    }

    public static func makeDefault() -> TextAlignmentValue {
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

    public func copy() -> TextAlignmentValue {
        .init(
            value: value
        )
    }
}

extension TextAlignmentValue: CodeRepresentable {
    public var codeRepresentation: String {
        value.codeRepresentation
    }
}

extension TextAlignment: Copying {
    public func copy() -> TextAlignment {
        return self
    }
}

public extension VariableType {
    static var textAlignment: VariableType { .init(title: "TextAlignment") } // TextAlignment
}

// APIValueStep

extension APIValueStep: Copying {
    public func copy() -> APIValueStep {
        return APIValueStep(
            url: url
        )
    }
}

public extension APIValueStep {
    enum Properties: String, ViewProperty, CaseIterable {
        case url
        public var defaultValue: any EditableVariableValue {
            switch self {
            case .url: return APIValueStep.defaultValue(for: .url)
            }
        }
    }

    static func make(factory: (Properties) -> any EditableVariableValue) -> Self {
        .init(
            url: factory(.url) as! AnyValue
        )
    }

    static func makeDefault() -> Self {
        .init(
            url: Properties.url.defaultValue as! AnyValue
        )
    }

    func value(for property: Properties) -> any EditableVariableValue {
        switch property {
        case .url: return url
        }
    }

    func set(_ value: Any, for property: Properties) {
        switch property {
        case .url: url = value as! AnyValue
        }
    }
}

public extension VariableType {
    static var aPIStep: VariableType { .init(title: "APIStep") } // APIValueStep
}

public extension APIValueStep {
    internal enum CodingKeys: String, CodingKey {
        case url
    }

    convenience init(from decoder: Decoder) throws {
        let valueContainer = try decoder.container(keyedBy: CodingKeys.self)
        self.init(
            url: (try? valueContainer.decode(AnyValue.self, forKey: .url)) ?? Properties.url.defaultValue as! AnyValue
        )
    }

    func encode(to encoder: Encoder) throws {
        var container = encoder.container(keyedBy: CodingKeys.self)
        try container.encode(url, forKey: .url)
    }
}

// AddToVarStep

extension AddToVarStep: Copying {
    public func copy() -> AddToVarStep {
        return AddToVarStep(
            varName: varName,
            value: value
        )
    }
}

public extension AddToVarStep {
    enum Properties: String, ViewProperty, CaseIterable {
        case varName
        case value
        public var defaultValue: any EditableVariableValue {
            switch self {
            case .varName: return AddToVarStep.defaultValue(for: .varName)
            case .value: return AddToVarStep.defaultValue(for: .value)
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
    static var addToVarStep: VariableType { .init(title: "AddToVarStep") } // AddToVarStep
}

public extension AddToVarStep {
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

// ArrayValueStep

extension ArrayValueStep: Copying {
    public func copy() -> ArrayValueStep {
        return ArrayValueStep(
            array: array,
            index: index
        )
    }
}

public extension ArrayValueStep {
    enum Properties: String, ViewProperty, CaseIterable {
        case array
        case index
        public var defaultValue: any EditableVariableValue {
            switch self {
            case .array: return ArrayValueStep.defaultValue(for: .array)
            case .index: return ArrayValueStep.defaultValue(for: .index)
            }
        }
    }

    static func make(factory: (Properties) -> any EditableVariableValue) -> Self {
        .init(
            array: factory(.array) as! AnyValue,
            index: factory(.index) as! AnyValue
        )
    }

    static func makeDefault() -> Self {
        .init(
            array: Properties.array.defaultValue as! AnyValue,
            index: Properties.index.defaultValue as! AnyValue
        )
    }

    func value(for property: Properties) -> any EditableVariableValue {
        switch property {
        case .array: return array
        case .index: return index
        }
    }

    func set(_ value: Any, for property: Properties) {
        switch property {
        case .array: array = value as! AnyValue
        case .index: index = value as! AnyValue
        }
    }
}

public extension VariableType {
    static var arrayStep: VariableType { .init(title: "ArrayStep") } // ArrayValueStep
}

public extension ArrayValueStep {
    internal enum CodingKeys: String, CodingKey {
        case array
        case index
    }

    convenience init(from decoder: Decoder) throws {
        let valueContainer = try decoder.container(keyedBy: CodingKeys.self)
        self.init(
            array: (try? valueContainer.decode(AnyValue.self, forKey: .array)) ?? Properties.array.defaultValue as! AnyValue,
            index: (try? valueContainer.decode(AnyValue.self, forKey: .index)) ?? Properties.index.defaultValue as! AnyValue
        )
    }

    func encode(to encoder: Encoder) throws {
        var container = encoder.container(keyedBy: CodingKeys.self)
        try container.encode(array, forKey: .array)
        try container.encode(index, forKey: .index)
    }
}

// ComparisonTypeValue

extension ComparisonTypeValue: Copying {
    public func copy() -> ComparisonTypeValue {
        return ComparisonTypeValue(
            value: value
        )
    }
}

public extension VariableType {
    static var comparisonType: VariableType { .init(title: "ComparisonType") } // ComparisonTypeValue
}

public extension ComparisonTypeValue {
    internal enum CodingKeys: String, CodingKey {
        case value
    }

    convenience init(from decoder: Decoder) throws {
        let valueContainer = try decoder.container(keyedBy: CodingKeys.self)
        self.init(
            value: (try? valueContainer.decode(ComparisonType.self, forKey: .value)) ?? Self.makeDefault().value
        )
    }

    func encode(to encoder: Encoder) throws {
        var container = encoder.container(keyedBy: CodingKeys.self)
        try container.encode(value, forKey: .value)
    }
}

// ComparisonValue

extension ComparisonValue: Copying {
    public func copy() -> ComparisonValue {
        return ComparisonValue(
            lhs: lhs,
            rhs: rhs,
            comparison: comparison.copy()
        )
    }
}

public extension ComparisonValue {
    enum Properties: String, ViewProperty, CaseIterable {
        case lhs
        case rhs
        case comparison
        public var defaultValue: any EditableVariableValue {
            switch self {
            case .lhs: return ComparisonValue.defaultValue(for: .lhs)
            case .rhs: return ComparisonValue.defaultValue(for: .rhs)
            case .comparison: return ComparisonValue.defaultValue(for: .comparison)
            }
        }
    }

    static func make(factory: (Properties) -> any EditableVariableValue) -> Self {
        .init(
            lhs: factory(.lhs) as! AnyValue,
            rhs: factory(.rhs) as! AnyValue,
            comparison: factory(.comparison) as! ComparisonTypeValue
        )
    }

    static func makeDefault() -> Self {
        .init(
            lhs: Properties.lhs.defaultValue as! AnyValue,
            rhs: Properties.rhs.defaultValue as! AnyValue,
            comparison: Properties.comparison.defaultValue as! ComparisonTypeValue
        )
    }

    func value(for property: Properties) -> any EditableVariableValue {
        switch property {
        case .lhs: return lhs
        case .rhs: return rhs
        case .comparison: return comparison
        }
    }

    func set(_ value: Any, for property: Properties) {
        switch property {
        case .lhs: lhs = value as! AnyValue
        case .rhs: rhs = value as! AnyValue
        case .comparison: comparison = value as! ComparisonTypeValue
        }
    }
}

public extension VariableType {
    static var comparison: VariableType { .init(title: "Comparison") } // ComparisonValue
}

public extension ComparisonValue {
    internal enum CodingKeys: String, CodingKey {
        case lhs
        case rhs
        case comparison
    }

    convenience init(from decoder: Decoder) throws {
        let valueContainer = try decoder.container(keyedBy: CodingKeys.self)
        self.init(
            lhs: (try? valueContainer.decode(AnyValue.self, forKey: .lhs)) ?? Properties.lhs.defaultValue as! AnyValue,
            rhs: (try? valueContainer.decode(AnyValue.self, forKey: .rhs)) ?? Properties.rhs.defaultValue as! AnyValue,
            comparison: (try? valueContainer.decode(ComparisonTypeValue.self, forKey: .comparison)) ?? Properties.comparison.defaultValue as! ComparisonTypeValue
        )
    }

    func encode(to encoder: Encoder) throws {
        var container = encoder.container(keyedBy: CodingKeys.self)
        try container.encode(lhs, forKey: .lhs)
        try container.encode(rhs, forKey: .rhs)
        try container.encode(comparison, forKey: .comparison)
    }
}

// ConditionalActionValue

extension ConditionalActionValue: Copying {
    public func copy() -> ConditionalActionValue {
        return ConditionalActionValue(
            ifCondition: ifCondition.copy(),
            ifSteps: ifSteps
        )
    }
}

public extension ConditionalActionValue {
    enum Properties: String, ViewProperty, CaseIterable {
        case ifCondition
        case ifSteps
        public var defaultValue: any EditableVariableValue {
            switch self {
            case .ifCondition: return ConditionalActionValue.defaultValue(for: .ifCondition)
            case .ifSteps: return ConditionalActionValue.defaultValue(for: .ifSteps)
            }
        }
    }

    static func make(factory: (Properties) -> any EditableVariableValue) -> Self {
        .init(
            ifCondition: factory(.ifCondition) as! ComparisonValue,
            ifSteps: factory(.ifSteps) as! StepArray
        )
    }

    static func makeDefault() -> Self {
        .init(
            ifCondition: Properties.ifCondition.defaultValue as! ComparisonValue,
            ifSteps: Properties.ifSteps.defaultValue as! StepArray
        )
    }

    func value(for property: Properties) -> any EditableVariableValue {
        switch property {
        case .ifCondition: return ifCondition
        case .ifSteps: return ifSteps
        }
    }

    func set(_ value: Any, for property: Properties) {
        switch property {
        case .ifCondition: ifCondition = value as! ComparisonValue
        case .ifSteps: ifSteps = value as! StepArray
        }
    }
}

public extension VariableType {
    static var conditionalAction: VariableType { .init(title: "ConditionalAction") } // ConditionalActionValue
}

public extension ConditionalActionValue {
    internal enum CodingKeys: String, CodingKey {
        case ifCondition
        case ifSteps
    }

    convenience init(from decoder: Decoder) throws {
        let valueContainer = try decoder.container(keyedBy: CodingKeys.self)
        self.init(
            ifCondition: (try? valueContainer.decode(ComparisonValue.self, forKey: .ifCondition)) ?? Properties.ifCondition.defaultValue as! ComparisonValue,
            ifSteps: (try? valueContainer.decode(StepArray.self, forKey: .ifSteps)) ?? Properties.ifSteps.defaultValue as! StepArray
        )
    }

    func encode(to encoder: Encoder) throws {
        var container = encoder.container(keyedBy: CodingKeys.self)
        try container.encode(ifCondition, forKey: .ifCondition)
        try container.encode(ifSteps, forKey: .ifSteps)
    }
}

// DecodeArrayStep

extension DecodeArrayStep: Copying {
    public func copy() -> DecodeArrayStep {
        return DecodeArrayStep(
            value: value
        )
    }
}

public extension DecodeArrayStep {
    enum Properties: String, ViewProperty, CaseIterable {
        case value
        public var defaultValue: any EditableVariableValue {
            switch self {
            case .value: return DecodeArrayStep.defaultValue(for: .value)
            }
        }
    }

    static func make(factory: (Properties) -> any EditableVariableValue) -> Self {
        .init(
            value: factory(.value) as! TypedValue<IntValue>
        )
    }

    static func makeDefault() -> Self {
        .init(
            value: Properties.value.defaultValue as! TypedValue<IntValue>
        )
    }

    func value(for property: Properties) -> any EditableVariableValue {
        switch property {
        case .value: return value
        }
    }

    func set(_ value: Any, for property: Properties) {
        switch property {
        case .value: self.value = value as! TypedValue<IntValue>
        }
    }
}

public extension VariableType {
    static var decodeArrayStep: VariableType { .init(title: "DecodeArrayStep") } // DecodeArrayStep
}

public extension DecodeArrayStep {
    internal enum CodingKeys: String, CodingKey {
        case value
    }

    convenience init(from decoder: Decoder) throws {
        let valueContainer = try decoder.container(keyedBy: CodingKeys.self)
        self.init(
            value: (try? valueContainer.decode(TypedValue<IntValue>.self, forKey: .value)) ?? Properties.value.defaultValue as! TypedValue<IntValue>
        )
    }

    func encode(to encoder: Encoder) throws {
        var container = encoder.container(keyedBy: CodingKeys.self)
        try container.encode(value, forKey: .value)
    }
}

// DecodeDictionaryStep

extension DecodeDictionaryStep: Copying {
    public func copy() -> DecodeDictionaryStep {
        return DecodeDictionaryStep(
            value: value
        )
    }
}

public extension DecodeDictionaryStep {
    enum Properties: String, ViewProperty, CaseIterable {
        case value
        public var defaultValue: any EditableVariableValue {
            switch self {
            case .value: return DecodeDictionaryStep.defaultValue(for: .value)
            }
        }
    }

    static func make(factory: (Properties) -> any EditableVariableValue) -> Self {
        .init(
            value: factory(.value) as! AnyValue
        )
    }

    static func makeDefault() -> Self {
        .init(
            value: Properties.value.defaultValue as! AnyValue
        )
    }

    func value(for property: Properties) -> any EditableVariableValue {
        switch property {
        case .value: return value
        }
    }

    func set(_ value: Any, for property: Properties) {
        switch property {
        case .value: self.value = value as! AnyValue
        }
    }
}

public extension VariableType {
    static var decodeDictionaryStep: VariableType { .init(title: "DecodeDictionaryStep") } // DecodeDictionaryStep
}

public extension DecodeDictionaryStep {
    internal enum CodingKeys: String, CodingKey {
        case value
    }

    convenience init(from decoder: Decoder) throws {
        let valueContainer = try decoder.container(keyedBy: CodingKeys.self)
        self.init(
            value: (try? valueContainer.decode(AnyValue.self, forKey: .value)) ?? Properties.value.defaultValue as! AnyValue
        )
    }

    func encode(to encoder: Encoder) throws {
        var container = encoder.container(keyedBy: CodingKeys.self)
        try container.encode(value, forKey: .value)
    }
}

// DictionaryKeysStep

extension DictionaryKeysStep: Copying {
    public func copy() -> DictionaryKeysStep {
        return DictionaryKeysStep(
            dictionary: dictionary
        )
    }
}

public extension DictionaryKeysStep {
    enum Properties: String, ViewProperty, CaseIterable {
        case dictionary
        public var defaultValue: any EditableVariableValue {
            switch self {
            case .dictionary: return DictionaryKeysStep.defaultValue(for: .dictionary)
            }
        }
    }

    static func make(factory: (Properties) -> any EditableVariableValue) -> Self {
        .init(
            dictionary: factory(.dictionary) as! TypedValue<DictionaryValue>
        )
    }

    static func makeDefault() -> Self {
        .init(
            dictionary: Properties.dictionary.defaultValue as! TypedValue<DictionaryValue>
        )
    }

    func value(for property: Properties) -> any EditableVariableValue {
        switch property {
        case .dictionary: return dictionary
        }
    }

    func set(_ value: Any, for property: Properties) {
        switch property {
        case .dictionary: dictionary = value as! TypedValue<DictionaryValue>
        }
    }
}

public extension VariableType {
    static var dictionaryKeysStep: VariableType { .init(title: "DictionaryKeysStep") } // DictionaryKeysStep
}

public extension DictionaryKeysStep {
    internal enum CodingKeys: String, CodingKey {
        case dictionary
    }

    convenience init(from decoder: Decoder) throws {
        let valueContainer = try decoder.container(keyedBy: CodingKeys.self)
        self.init(
            dictionary: (try? valueContainer.decode(TypedValue<DictionaryValue>.self, forKey: .dictionary)) ?? Properties.dictionary.defaultValue as! TypedValue<DictionaryValue>
        )
    }

    func encode(to encoder: Encoder) throws {
        var container = encoder.container(keyedBy: CodingKeys.self)
        try container.encode(dictionary, forKey: .dictionary)
    }
}

// DictionaryValueForKeyStep

extension DictionaryValueForKeyStep: Copying {
    public func copy() -> DictionaryValueForKeyStep {
        return DictionaryValueForKeyStep(
            dictionary: dictionary,
            key: key,
            errorIfNotFound: errorIfNotFound
        )
    }
}

public extension DictionaryValueForKeyStep {
    enum Properties: String, ViewProperty, CaseIterable {
        case dictionary
        case key
        case errorIfNotFound
        public var defaultValue: any EditableVariableValue {
            switch self {
            case .dictionary: return DictionaryValueForKeyStep.defaultValue(for: .dictionary)
            case .key: return DictionaryValueForKeyStep.defaultValue(for: .key)
            case .errorIfNotFound: return DictionaryValueForKeyStep.defaultValue(for: .errorIfNotFound)
            }
        }
    }

    static func make(factory: (Properties) -> any EditableVariableValue) -> Self {
        .init(
            dictionary: factory(.dictionary) as! TypedValue<DictionaryValue>,
            key: factory(.key) as! AnyValue,
            errorIfNotFound: factory(.errorIfNotFound) as! BoolValue
        )
    }

    static func makeDefault() -> Self {
        .init(
            dictionary: Properties.dictionary.defaultValue as! TypedValue<DictionaryValue>,
            key: Properties.key.defaultValue as! AnyValue,
            errorIfNotFound: Properties.errorIfNotFound.defaultValue as! BoolValue
        )
    }

    func value(for property: Properties) -> any EditableVariableValue {
        switch property {
        case .dictionary: return dictionary
        case .key: return key
        case .errorIfNotFound: return errorIfNotFound
        }
    }

    func set(_ value: Any, for property: Properties) {
        switch property {
        case .dictionary: dictionary = value as! TypedValue<DictionaryValue>
        case .key: key = value as! AnyValue
        case .errorIfNotFound: errorIfNotFound = value as! BoolValue
        }
    }
}

public extension VariableType {
    static var dictionaryForKeyStep: VariableType { .init(title: "DictionaryForKeyStep") } // DictionaryValueForKeyStep
}

public extension DictionaryValueForKeyStep {
    internal enum CodingKeys: String, CodingKey {
        case dictionary
        case key
        case errorIfNotFound
    }

    convenience init(from decoder: Decoder) throws {
        let valueContainer = try decoder.container(keyedBy: CodingKeys.self)
        self.init(
            dictionary: (try? valueContainer.decode(TypedValue<DictionaryValue>.self, forKey: .dictionary)) ?? Properties.dictionary.defaultValue as! TypedValue<DictionaryValue>,
            key: (try? valueContainer.decode(AnyValue.self, forKey: .key)) ?? Properties.key.defaultValue as! AnyValue,
            errorIfNotFound: (try? valueContainer.decode(BoolValue.self, forKey: .errorIfNotFound)) ?? Properties.errorIfNotFound.defaultValue as! BoolValue
        )
    }

    func encode(to encoder: Encoder) throws {
        var container = encoder.container(keyedBy: CodingKeys.self)
        try container.encode(dictionary, forKey: .dictionary)
        try container.encode(key, forKey: .key)
        try container.encode(errorIfNotFound, forKey: .errorIfNotFound)
    }
}

// ForEachStep

extension ForEachStep: Copying {
    public func copy() -> ForEachStep {
        return ForEachStep(
            values: values,
            loop: loop
        )
    }
}

public extension ForEachStep {
    enum Properties: String, ViewProperty, CaseIterable {
        case values
        case loop
        public var defaultValue: any EditableVariableValue {
            switch self {
            case .values: return ForEachStep.defaultValue(for: .values)
            case .loop: return ForEachStep.defaultValue(for: .loop)
            }
        }
    }

    static func make(factory: (Properties) -> any EditableVariableValue) -> Self {
        .init(
            values: factory(.values) as! TypedValue<ArrayValue>,
            loop: factory(.loop) as! StepArray
        )
    }

    static func makeDefault() -> Self {
        .init(
            values: Properties.values.defaultValue as! TypedValue<ArrayValue>,
            loop: Properties.loop.defaultValue as! StepArray
        )
    }

    func value(for property: Properties) -> any EditableVariableValue {
        switch property {
        case .values: return values
        case .loop: return loop
        }
    }

    func set(_ value: Any, for property: Properties) {
        switch property {
        case .values: values = value as! TypedValue<ArrayValue>
        case .loop: loop = value as! StepArray
        }
    }
}

public extension VariableType {
    static var forEachStep: VariableType { .init(title: "ForEachStep") } // ForEachStep
}

public extension ForEachStep {
    internal enum CodingKeys: String, CodingKey {
        case values
        case loop
    }

    convenience init(from decoder: Decoder) throws {
        let valueContainer = try decoder.container(keyedBy: CodingKeys.self)
        self.init(
            values: (try? valueContainer.decode(TypedValue<ArrayValue>.self, forKey: .values)) ?? Properties.values.defaultValue as! TypedValue<ArrayValue>,
            loop: (try? valueContainer.decode(StepArray.self, forKey: .loop)) ?? Properties.loop.defaultValue as! StepArray
        )
    }

    func encode(to encoder: Encoder) throws {
        var container = encoder.container(keyedBy: CodingKeys.self)
        try container.encode(values, forKey: .values)
        try container.encode(loop, forKey: .loop)
    }
}

// FunctionStep

extension FunctionStep: Copying {
    public func copy() -> FunctionStep {
        return FunctionStep(
            functionName: functionName
        )
    }
}

public extension FunctionStep {
    enum Properties: String, ViewProperty, CaseIterable {
        case functionName
        public var defaultValue: any EditableVariableValue {
            switch self {
            case .functionName: return FunctionStep.defaultValue(for: .functionName)
            }
        }
    }

    static func make(factory: (Properties) -> any EditableVariableValue) -> Self {
        .init(
            functionName: factory(.functionName) as! AnyValue
        )
    }

    static func makeDefault() -> Self {
        .init(
            functionName: Properties.functionName.defaultValue as! AnyValue
        )
    }

    func value(for property: Properties) -> any EditableVariableValue {
        switch property {
        case .functionName: return functionName
        }
    }

    func set(_ value: Any, for property: Properties) {
        switch property {
        case .functionName: functionName = value as! AnyValue
        }
    }
}

public extension VariableType {
    static var functionStep: VariableType { .init(title: "FunctionStep") } // FunctionStep
}

public extension FunctionStep {
    internal enum CodingKeys: String, CodingKey {
        case functionName
    }

    convenience init(from decoder: Decoder) throws {
        let valueContainer = try decoder.container(keyedBy: CodingKeys.self)
        self.init(
            functionName: (try? valueContainer.decode(AnyValue.self, forKey: .functionName)) ?? Properties.functionName.defaultValue as! AnyValue
        )
    }

    func encode(to encoder: Encoder) throws {
        var container = encoder.container(keyedBy: CodingKeys.self)
        try container.encode(functionName, forKey: .functionName)
    }
}

// FunctionValue

extension FunctionValue: Copying {
    public func copy() -> FunctionValue {
        return FunctionValue(
            arguments: arguments,
            body: body
        )
    }
}

public extension FunctionValue {
    enum Properties: String, ViewProperty, CaseIterable {
        case arguments
        case body
        public var defaultValue: any EditableVariableValue {
            switch self {
            case .arguments: return FunctionValue.defaultValue(for: .arguments)
            case .body: return FunctionValue.defaultValue(for: .body)
            }
        }
    }

    static func make(factory: (Properties) -> any EditableVariableValue) -> Self {
        .init(
            arguments: factory(.arguments) as! TypedValue<DictionaryValue>,
            body: factory(.body) as! TypedValue<StepArray>
        )
    }

    static func makeDefault() -> Self {
        .init(
            arguments: Properties.arguments.defaultValue as! TypedValue<DictionaryValue>,
            body: Properties.body.defaultValue as! TypedValue<StepArray>
        )
    }

    func value(for property: Properties) -> any EditableVariableValue {
        switch property {
        case .arguments: return arguments
        case .body: return body
        }
    }

    func set(_ value: Any, for property: Properties) {
        switch property {
        case .arguments: arguments = value as! TypedValue<DictionaryValue>
        case .body: body = value as! TypedValue<StepArray>
        }
    }
}

public extension VariableType {
    static var function: VariableType { .init(title: "Function") } // FunctionValue
}

public extension FunctionValue {
    internal enum CodingKeys: String, CodingKey {
        case arguments
        case body
    }

    convenience init(from decoder: Decoder) throws {
        let valueContainer = try decoder.container(keyedBy: CodingKeys.self)
        self.init(
            arguments: (try? valueContainer.decode(TypedValue<DictionaryValue>.self, forKey: .arguments)) ?? Properties.arguments.defaultValue as! TypedValue<DictionaryValue>,
            body: (try? valueContainer.decode(TypedValue<StepArray>.self, forKey: .body)) ?? Properties.body.defaultValue as! TypedValue<StepArray>
        )
    }

    func encode(to encoder: Encoder) throws {
        var container = encoder.container(keyedBy: CodingKeys.self)
        try container.encode(arguments, forKey: .arguments)
        try container.encode(body, forKey: .body)
    }
}

// GetNumberStep

extension GetNumberStep: Copying {
    public func copy() -> GetNumberStep {
        return GetNumberStep(
            value: value,
            numberType: numberType
        )
    }
}

public extension GetNumberStep {
    enum Properties: String, ViewProperty, CaseIterable {
        case value
        case numberType
        public var defaultValue: any EditableVariableValue {
            switch self {
            case .value: return GetNumberStep.defaultValue(for: .value)
            case .numberType: return GetNumberStep.defaultValue(for: .numberType)
            }
        }
    }

    static func make(factory: (Properties) -> any EditableVariableValue) -> Self {
        .init(
            value: factory(.value) as! AnyValue,
            numberType: factory(.numberType) as! NumericTypeValue
        )
    }

    static func makeDefault() -> Self {
        .init(
            value: Properties.value.defaultValue as! AnyValue,
            numberType: Properties.numberType.defaultValue as! NumericTypeValue
        )
    }

    func value(for property: Properties) -> any EditableVariableValue {
        switch property {
        case .value: return value
        case .numberType: return numberType
        }
    }

    func set(_ value: Any, for property: Properties) {
        switch property {
        case .value: self.value = value as! AnyValue
        case .numberType: numberType = value as! NumericTypeValue
        }
    }
}

public extension VariableType {
    static var getNumberStep: VariableType { .init(title: "GetNumberStep") } // GetNumberStep
}

public extension GetNumberStep {
    internal enum CodingKeys: String, CodingKey {
        case value
        case numberType
    }

    convenience init(from decoder: Decoder) throws {
        let valueContainer = try decoder.container(keyedBy: CodingKeys.self)
        self.init(
            value: (try? valueContainer.decode(AnyValue.self, forKey: .value)) ?? Properties.value.defaultValue as! AnyValue,
            numberType: (try? valueContainer.decode(NumericTypeValue.self, forKey: .numberType)) ?? Properties.numberType.defaultValue as! NumericTypeValue
        )
    }

    func encode(to encoder: Encoder) throws {
        var container = encoder.container(keyedBy: CodingKeys.self)
        try container.encode(value, forKey: .value)
        try container.encode(numberType, forKey: .numberType)
    }
}

// GetSavedDataStep

extension GetSavedDataStep: Copying {
    public func copy() -> GetSavedDataStep {
        return GetSavedDataStep(
            key: key
        )
    }
}

public extension GetSavedDataStep {
    enum Properties: String, ViewProperty, CaseIterable {
        case key
        public var defaultValue: any EditableVariableValue {
            switch self {
            case .key: return GetSavedDataStep.defaultValue(for: .key)
            }
        }
    }

    static func make(factory: (Properties) -> any EditableVariableValue) -> Self {
        .init(
            key: factory(.key) as! TypedValue<StringValue>
        )
    }

    static func makeDefault() -> Self {
        .init(
            key: Properties.key.defaultValue as! TypedValue<StringValue>
        )
    }

    func value(for property: Properties) -> any EditableVariableValue {
        switch property {
        case .key: return key
        }
    }

    func set(_ value: Any, for property: Properties) {
        switch property {
        case .key: key = value as! TypedValue<StringValue>
        }
    }
}

public extension VariableType {
    static var getSavedDataStep: VariableType { .init(title: "GetSavedDataStep") } // GetSavedDataStep
}

public extension GetSavedDataStep {
    internal enum CodingKeys: String, CodingKey {
        case key
    }

    convenience init(from decoder: Decoder) throws {
        let valueContainer = try decoder.container(keyedBy: CodingKeys.self)
        self.init(
            key: (try? valueContainer.decode(TypedValue<StringValue>.self, forKey: .key)) ?? Properties.key.defaultValue as! TypedValue<StringValue>
        )
    }

    func encode(to encoder: Encoder) throws {
        var container = encoder.container(keyedBy: CodingKeys.self)
        try container.encode(key, forKey: .key)
    }
}

// IfStep

extension IfStep: Copying {
    public func copy() -> IfStep {
        return IfStep(
            ifAction: ifAction.copy(),
            elseAction: elseAction
        )
    }
}

public extension IfStep {
    enum Properties: String, ViewProperty, CaseIterable {
        case ifAction
        case elseAction
        public var defaultValue: any EditableVariableValue {
            switch self {
            case .ifAction: return IfStep.defaultValue(for: .ifAction)
            case .elseAction: return IfStep.defaultValue(for: .elseAction)
            }
        }
    }

    static func make(factory: (Properties) -> any EditableVariableValue) -> Self {
        .init(
            ifAction: factory(.ifAction) as! ConditionalActionValue,
            elseAction: factory(.elseAction) as! StepArray
        )
    }

    static func makeDefault() -> Self {
        .init(
            ifAction: Properties.ifAction.defaultValue as! ConditionalActionValue,
            elseAction: Properties.elseAction.defaultValue as! StepArray
        )
    }

    func value(for property: Properties) -> any EditableVariableValue {
        switch property {
        case .ifAction: return ifAction
        case .elseAction: return elseAction
        }
    }

    func set(_ value: Any, for property: Properties) {
        switch property {
        case .ifAction: ifAction = value as! ConditionalActionValue
        case .elseAction: elseAction = value as! StepArray
        }
    }
}

public extension VariableType {
    static var ifStep: VariableType { .init(title: "IfStep") } // IfStep
}

public extension IfStep {
    internal enum CodingKeys: String, CodingKey {
        case ifAction
        case elseAction
    }

    convenience init(from decoder: Decoder) throws {
        let valueContainer = try decoder.container(keyedBy: CodingKeys.self)
        self.init(
            ifAction: (try? valueContainer.decode(ConditionalActionValue.self, forKey: .ifAction)) ?? Properties.ifAction.defaultValue as! ConditionalActionValue,
            elseAction: (try? valueContainer.decode(StepArray.self, forKey: .elseAction)) ?? Properties.elseAction.defaultValue as! StepArray
        )
    }

    func encode(to encoder: Encoder) throws {
        var container = encoder.container(keyedBy: CodingKeys.self)
        try container.encode(ifAction, forKey: .ifAction)
        try container.encode(elseAction, forKey: .elseAction)
    }
}

// LocationValue

extension LocationValue: Copying {
    public func copy() -> LocationValue {
        return LocationValue(
            name: name,
            latitude: latitude,
            longitude: longitude
        )
    }
}

public extension LocationValue {
    enum Properties: String, ViewProperty, CaseIterable {
        case name
        case latitude
        case longitude
        public var defaultValue: any EditableVariableValue {
            switch self {
            case .name: return LocationValue.defaultValue(for: .name)
            case .latitude: return LocationValue.defaultValue(for: .latitude)
            case .longitude: return LocationValue.defaultValue(for: .longitude)
            }
        }
    }

    static func make(factory: (Properties) -> any EditableVariableValue) -> Self {
        .init(
            name: factory(.name) as! TypedValue<StringValue>,
            latitude: factory(.latitude) as! TypedValue<FloatValue>,
            longitude: factory(.longitude) as! TypedValue<FloatValue>
        )
    }

    static func makeDefault() -> Self {
        .init(
            name: Properties.name.defaultValue as! TypedValue<StringValue>,
            latitude: Properties.latitude.defaultValue as! TypedValue<FloatValue>,
            longitude: Properties.longitude.defaultValue as! TypedValue<FloatValue>
        )
    }

    func value(for property: Properties) -> any EditableVariableValue {
        switch property {
        case .name: return name
        case .latitude: return latitude
        case .longitude: return longitude
        }
    }

    func set(_ value: Any, for property: Properties) {
        switch property {
        case .name: name = value as! TypedValue<StringValue>
        case .latitude: latitude = value as! TypedValue<FloatValue>
        case .longitude: longitude = value as! TypedValue<FloatValue>
        }
    }
}

public extension VariableType {
    static var location: VariableType { .init(title: "Location") } // LocationValue
}

public extension LocationValue {
    internal enum CodingKeys: String, CodingKey {
        case name
        case latitude
        case longitude
    }

    convenience init(from decoder: Decoder) throws {
        let valueContainer = try decoder.container(keyedBy: CodingKeys.self)
        self.init(
            name: (try? valueContainer.decode(TypedValue<StringValue>.self, forKey: .name)) ?? Properties.name.defaultValue as! TypedValue<StringValue>,
            latitude: (try? valueContainer.decode(TypedValue<FloatValue>.self, forKey: .latitude)) ?? Properties.latitude.defaultValue as! TypedValue<FloatValue>,
            longitude: (try? valueContainer.decode(TypedValue<FloatValue>.self, forKey: .longitude)) ?? Properties.longitude.defaultValue as! TypedValue<FloatValue>
        )
    }

    func encode(to encoder: Encoder) throws {
        var container = encoder.container(keyedBy: CodingKeys.self)
        try container.encode(name, forKey: .name)
        try container.encode(latitude, forKey: .latitude)
        try container.encode(longitude, forKey: .longitude)
    }
}

// MakeRangeStep

extension MakeRangeStep: Copying {
    public func copy() -> MakeRangeStep {
        return MakeRangeStep(
            start: start,
            end: end,
            step: step
        )
    }
}

public extension MakeRangeStep {
    enum Properties: String, ViewProperty, CaseIterable {
        case start
        case end
        case step
        public var defaultValue: any EditableVariableValue {
            switch self {
            case .start: return MakeRangeStep.defaultValue(for: .start)
            case .end: return MakeRangeStep.defaultValue(for: .end)
            case .step: return MakeRangeStep.defaultValue(for: .step)
            }
        }
    }

    static func make(factory: (Properties) -> any EditableVariableValue) -> Self {
        .init(
            start: factory(.start) as! any NumericValue,
            end: factory(.end) as! any NumericValue,
            step: factory(.step) as! any NumericValue
        )
    }

    static func makeDefault() -> Self {
        .init(
            start: Properties.start.defaultValue as! any NumericValue,
            end: Properties.end.defaultValue as! any NumericValue,
            step: Properties.step.defaultValue as! any NumericValue
        )
    }

    func value(for property: Properties) -> any EditableVariableValue {
        switch property {
        case .start: return start
        case .end: return end
        case .step: return step
        }
    }

    func set(_ value: Any, for property: Properties) {
        switch property {
        case .start: start = value as! any NumericValue
        case .end: end = value as! any NumericValue
        case .step: step = value as! any NumericValue
        }
    }
}

public extension VariableType {
    static var makeRangeStep: VariableType { .init(title: "MakeRangeStep") } // MakeRangeStep
}

// MakeableButton

extension MakeableButton: Copying {
    public func copy() -> MakeableButton {
        return MakeableButton(
            id: id,
            title: title,
            style: style,
            action: action.copy()
        )
    }
}

public extension MakeableButton {
    enum Properties: String, ViewProperty, CaseIterable {
        case title
        case style
        case action
        public var defaultValue: any EditableVariableValue {
            switch self {
            case .title: return MakeableButton.defaultValue(for: .title)
            case .style: return MakeableButton.defaultValue(for: .style)
            case .action: return MakeableButton.defaultValue(for: .action)
            }
        }
    }

    static func make(factory: (Properties) -> any EditableVariableValue) -> Self {
        .init(
            id: UUID(),
            title: factory(.title) as! AnyMakeableView,
            style: factory(.style) as! ButtonStyleValue,
            action: factory(.action) as! FunctionValue
        )
    }

    static func makeDefault() -> Self {
        .init(
            id: UUID(),
            title: Properties.title.defaultValue as! AnyMakeableView,
            style: Properties.style.defaultValue as! ButtonStyleValue,
            action: Properties.action.defaultValue as! FunctionValue
        )
    }

    func value(for property: Properties) -> any EditableVariableValue {
        switch property {
        case .title: return title
        case .style: return style
        case .action: return action
        }
    }

    func set(_ value: Any, for property: Properties) {
        switch property {
        case .title: title = value as! AnyMakeableView
        case .style: style = value as! ButtonStyleValue
        case .action: action = value as! FunctionValue
        }
    }
}

public extension VariableType {
    static var button: VariableType { .init(title: "Button") } // MakeableButton
}

public extension MakeableButton {
    internal enum CodingKeys: String, CodingKey {
        case id
        case title
        case style
        case action
    }

    convenience init(from decoder: Decoder) throws {
        let valueContainer = try decoder.container(keyedBy: CodingKeys.self)
        self.init(
            id: (try? valueContainer.decode(UUID.self, forKey: .id)) ?? UUID(),
            title: (try? valueContainer.decode(AnyMakeableView.self, forKey: .title)) ?? Properties.title.defaultValue as! AnyMakeableView,
            style: (try? valueContainer.decode(ButtonStyleValue.self, forKey: .style)) ?? Properties.style.defaultValue as! ButtonStyleValue,
            action: (try? valueContainer.decode(FunctionValue.self, forKey: .action)) ?? Properties.action.defaultValue as! FunctionValue
        )
    }

    func encode(to encoder: Encoder) throws {
        var container = encoder.container(keyedBy: CodingKeys.self)
        try container.encode(id, forKey: .id)
        try container.encode(title, forKey: .title)
        try container.encode(style, forKey: .style)
        try container.encode(action, forKey: .action)
    }
}

// MakeableField

extension MakeableField: Copying {
    public func copy() -> MakeableField {
        return MakeableField(
            id: id,
            text: text.copy(),
            fontSize: fontSize,
            onTextUpdate: onTextUpdate,
            padding: padding,
            alignment: alignment,
            isMultiline: isMultiline
        )
    }
}

public extension MakeableField {
    enum Properties: String, ViewProperty, CaseIterable {
        case text
        case fontSize
        case onTextUpdate
        case padding
        case alignment
        case isMultiline
        public var defaultValue: any EditableVariableValue {
            switch self {
            case .text: return MakeableField.defaultValue(for: .text)
            case .fontSize: return MakeableField.defaultValue(for: .fontSize)
            case .onTextUpdate: return MakeableField.defaultValue(for: .onTextUpdate)
            case .padding: return MakeableField.defaultValue(for: .padding)
            case .alignment: return MakeableField.defaultValue(for: .alignment)
            case .isMultiline: return MakeableField.defaultValue(for: .isMultiline)
            }
        }
    }

    static func make(factory: (Properties) -> any EditableVariableValue) -> Self {
        .init(
            id: UUID(),
            text: factory(.text) as! TemporaryValue,
            fontSize: factory(.fontSize) as! IntValue,
            onTextUpdate: factory(.onTextUpdate) as! StepArray,
            padding: factory(.padding) as! IntValue,
            alignment: factory(.alignment) as! TextAlignmentValue,
            isMultiline: factory(.isMultiline) as! BoolValue
        )
    }

    static func makeDefault() -> Self {
        .init(
            id: UUID(),
            text: Properties.text.defaultValue as! TemporaryValue,
            fontSize: Properties.fontSize.defaultValue as! IntValue,
            onTextUpdate: Properties.onTextUpdate.defaultValue as! StepArray,
            padding: Properties.padding.defaultValue as! IntValue,
            alignment: Properties.alignment.defaultValue as! TextAlignmentValue,
            isMultiline: Properties.isMultiline.defaultValue as! BoolValue
        )
    }

    func value(for property: Properties) -> any EditableVariableValue {
        switch property {
        case .text: return text
        case .fontSize: return fontSize
        case .onTextUpdate: return onTextUpdate
        case .padding: return padding
        case .alignment: return alignment
        case .isMultiline: return isMultiline
        }
    }

    func set(_ value: Any, for property: Properties) {
        switch property {
        case .text: text = value as! TemporaryValue
        case .fontSize: fontSize = value as! IntValue
        case .onTextUpdate: onTextUpdate = value as! StepArray
        case .padding: padding = value as! IntValue
        case .alignment: alignment = value as! TextAlignmentValue
        case .isMultiline: isMultiline = value as! BoolValue
        }
    }
}

public extension VariableType {
    static var field: VariableType { .init(title: "Field") } // MakeableField
}

public extension MakeableField {
    internal enum CodingKeys: String, CodingKey {
        case id
        case text
        case fontSize
        case onTextUpdate
        case padding
        case alignment
        case isMultiline
    }

    convenience init(from decoder: Decoder) throws {
        let valueContainer = try decoder.container(keyedBy: CodingKeys.self)
        self.init(
            id: (try? valueContainer.decode(UUID.self, forKey: .id)) ?? UUID(),
            text: (try? valueContainer.decode(TemporaryValue.self, forKey: .text)) ?? Properties.text.defaultValue as! TemporaryValue,
            fontSize: (try? valueContainer.decode(IntValue.self, forKey: .fontSize)) ?? Properties.fontSize.defaultValue as! IntValue,
            onTextUpdate: (try? valueContainer.decode(StepArray.self, forKey: .onTextUpdate)) ?? Properties.onTextUpdate.defaultValue as! StepArray,
            padding: (try? valueContainer.decode(IntValue.self, forKey: .padding)) ?? Properties.padding.defaultValue as! IntValue,
            alignment: (try? valueContainer.decode(TextAlignmentValue.self, forKey: .alignment)) ?? Properties.alignment.defaultValue as! TextAlignmentValue,
            isMultiline: (try? valueContainer.decode(BoolValue.self, forKey: .isMultiline)) ?? Properties.isMultiline.defaultValue as! BoolValue
        )
    }

    func encode(to encoder: Encoder) throws {
        var container = encoder.container(keyedBy: CodingKeys.self)
        try container.encode(id, forKey: .id)
        try container.encode(text, forKey: .text)
        try container.encode(fontSize, forKey: .fontSize)
        try container.encode(onTextUpdate, forKey: .onTextUpdate)
        try container.encode(padding, forKey: .padding)
        try container.encode(alignment, forKey: .alignment)
        try container.encode(isMultiline, forKey: .isMultiline)
    }
}

// MakeableList

extension MakeableList: Copying {
    public func copy() -> MakeableList {
        return MakeableList(
            id: id,
            data: data,
            view: view
        )
    }
}

public extension MakeableList {
    enum Properties: String, ViewProperty, CaseIterable {
        case data
        case view
        public var defaultValue: any EditableVariableValue {
            switch self {
            case .data: return MakeableList.defaultValue(for: .data)
            case .view: return MakeableList.defaultValue(for: .view)
            }
        }
    }

    static func make(factory: (Properties) -> any EditableVariableValue) -> Self {
        .init(
            id: UUID(),
            data: factory(.data) as! TypedValue<ArrayValue>,
            view: factory(.view) as! AnyMakeableView
        )
    }

    static func makeDefault() -> Self {
        .init(
            id: UUID(),
            data: Properties.data.defaultValue as! TypedValue<ArrayValue>,
            view: Properties.view.defaultValue as! AnyMakeableView
        )
    }

    func value(for property: Properties) -> any EditableVariableValue {
        switch property {
        case .data: return data
        case .view: return view
        }
    }

    func set(_ value: Any, for property: Properties) {
        switch property {
        case .data: data = value as! TypedValue<ArrayValue>
        case .view: view = value as! AnyMakeableView
        }
    }
}

public extension VariableType {
    static var listView: VariableType { .init(title: "listView") } // MakeableList
}

public extension MakeableList {
    internal enum CodingKeys: String, CodingKey {
        case id
        case data
        case view
    }

    convenience init(from decoder: Decoder) throws {
        let valueContainer = try decoder.container(keyedBy: CodingKeys.self)
        self.init(
            id: (try? valueContainer.decode(UUID.self, forKey: .id)) ?? UUID(),
            data: (try? valueContainer.decode(TypedValue<ArrayValue>.self, forKey: .data)) ?? Properties.data.defaultValue as! TypedValue<ArrayValue>,
            view: (try? valueContainer.decode(AnyMakeableView.self, forKey: .view)) ?? Properties.view.defaultValue as! AnyMakeableView
        )
    }

    func encode(to encoder: Encoder) throws {
        var container = encoder.container(keyedBy: CodingKeys.self)
        try container.encode(id, forKey: .id)
        try container.encode(data, forKey: .data)
        try container.encode(view, forKey: .view)
    }
}

// MakeableListRow

// MakeableMap

extension MakeableMap: Copying {
    public func copy() -> MakeableMap {
        return MakeableMap(
            id: id,
            locations: locations,
            zoomFollowsNewAnnotations: zoomFollowsNewAnnotations
        )
    }
}

public extension MakeableMap {
    enum Properties: String, ViewProperty, CaseIterable {
        case locations
        case zoomFollowsNewAnnotations
        public var defaultValue: any EditableVariableValue {
            switch self {
            case .locations: return MakeableMap.defaultValue(for: .locations)
            case .zoomFollowsNewAnnotations: return MakeableMap.defaultValue(for: .zoomFollowsNewAnnotations)
            }
        }
    }

    static func make(factory: (Properties) -> any EditableVariableValue) -> Self {
        .init(
            id: UUID(),
            locations: factory(.locations) as! TypedValue<ArrayValue>,
            zoomFollowsNewAnnotations: factory(.zoomFollowsNewAnnotations) as! BoolValue
        )
    }

    static func makeDefault() -> Self {
        .init(
            id: UUID(),
            locations: Properties.locations.defaultValue as! TypedValue<ArrayValue>,
            zoomFollowsNewAnnotations: Properties.zoomFollowsNewAnnotations.defaultValue as! BoolValue
        )
    }

    func value(for property: Properties) -> any EditableVariableValue {
        switch property {
        case .locations: return locations
        case .zoomFollowsNewAnnotations: return zoomFollowsNewAnnotations
        }
    }

    func set(_ value: Any, for property: Properties) {
        switch property {
        case .locations: locations = value as! TypedValue<ArrayValue>
        case .zoomFollowsNewAnnotations: zoomFollowsNewAnnotations = value as! BoolValue
        }
    }
}

public extension VariableType {
    static var map: VariableType { .init(title: "Map") } // MakeableMap
}

public extension MakeableMap {
    internal enum CodingKeys: String, CodingKey {
        case id
        case locations
        case zoomFollowsNewAnnotations
    }

    convenience init(from decoder: Decoder) throws {
        let valueContainer = try decoder.container(keyedBy: CodingKeys.self)
        self.init(
            id: (try? valueContainer.decode(UUID.self, forKey: .id)) ?? UUID(),
            locations: (try? valueContainer.decode(TypedValue<ArrayValue>.self, forKey: .locations)) ?? Properties.locations.defaultValue as! TypedValue<ArrayValue>,
            zoomFollowsNewAnnotations: (try? valueContainer.decode(BoolValue.self, forKey: .zoomFollowsNewAnnotations)) ?? Properties.zoomFollowsNewAnnotations.defaultValue as! BoolValue
        )
    }

    func encode(to encoder: Encoder) throws {
        var container = encoder.container(keyedBy: CodingKeys.self)
        try container.encode(id, forKey: .id)
        try container.encode(locations, forKey: .locations)
        try container.encode(zoomFollowsNewAnnotations, forKey: .zoomFollowsNewAnnotations)
    }
}

// MakeableToggle

extension MakeableToggle: Copying {
    public func copy() -> MakeableToggle {
        return MakeableToggle(
            id: id,
            isOn: isOn.copy(),
            onToggleUpdate: onToggleUpdate,
            padding: padding
        )
    }
}

public extension MakeableToggle {
    enum Properties: String, ViewProperty, CaseIterable {
        case isOn
        case onToggleUpdate
        case padding
        public var defaultValue: any EditableVariableValue {
            switch self {
            case .isOn: return MakeableToggle.defaultValue(for: .isOn)
            case .onToggleUpdate: return MakeableToggle.defaultValue(for: .onToggleUpdate)
            case .padding: return MakeableToggle.defaultValue(for: .padding)
            }
        }
    }

    static func make(factory: (Properties) -> any EditableVariableValue) -> Self {
        .init(
            id: UUID(),
            isOn: factory(.isOn) as! TemporaryValue,
            onToggleUpdate: factory(.onToggleUpdate) as! StepArray,
            padding: factory(.padding) as! IntValue
        )
    }

    static func makeDefault() -> Self {
        .init(
            id: UUID(),
            isOn: Properties.isOn.defaultValue as! TemporaryValue,
            onToggleUpdate: Properties.onToggleUpdate.defaultValue as! StepArray,
            padding: Properties.padding.defaultValue as! IntValue
        )
    }

    func value(for property: Properties) -> any EditableVariableValue {
        switch property {
        case .isOn: return isOn
        case .onToggleUpdate: return onToggleUpdate
        case .padding: return padding
        }
    }

    func set(_ value: Any, for property: Properties) {
        switch property {
        case .isOn: isOn = value as! TemporaryValue
        case .onToggleUpdate: onToggleUpdate = value as! StepArray
        case .padding: padding = value as! IntValue
        }
    }
}

public extension VariableType {
    static var toggle: VariableType { .init(title: "Toggle") } // MakeableToggle
}

public extension MakeableToggle {
    internal enum CodingKeys: String, CodingKey {
        case id
        case isOn
        case onToggleUpdate
        case padding
    }

    convenience init(from decoder: Decoder) throws {
        let valueContainer = try decoder.container(keyedBy: CodingKeys.self)
        self.init(
            id: (try? valueContainer.decode(UUID.self, forKey: .id)) ?? UUID(),
            isOn: (try? valueContainer.decode(TemporaryValue.self, forKey: .isOn)) ?? Properties.isOn.defaultValue as! TemporaryValue,
            onToggleUpdate: (try? valueContainer.decode(StepArray.self, forKey: .onToggleUpdate)) ?? Properties.onToggleUpdate.defaultValue as! StepArray,
            padding: (try? valueContainer.decode(IntValue.self, forKey: .padding)) ?? Properties.padding.defaultValue as! IntValue
        )
    }

    func encode(to encoder: Encoder) throws {
        var container = encoder.container(keyedBy: CodingKeys.self)
        try container.encode(id, forKey: .id)
        try container.encode(isOn, forKey: .isOn)
        try container.encode(onToggleUpdate, forKey: .onToggleUpdate)
        try container.encode(padding, forKey: .padding)
    }
}

// MapStep

extension MapStep: Copying {
    public func copy() -> MapStep {
        return MapStep(
            value: value,
            mapper: mapper
        )
    }
}

public extension MapStep {
    enum Properties: String, ViewProperty, CaseIterable {
        case value
        case mapper
        public var defaultValue: any EditableVariableValue {
            switch self {
            case .value: return MapStep.defaultValue(for: .value)
            case .mapper: return MapStep.defaultValue(for: .mapper)
            }
        }
    }

    static func make(factory: (Properties) -> any EditableVariableValue) -> Self {
        .init(
            value: factory(.value) as! TypedValue<ArrayValue>,
            mapper: factory(.mapper) as! StepArray
        )
    }

    static func makeDefault() -> Self {
        .init(
            value: Properties.value.defaultValue as! TypedValue<ArrayValue>,
            mapper: Properties.mapper.defaultValue as! StepArray
        )
    }

    func value(for property: Properties) -> any EditableVariableValue {
        switch property {
        case .value: return value
        case .mapper: return mapper
        }
    }

    func set(_ value: Any, for property: Properties) {
        switch property {
        case .value: self.value = value as! TypedValue<ArrayValue>
        case .mapper: mapper = value as! StepArray
        }
    }
}

public extension VariableType {
    static var mapStep: VariableType { .init(title: "MapStep") } // MapStep
}

public extension MapStep {
    internal enum CodingKeys: String, CodingKey {
        case value
        case mapper
    }

    convenience init(from decoder: Decoder) throws {
        let valueContainer = try decoder.container(keyedBy: CodingKeys.self)
        self.init(
            value: (try? valueContainer.decode(TypedValue<ArrayValue>.self, forKey: .value)) ?? Properties.value.defaultValue as! TypedValue<ArrayValue>,
            mapper: (try? valueContainer.decode(StepArray.self, forKey: .mapper)) ?? Properties.mapper.defaultValue as! StepArray
        )
    }

    func encode(to encoder: Encoder) throws {
        var container = encoder.container(keyedBy: CodingKeys.self)
        try container.encode(value, forKey: .value)
        try container.encode(mapper, forKey: .mapper)
    }
}

// OptionalValue

extension OptionalValue: Copying {
    public func copy() -> OptionalValue {
        return OptionalValue(
            value: value
        )
    }
}

public extension VariableType {
    static var optional: VariableType { .init(title: "Optional") } // OptionalValue
}

public extension OptionalValue {
    internal enum CodingKeys: String, CodingKey {
        case value
    }

    convenience init(from decoder: Decoder) throws {
        let valueContainer = try decoder.container(keyedBy: CodingKeys.self)
        self.init(
            value: (try? valueContainer.decode(AnyValue.self, forKey: .value)) ?? Self.makeDefault().value
        )
    }

    func encode(to encoder: Encoder) throws {
        var container = encoder.container(keyedBy: CodingKeys.self)
        try container.encode(value, forKey: .value)
    }
}

// PrintVarStep

extension PrintVarStep: Copying {
    public func copy() -> PrintVarStep {
        return PrintVarStep(
            varName: varName
        )
    }
}

public extension PrintVarStep {
    enum Properties: String, ViewProperty, CaseIterable {
        case varName
        public var defaultValue: any EditableVariableValue {
            switch self {
            case .varName: return PrintVarStep.defaultValue(for: .varName)
            }
        }
    }

    static func make(factory: (Properties) -> any EditableVariableValue) -> Self {
        .init(
            varName: factory(.varName) as! AnyValue
        )
    }

    static func makeDefault() -> Self {
        .init(
            varName: Properties.varName.defaultValue as! AnyValue
        )
    }

    func value(for property: Properties) -> any EditableVariableValue {
        switch property {
        case .varName: return varName
        }
    }

    func set(_ value: Any, for property: Properties) {
        switch property {
        case .varName: varName = value as! AnyValue
        }
    }
}

public extension VariableType {
    static var printVarStep: VariableType { .init(title: "PrintVarStep") } // PrintVarStep
}

public extension PrintVarStep {
    internal enum CodingKeys: String, CodingKey {
        case varName
    }

    convenience init(from decoder: Decoder) throws {
        let valueContainer = try decoder.container(keyedBy: CodingKeys.self)
        self.init(
            varName: (try? valueContainer.decode(AnyValue.self, forKey: .varName)) ?? Properties.varName.defaultValue as! AnyValue
        )
    }

    func encode(to encoder: Encoder) throws {
        var container = encoder.container(keyedBy: CodingKeys.self)
        try container.encode(varName, forKey: .varName)
    }
}

// RandomElementStep

extension RandomElementStep: Copying {
    public func copy() -> RandomElementStep {
        return RandomElementStep(
            array: array
        )
    }
}

public extension RandomElementStep {
    enum Properties: String, ViewProperty, CaseIterable {
        case array
        public var defaultValue: any EditableVariableValue {
            switch self {
            case .array: return RandomElementStep.defaultValue(for: .array)
            }
        }
    }

    static func make(factory: (Properties) -> any EditableVariableValue) -> Self {
        .init(
            array: factory(.array) as! TypedValue<ArrayValue>
        )
    }

    static func makeDefault() -> Self {
        .init(
            array: Properties.array.defaultValue as! TypedValue<ArrayValue>
        )
    }

    func value(for property: Properties) -> any EditableVariableValue {
        switch property {
        case .array: return array
        }
    }

    func set(_ value: Any, for property: Properties) {
        switch property {
        case .array: array = value as! TypedValue<ArrayValue>
        }
    }
}

public extension VariableType {
    static var randomElementStep: VariableType { .init(title: "RandomElementStep") } // RandomElementStep
}

public extension RandomElementStep {
    internal enum CodingKeys: String, CodingKey {
        case array
    }

    convenience init(from decoder: Decoder) throws {
        let valueContainer = try decoder.container(keyedBy: CodingKeys.self)
        self.init(
            array: (try? valueContainer.decode(TypedValue<ArrayValue>.self, forKey: .array)) ?? Properties.array.defaultValue as! TypedValue<ArrayValue>
        )
    }

    func encode(to encoder: Encoder) throws {
        var container = encoder.container(keyedBy: CodingKeys.self)
        try container.encode(array, forKey: .array)
    }
}

// SaveDataStep

extension SaveDataStep: Copying {
    public func copy() -> SaveDataStep {
        return SaveDataStep(
            key: key,
            data: data
        )
    }
}

public extension SaveDataStep {
    enum Properties: String, ViewProperty, CaseIterable {
        case key
        case data
        public var defaultValue: any EditableVariableValue {
            switch self {
            case .key: return SaveDataStep.defaultValue(for: .key)
            case .data: return SaveDataStep.defaultValue(for: .data)
            }
        }
    }

    static func make(factory: (Properties) -> any EditableVariableValue) -> Self {
        .init(
            key: factory(.key) as! TypedValue<StringValue>,
            data: factory(.data) as! AnyValue
        )
    }

    static func makeDefault() -> Self {
        .init(
            key: Properties.key.defaultValue as! TypedValue<StringValue>,
            data: Properties.data.defaultValue as! AnyValue
        )
    }

    func value(for property: Properties) -> any EditableVariableValue {
        switch property {
        case .key: return key
        case .data: return data
        }
    }

    func set(_ value: Any, for property: Properties) {
        switch property {
        case .key: key = value as! TypedValue<StringValue>
        case .data: data = value as! AnyValue
        }
    }
}

public extension VariableType {
    static var saveDataStep: VariableType { .init(title: "SaveDataStep") } // SaveDataStep
}

public extension SaveDataStep {
    internal enum CodingKeys: String, CodingKey {
        case key
        case data
    }

    convenience init(from decoder: Decoder) throws {
        let valueContainer = try decoder.container(keyedBy: CodingKeys.self)
        self.init(
            key: (try? valueContainer.decode(TypedValue<StringValue>.self, forKey: .key)) ?? Properties.key.defaultValue as! TypedValue<StringValue>,
            data: (try? valueContainer.decode(AnyValue.self, forKey: .data)) ?? Properties.data.defaultValue as! AnyValue
        )
    }

    func encode(to encoder: Encoder) throws {
        var container = encoder.container(keyedBy: CodingKeys.self)
        try container.encode(key, forKey: .key)
        try container.encode(data, forKey: .data)
    }
}

// StaticValueStep

extension StaticValueStep: Copying {
    public func copy() -> StaticValueStep {
        return StaticValueStep(
            value: value
        )
    }
}

public extension StaticValueStep {
    enum Properties: String, ViewProperty, CaseIterable {
        case value
        public var defaultValue: any EditableVariableValue {
            switch self {
            case .value: return StaticValueStep.defaultValue(for: .value)
            }
        }
    }

    static func make(factory: (Properties) -> any EditableVariableValue) -> Self {
        .init(
            value: factory(.value) as! AnyValue
        )
    }

    static func makeDefault() -> Self {
        .init(
            value: Properties.value.defaultValue as! AnyValue
        )
    }

    func value(for property: Properties) -> any EditableVariableValue {
        switch property {
        case .value: return value
        }
    }

    func set(_ value: Any, for property: Properties) {
        switch property {
        case .value: self.value = value as! AnyValue
        }
    }
}

public extension VariableType {
    static var staticStep: VariableType { .init(title: "StaticStep") } // StaticValueStep
}

public extension StaticValueStep {
    internal enum CodingKeys: String, CodingKey {
        case value
    }

    convenience init(from decoder: Decoder) throws {
        let valueContainer = try decoder.container(keyedBy: CodingKeys.self)
        self.init(
            value: (try? valueContainer.decode(AnyValue.self, forKey: .value)) ?? Properties.value.defaultValue as! AnyValue
        )
    }

    func encode(to encoder: Encoder) throws {
        var container = encoder.container(keyedBy: CodingKeys.self)
        try container.encode(value, forKey: .value)
    }
}

// TemporaryValue

extension TemporaryValue: Copying {
    public func copy() -> TemporaryValue {
        return TemporaryValue(
            initial: initial,
            output: output
        )
    }
}

public extension TemporaryValue {
    enum Properties: String, ViewProperty, CaseIterable {
        case initial
        case output
        public var defaultValue: any EditableVariableValue {
            switch self {
            case .initial: return TemporaryValue.defaultValue(for: .initial)
            case .output: return TemporaryValue.defaultValue(for: .output)
            }
        }
    }

    static func make(factory: (Properties) -> any EditableVariableValue) -> Self {
        .init(
            initial: factory(.initial) as! AnyValue,
            output: factory(.output) as! Variable
        )
    }

    static func makeDefault() -> Self {
        .init(
            initial: Properties.initial.defaultValue as! AnyValue,
            output: Properties.output.defaultValue as! Variable
        )
    }

    func value(for property: Properties) -> any EditableVariableValue {
        switch property {
        case .initial: return initial
        case .output: return output
        }
    }

    func set(_ value: Any, for property: Properties) {
        switch property {
        case .initial: initial = value as! AnyValue
        case .output: output = value as! Variable
        }
    }
}

public extension VariableType {
    static var temporary: VariableType { .init(title: "Temporary") } // TemporaryValue
}

// URLEncodeStep

extension URLEncodeStep: Copying {
    public func copy() -> URLEncodeStep {
        return URLEncodeStep(
            value: value
        )
    }
}

public extension URLEncodeStep {
    enum Properties: String, ViewProperty, CaseIterable {
        case value
        public var defaultValue: any EditableVariableValue {
            switch self {
            case .value: return URLEncodeStep.defaultValue(for: .value)
            }
        }
    }

    static func make(factory: (Properties) -> any EditableVariableValue) -> Self {
        .init(
            value: factory(.value) as! AnyValue
        )
    }

    static func makeDefault() -> Self {
        .init(
            value: Properties.value.defaultValue as! AnyValue
        )
    }

    func value(for property: Properties) -> any EditableVariableValue {
        switch property {
        case .value: return value
        }
    }

    func set(_ value: Any, for property: Properties) {
        switch property {
        case .value: self.value = value as! AnyValue
        }
    }
}

public extension VariableType {
    static var uRLEncodeStep: VariableType { .init(title: "URLEncodeStep") } // URLEncodeStep
}

public extension URLEncodeStep {
    internal enum CodingKeys: String, CodingKey {
        case value
    }

    convenience init(from decoder: Decoder) throws {
        let valueContainer = try decoder.container(keyedBy: CodingKeys.self)
        self.init(
            value: (try? valueContainer.decode(AnyValue.self, forKey: .value)) ?? Properties.value.defaultValue as! AnyValue
        )
    }

    func encode(to encoder: Encoder) throws {
        var container = encoder.container(keyedBy: CodingKeys.self)
        try container.encode(value, forKey: .value)
    }
}

// VariableStep

extension VariableStep: Copying {
    public func copy() -> VariableStep {
        return VariableStep(
            varName: varName,
            type: type
        )
    }
}

public extension VariableStep {
    enum Properties: String, ViewProperty, CaseIterable {
        case varName
        case type
        public var defaultValue: any EditableVariableValue {
            switch self {
            case .varName: return VariableStep.defaultValue(for: .varName)
            case .type: return VariableStep.defaultValue(for: .type)
            }
        }
    }

    static func make(factory: (Properties) -> any EditableVariableValue) -> Self {
        .init(
            varName: factory(.varName) as! AnyValue,
            type: factory(.type) as! VariableTypeValue
        )
    }

    static func makeDefault() -> Self {
        .init(
            varName: Properties.varName.defaultValue as! AnyValue,
            type: Properties.type.defaultValue as! VariableTypeValue
        )
    }

    func value(for property: Properties) -> any EditableVariableValue {
        switch property {
        case .varName: return varName
        case .type: return type
        }
    }

    func set(_ value: Any, for property: Properties) {
        switch property {
        case .varName: varName = value as! AnyValue
        case .type: type = value as! VariableTypeValue
        }
    }
}

public extension VariableType {
    static var variableStep: VariableType { .init(title: "VariableStep") } // VariableStep
}

public extension VariableStep {
    internal enum CodingKeys: String, CodingKey {
        case varName
        case type
    }

    convenience init(from decoder: Decoder) throws {
        let valueContainer = try decoder.container(keyedBy: CodingKeys.self)
        self.init(
            varName: (try? valueContainer.decode(AnyValue.self, forKey: .varName)) ?? Properties.varName.defaultValue as! AnyValue,
            type: (try? valueContainer.decode(VariableTypeValue.self, forKey: .type)) ?? Properties.type.defaultValue as! VariableTypeValue
        )
    }

    func encode(to encoder: Encoder) throws {
        var container = encoder.container(keyedBy: CodingKeys.self)
        try container.encode(varName, forKey: .varName)
        try container.encode(type, forKey: .type)
    }
}

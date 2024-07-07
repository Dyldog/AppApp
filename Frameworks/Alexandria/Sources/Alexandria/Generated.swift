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
        VariableStep.self
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
    TextAlignmentValue.self
    ]
    }
    public static var views: [any MakeableView.Type] {
    [
    MakeableButton.self,
    MakeableField.self,
    MakeableList.self,
    MakeableMap.self,
    MakeableToggle.self
    ]
    }
}

import Armstrong
import DylKit




import SwiftUI
import DylKit



extension MakeableButton {
    public func make(isRunning: Bool, showEditControls: Bool, scope: Scope, onContentUpdate: @escaping (any MakeableView) -> Void, onRuntimeUpdate: @escaping (@escaping Block) -> Void, error: Binding<VariableValueError?>) -> AnyView {
        MakeableButtonView(isRunning: isRunning, showEditControls: showEditControls, scope: scope, button: self, onContentUpdate: onContentUpdate, onRuntimeUpdate: onRuntimeUpdate, error: error).any
    }
}
extension MakeableField {
    public func make(isRunning: Bool, showEditControls: Bool, scope: Scope, onContentUpdate: @escaping (any MakeableView) -> Void, onRuntimeUpdate: @escaping (@escaping Block) -> Void, error: Binding<VariableValueError?>) -> AnyView {
        MakeableFieldView(isRunning: isRunning, showEditControls: showEditControls, scope: scope, field: self, onContentUpdate: onContentUpdate, onRuntimeUpdate: onRuntimeUpdate, error: error).any
    }
}
extension MakeableList {
    public func make(isRunning: Bool, showEditControls: Bool, scope: Scope, onContentUpdate: @escaping (any MakeableView) -> Void, onRuntimeUpdate: @escaping (@escaping Block) -> Void, error: Binding<VariableValueError?>) -> AnyView {
        MakeableListView(isRunning: isRunning, showEditControls: showEditControls, scope: scope, listView: self, onContentUpdate: onContentUpdate, onRuntimeUpdate: onRuntimeUpdate, error: error).any
    }
}
extension MakeableMap {
    public func make(isRunning: Bool, showEditControls: Bool, scope: Scope, onContentUpdate: @escaping (any MakeableView) -> Void, onRuntimeUpdate: @escaping (@escaping Block) -> Void, error: Binding<VariableValueError?>) -> AnyView {
        MakeableMapView(isRunning: isRunning, showEditControls: showEditControls, scope: scope, map: self, onContentUpdate: onContentUpdate, onRuntimeUpdate: onRuntimeUpdate, error: error).any
    }
}
extension MakeableToggle {
    public func make(isRunning: Bool, showEditControls: Bool, scope: Scope, onContentUpdate: @escaping (any MakeableView) -> Void, onRuntimeUpdate: @escaping (@escaping Block) -> Void, error: Binding<VariableValueError?>) -> AnyView {
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
    public func add(_ other: VariableValue) throws -> VariableValue {
        throw VariableValueError.variableCannotPerformOperation(Self.type, "add")
    }
    public var protoString: String { "\(value.title)" }
    public var valueString: String { protoString }
    public func value(with variables: Variables, and scope: Scope) throws -> VariableValue {
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

extension VariableType {
    public static var buttonStyle: VariableType { .init(title: "ButtonStyle") } // ButtonStyle
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
    public func add(_ other: VariableValue) throws -> VariableValue {
        throw VariableValueError.variableCannotPerformOperation(Self.type, "add")
    }
    public var protoString: String { "\(value.title)" }
    public var valueString: String { protoString }
    public func value(with variables: Variables, and scope: Scope) throws -> VariableValue {
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

extension VariableType {
    public static var textAlignment: VariableType { .init(title: "TextAlignment") } // TextAlignment
}








// APIValueStep

extension APIValueStep: Copying {
    public func copy() -> APIValueStep {
        return APIValueStep(
                    url: url
        )
    }
}

extension APIValueStep {
     public enum Properties: String, ViewProperty, CaseIterable {
        case url
        public var defaultValue: any EditableVariableValue {
            switch self {
            case .url: return APIValueStep.defaultValue(for: .url)
            }
        }
    }
    public static func make(factory: (Properties) -> any EditableVariableValue) -> Self {
        .init(
            url: factory(.url) as! AnyValue
        )
    }

    public static func makeDefault() -> Self {
        .init(
            url: Properties.url.defaultValue as! AnyValue
        )
    }
    public func value(for property: Properties) -> any EditableVariableValue {
        switch property {
            case .url: return url
        }
    }

    public func set(_ value: Any, for property: Properties) {
        switch property {
            case .url: self.url = value as! AnyValue
        }
    }
}

extension VariableType {
    public static var aPIStep: VariableType { .init(title: "APIStep") } // APIValueStep
}

extension APIValueStep {
    enum CodingKeys: String, CodingKey {
        case url
    }

    public convenience init(from decoder: Decoder) throws {
        let valueContainer = try decoder.container(keyedBy: CodingKeys.self)
        self.init(
            url: (try? valueContainer.decode(AnyValue.self, forKey: .url)) ?? Properties.url.defaultValue as! AnyValue
        )
    }
    public func encode(to encoder: Encoder) throws {
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

extension AddToVarStep {
     public enum Properties: String, ViewProperty, CaseIterable {
        case varName
        case value
        public var defaultValue: any EditableVariableValue {
            switch self {
            case .varName: return AddToVarStep.defaultValue(for: .varName)
            case .value: return AddToVarStep.defaultValue(for: .value)
            }
        }
    }
    public static func make(factory: (Properties) -> any EditableVariableValue) -> Self {
        .init(
            varName: factory(.varName) as! AnyValue,
            value: factory(.value) as! AnyValue
        )
    }

    public static func makeDefault() -> Self {
        .init(
            varName: Properties.varName.defaultValue as! AnyValue,
            value: Properties.value.defaultValue as! AnyValue
        )
    }
    public func value(for property: Properties) -> any EditableVariableValue {
        switch property {
            case .varName: return varName
            case .value: return value
        }
    }

    public func set(_ value: Any, for property: Properties) {
        switch property {
            case .varName: self.varName = value as! AnyValue
            case .value: self.value = value as! AnyValue
        }
    }
}

extension VariableType {
    public static var addToVarStep: VariableType { .init(title: "AddToVarStep") } // AddToVarStep
}

extension AddToVarStep {
    enum CodingKeys: String, CodingKey {
        case varName
        case value
    }

    public convenience init(from decoder: Decoder) throws {
        let valueContainer = try decoder.container(keyedBy: CodingKeys.self)
        self.init(
            varName: (try? valueContainer.decode(AnyValue.self, forKey: .varName)) ?? Properties.varName.defaultValue as! AnyValue,
            value: (try? valueContainer.decode(AnyValue.self, forKey: .value)) ?? Properties.value.defaultValue as! AnyValue
        )
    }
    public func encode(to encoder: Encoder) throws {
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

extension ArrayValueStep {
     public enum Properties: String, ViewProperty, CaseIterable {
        case array
        case index
        public var defaultValue: any EditableVariableValue {
            switch self {
            case .array: return ArrayValueStep.defaultValue(for: .array)
            case .index: return ArrayValueStep.defaultValue(for: .index)
            }
        }
    }
    public static func make(factory: (Properties) -> any EditableVariableValue) -> Self {
        .init(
            array: factory(.array) as! AnyValue,
            index: factory(.index) as! AnyValue
        )
    }

    public static func makeDefault() -> Self {
        .init(
            array: Properties.array.defaultValue as! AnyValue,
            index: Properties.index.defaultValue as! AnyValue
        )
    }
    public func value(for property: Properties) -> any EditableVariableValue {
        switch property {
            case .array: return array
            case .index: return index
        }
    }

    public func set(_ value: Any, for property: Properties) {
        switch property {
            case .array: self.array = value as! AnyValue
            case .index: self.index = value as! AnyValue
        }
    }
}

extension VariableType {
    public static var arrayStep: VariableType { .init(title: "ArrayStep") } // ArrayValueStep
}

extension ArrayValueStep {
    enum CodingKeys: String, CodingKey {
        case array
        case index
    }

    public convenience init(from decoder: Decoder) throws {
        let valueContainer = try decoder.container(keyedBy: CodingKeys.self)
        self.init(
            array: (try? valueContainer.decode(AnyValue.self, forKey: .array)) ?? Properties.array.defaultValue as! AnyValue,
            index: (try? valueContainer.decode(AnyValue.self, forKey: .index)) ?? Properties.index.defaultValue as! AnyValue
        )
    }
    public func encode(to encoder: Encoder) throws {
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


extension VariableType {
    public static var comparisonType: VariableType { .init(title: "ComparisonType") } // ComparisonTypeValue
}

extension ComparisonTypeValue {
    enum CodingKeys: String, CodingKey {
        case value
    }

    public convenience init(from decoder: Decoder) throws {
        let valueContainer = try decoder.container(keyedBy: CodingKeys.self)
        self.init(
            value: (try? valueContainer.decode(ComparisonType.self, forKey: .value)) ?? Self.makeDefault().value
        )
    }
    public func encode(to encoder: Encoder) throws {
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

extension ComparisonValue {
     public enum Properties: String, ViewProperty, CaseIterable {
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
    public static func make(factory: (Properties) -> any EditableVariableValue) -> Self {
        .init(
            lhs: factory(.lhs) as! AnyValue,
            rhs: factory(.rhs) as! AnyValue,
            comparison: factory(.comparison) as! ComparisonTypeValue
        )
    }

    public static func makeDefault() -> Self {
        .init(
            lhs: Properties.lhs.defaultValue as! AnyValue,
            rhs: Properties.rhs.defaultValue as! AnyValue,
            comparison: Properties.comparison.defaultValue as! ComparisonTypeValue
        )
    }
    public func value(for property: Properties) -> any EditableVariableValue {
        switch property {
            case .lhs: return lhs
            case .rhs: return rhs
            case .comparison: return comparison
        }
    }

    public func set(_ value: Any, for property: Properties) {
        switch property {
            case .lhs: self.lhs = value as! AnyValue
            case .rhs: self.rhs = value as! AnyValue
            case .comparison: self.comparison = value as! ComparisonTypeValue
        }
    }
}

extension VariableType {
    public static var comparison: VariableType { .init(title: "Comparison") } // ComparisonValue
}

extension ComparisonValue {
    enum CodingKeys: String, CodingKey {
        case lhs
        case rhs
        case comparison
    }

    public convenience init(from decoder: Decoder) throws {
        let valueContainer = try decoder.container(keyedBy: CodingKeys.self)
        self.init(
            lhs: (try? valueContainer.decode(AnyValue.self, forKey: .lhs)) ?? Properties.lhs.defaultValue as! AnyValue,
            rhs: (try? valueContainer.decode(AnyValue.self, forKey: .rhs)) ?? Properties.rhs.defaultValue as! AnyValue,
            comparison: (try? valueContainer.decode(ComparisonTypeValue.self, forKey: .comparison)) ?? Properties.comparison.defaultValue as! ComparisonTypeValue
        )
    }
    public func encode(to encoder: Encoder) throws {
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

extension ConditionalActionValue {
     public enum Properties: String, ViewProperty, CaseIterable {
        case ifCondition
        case ifSteps
        public var defaultValue: any EditableVariableValue {
            switch self {
            case .ifCondition: return ConditionalActionValue.defaultValue(for: .ifCondition)
            case .ifSteps: return ConditionalActionValue.defaultValue(for: .ifSteps)
            }
        }
    }
    public static func make(factory: (Properties) -> any EditableVariableValue) -> Self {
        .init(
            ifCondition: factory(.ifCondition) as! ComparisonValue,
            ifSteps: factory(.ifSteps) as! StepArray
        )
    }

    public static func makeDefault() -> Self {
        .init(
            ifCondition: Properties.ifCondition.defaultValue as! ComparisonValue,
            ifSteps: Properties.ifSteps.defaultValue as! StepArray
        )
    }
    public func value(for property: Properties) -> any EditableVariableValue {
        switch property {
            case .ifCondition: return ifCondition
            case .ifSteps: return ifSteps
        }
    }

    public func set(_ value: Any, for property: Properties) {
        switch property {
            case .ifCondition: self.ifCondition = value as! ComparisonValue
            case .ifSteps: self.ifSteps = value as! StepArray
        }
    }
}

extension VariableType {
    public static var conditionalAction: VariableType { .init(title: "ConditionalAction") } // ConditionalActionValue
}

extension ConditionalActionValue {
    enum CodingKeys: String, CodingKey {
        case ifCondition
        case ifSteps
    }

    public convenience init(from decoder: Decoder) throws {
        let valueContainer = try decoder.container(keyedBy: CodingKeys.self)
        self.init(
            ifCondition: (try? valueContainer.decode(ComparisonValue.self, forKey: .ifCondition)) ?? Properties.ifCondition.defaultValue as! ComparisonValue,
            ifSteps: (try? valueContainer.decode(StepArray.self, forKey: .ifSteps)) ?? Properties.ifSteps.defaultValue as! StepArray
        )
    }
    public func encode(to encoder: Encoder) throws {
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

extension DecodeArrayStep {
     public enum Properties: String, ViewProperty, CaseIterable {
        case value
        public var defaultValue: any EditableVariableValue {
            switch self {
            case .value: return DecodeArrayStep.defaultValue(for: .value)
            }
        }
    }
    public static func make(factory: (Properties) -> any EditableVariableValue) -> Self {
        .init(
            value: factory(.value) as! TypedValue<IntValue>
        )
    }

    public static func makeDefault() -> Self {
        .init(
            value: Properties.value.defaultValue as! TypedValue<IntValue>
        )
    }
    public func value(for property: Properties) -> any EditableVariableValue {
        switch property {
            case .value: return value
        }
    }

    public func set(_ value: Any, for property: Properties) {
        switch property {
            case .value: self.value = value as! TypedValue<IntValue>
        }
    }
}

extension VariableType {
    public static var decodeArrayStep: VariableType { .init(title: "DecodeArrayStep") } // DecodeArrayStep
}

extension DecodeArrayStep {
    enum CodingKeys: String, CodingKey {
        case value
    }

    public convenience init(from decoder: Decoder) throws {
        let valueContainer = try decoder.container(keyedBy: CodingKeys.self)
        self.init(
            value: (try? valueContainer.decode(TypedValue<IntValue>.self, forKey: .value)) ?? Properties.value.defaultValue as! TypedValue<IntValue>
        )
    }
    public func encode(to encoder: Encoder) throws {
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

extension DecodeDictionaryStep {
     public enum Properties: String, ViewProperty, CaseIterable {
        case value
        public var defaultValue: any EditableVariableValue {
            switch self {
            case .value: return DecodeDictionaryStep.defaultValue(for: .value)
            }
        }
    }
    public static func make(factory: (Properties) -> any EditableVariableValue) -> Self {
        .init(
            value: factory(.value) as! AnyValue
        )
    }

    public static func makeDefault() -> Self {
        .init(
            value: Properties.value.defaultValue as! AnyValue
        )
    }
    public func value(for property: Properties) -> any EditableVariableValue {
        switch property {
            case .value: return value
        }
    }

    public func set(_ value: Any, for property: Properties) {
        switch property {
            case .value: self.value = value as! AnyValue
        }
    }
}

extension VariableType {
    public static var decodeDictionaryStep: VariableType { .init(title: "DecodeDictionaryStep") } // DecodeDictionaryStep
}

extension DecodeDictionaryStep {
    enum CodingKeys: String, CodingKey {
        case value
    }

    public convenience init(from decoder: Decoder) throws {
        let valueContainer = try decoder.container(keyedBy: CodingKeys.self)
        self.init(
            value: (try? valueContainer.decode(AnyValue.self, forKey: .value)) ?? Properties.value.defaultValue as! AnyValue
        )
    }
    public func encode(to encoder: Encoder) throws {
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

extension DictionaryKeysStep {
     public enum Properties: String, ViewProperty, CaseIterable {
        case dictionary
        public var defaultValue: any EditableVariableValue {
            switch self {
            case .dictionary: return DictionaryKeysStep.defaultValue(for: .dictionary)
            }
        }
    }
    public static func make(factory: (Properties) -> any EditableVariableValue) -> Self {
        .init(
            dictionary: factory(.dictionary) as! TypedValue<DictionaryValue>
        )
    }

    public static func makeDefault() -> Self {
        .init(
            dictionary: Properties.dictionary.defaultValue as! TypedValue<DictionaryValue>
        )
    }
    public func value(for property: Properties) -> any EditableVariableValue {
        switch property {
            case .dictionary: return dictionary
        }
    }

    public func set(_ value: Any, for property: Properties) {
        switch property {
            case .dictionary: self.dictionary = value as! TypedValue<DictionaryValue>
        }
    }
}

extension VariableType {
    public static var dictionaryKeysStep: VariableType { .init(title: "DictionaryKeysStep") } // DictionaryKeysStep
}

extension DictionaryKeysStep {
    enum CodingKeys: String, CodingKey {
        case dictionary
    }

    public convenience init(from decoder: Decoder) throws {
        let valueContainer = try decoder.container(keyedBy: CodingKeys.self)
        self.init(
            dictionary: (try? valueContainer.decode(TypedValue<DictionaryValue>.self, forKey: .dictionary)) ?? Properties.dictionary.defaultValue as! TypedValue<DictionaryValue>
        )
    }
    public func encode(to encoder: Encoder) throws {
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

extension DictionaryValueForKeyStep {
     public enum Properties: String, ViewProperty, CaseIterable {
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
    public static func make(factory: (Properties) -> any EditableVariableValue) -> Self {
        .init(
            dictionary: factory(.dictionary) as! TypedValue<DictionaryValue>,
            key: factory(.key) as! AnyValue,
            errorIfNotFound: factory(.errorIfNotFound) as! BoolValue
        )
    }

    public static func makeDefault() -> Self {
        .init(
            dictionary: Properties.dictionary.defaultValue as! TypedValue<DictionaryValue>,
            key: Properties.key.defaultValue as! AnyValue,
            errorIfNotFound: Properties.errorIfNotFound.defaultValue as! BoolValue
        )
    }
    public func value(for property: Properties) -> any EditableVariableValue {
        switch property {
            case .dictionary: return dictionary
            case .key: return key
            case .errorIfNotFound: return errorIfNotFound
        }
    }

    public func set(_ value: Any, for property: Properties) {
        switch property {
            case .dictionary: self.dictionary = value as! TypedValue<DictionaryValue>
            case .key: self.key = value as! AnyValue
            case .errorIfNotFound: self.errorIfNotFound = value as! BoolValue
        }
    }
}

extension VariableType {
    public static var dictionaryForKeyStep: VariableType { .init(title: "DictionaryForKeyStep") } // DictionaryValueForKeyStep
}

extension DictionaryValueForKeyStep {
    enum CodingKeys: String, CodingKey {
        case dictionary
        case key
        case errorIfNotFound
    }

    public convenience init(from decoder: Decoder) throws {
        let valueContainer = try decoder.container(keyedBy: CodingKeys.self)
        self.init(
            dictionary: (try? valueContainer.decode(TypedValue<DictionaryValue>.self, forKey: .dictionary)) ?? Properties.dictionary.defaultValue as! TypedValue<DictionaryValue>,
            key: (try? valueContainer.decode(AnyValue.self, forKey: .key)) ?? Properties.key.defaultValue as! AnyValue,
            errorIfNotFound: (try? valueContainer.decode(BoolValue.self, forKey: .errorIfNotFound)) ?? Properties.errorIfNotFound.defaultValue as! BoolValue
        )
    }
    public func encode(to encoder: Encoder) throws {
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

extension ForEachStep {
     public enum Properties: String, ViewProperty, CaseIterable {
        case values
        case loop
        public var defaultValue: any EditableVariableValue {
            switch self {
            case .values: return ForEachStep.defaultValue(for: .values)
            case .loop: return ForEachStep.defaultValue(for: .loop)
            }
        }
    }
    public static func make(factory: (Properties) -> any EditableVariableValue) -> Self {
        .init(
            values: factory(.values) as! TypedValue<ArrayValue>,
            loop: factory(.loop) as! StepArray
        )
    }

    public static func makeDefault() -> Self {
        .init(
            values: Properties.values.defaultValue as! TypedValue<ArrayValue>,
            loop: Properties.loop.defaultValue as! StepArray
        )
    }
    public func value(for property: Properties) -> any EditableVariableValue {
        switch property {
            case .values: return values
            case .loop: return loop
        }
    }

    public func set(_ value: Any, for property: Properties) {
        switch property {
            case .values: self.values = value as! TypedValue<ArrayValue>
            case .loop: self.loop = value as! StepArray
        }
    }
}

extension VariableType {
    public static var forEachStep: VariableType { .init(title: "ForEachStep") } // ForEachStep
}

extension ForEachStep {
    enum CodingKeys: String, CodingKey {
        case values
        case loop
    }

    public convenience init(from decoder: Decoder) throws {
        let valueContainer = try decoder.container(keyedBy: CodingKeys.self)
        self.init(
            values: (try? valueContainer.decode(TypedValue<ArrayValue>.self, forKey: .values)) ?? Properties.values.defaultValue as! TypedValue<ArrayValue>,
            loop: (try? valueContainer.decode(StepArray.self, forKey: .loop)) ?? Properties.loop.defaultValue as! StepArray
        )
    }
    public func encode(to encoder: Encoder) throws {
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

extension FunctionStep {
     public enum Properties: String, ViewProperty, CaseIterable {
        case functionName
        public var defaultValue: any EditableVariableValue {
            switch self {
            case .functionName: return FunctionStep.defaultValue(for: .functionName)
            }
        }
    }
    public static func make(factory: (Properties) -> any EditableVariableValue) -> Self {
        .init(
            functionName: factory(.functionName) as! AnyValue
        )
    }

    public static func makeDefault() -> Self {
        .init(
            functionName: Properties.functionName.defaultValue as! AnyValue
        )
    }
    public func value(for property: Properties) -> any EditableVariableValue {
        switch property {
            case .functionName: return functionName
        }
    }

    public func set(_ value: Any, for property: Properties) {
        switch property {
            case .functionName: self.functionName = value as! AnyValue
        }
    }
}

extension VariableType {
    public static var functionStep: VariableType { .init(title: "FunctionStep") } // FunctionStep
}

extension FunctionStep {
    enum CodingKeys: String, CodingKey {
        case functionName
    }

    public convenience init(from decoder: Decoder) throws {
        let valueContainer = try decoder.container(keyedBy: CodingKeys.self)
        self.init(
            functionName: (try? valueContainer.decode(AnyValue.self, forKey: .functionName)) ?? Properties.functionName.defaultValue as! AnyValue
        )
    }
    public func encode(to encoder: Encoder) throws {
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

extension FunctionValue {
     public enum Properties: String, ViewProperty, CaseIterable {
        case arguments
        case body
        public var defaultValue: any EditableVariableValue {
            switch self {
            case .arguments: return FunctionValue.defaultValue(for: .arguments)
            case .body: return FunctionValue.defaultValue(for: .body)
            }
        }
    }
    public static func make(factory: (Properties) -> any EditableVariableValue) -> Self {
        .init(
            arguments: factory(.arguments) as! TypedValue<DictionaryValue>,
            body: factory(.body) as! TypedValue<StepArray>
        )
    }

    public static func makeDefault() -> Self {
        .init(
            arguments: Properties.arguments.defaultValue as! TypedValue<DictionaryValue>,
            body: Properties.body.defaultValue as! TypedValue<StepArray>
        )
    }
    public func value(for property: Properties) -> any EditableVariableValue {
        switch property {
            case .arguments: return arguments
            case .body: return body
        }
    }

    public func set(_ value: Any, for property: Properties) {
        switch property {
            case .arguments: self.arguments = value as! TypedValue<DictionaryValue>
            case .body: self.body = value as! TypedValue<StepArray>
        }
    }
}

extension VariableType {
    public static var function: VariableType { .init(title: "Function") } // FunctionValue
}

extension FunctionValue {
    enum CodingKeys: String, CodingKey {
        case arguments
        case body
    }

    public convenience init(from decoder: Decoder) throws {
        let valueContainer = try decoder.container(keyedBy: CodingKeys.self)
        self.init(
            arguments: (try? valueContainer.decode(TypedValue<DictionaryValue>.self, forKey: .arguments)) ?? Properties.arguments.defaultValue as! TypedValue<DictionaryValue>,
            body: (try? valueContainer.decode(TypedValue<StepArray>.self, forKey: .body)) ?? Properties.body.defaultValue as! TypedValue<StepArray>
        )
    }
    public func encode(to encoder: Encoder) throws {
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

extension GetNumberStep {
     public enum Properties: String, ViewProperty, CaseIterable {
        case value
        case numberType
        public var defaultValue: any EditableVariableValue {
            switch self {
            case .value: return GetNumberStep.defaultValue(for: .value)
            case .numberType: return GetNumberStep.defaultValue(for: .numberType)
            }
        }
    }
    public static func make(factory: (Properties) -> any EditableVariableValue) -> Self {
        .init(
            value: factory(.value) as! AnyValue,
            numberType: factory(.numberType) as! NumericTypeValue
        )
    }

    public static func makeDefault() -> Self {
        .init(
            value: Properties.value.defaultValue as! AnyValue,
            numberType: Properties.numberType.defaultValue as! NumericTypeValue
        )
    }
    public func value(for property: Properties) -> any EditableVariableValue {
        switch property {
            case .value: return value
            case .numberType: return numberType
        }
    }

    public func set(_ value: Any, for property: Properties) {
        switch property {
            case .value: self.value = value as! AnyValue
            case .numberType: self.numberType = value as! NumericTypeValue
        }
    }
}

extension VariableType {
    public static var getNumberStep: VariableType { .init(title: "GetNumberStep") } // GetNumberStep
}

extension GetNumberStep {
    enum CodingKeys: String, CodingKey {
        case value
        case numberType
    }

    public convenience init(from decoder: Decoder) throws {
        let valueContainer = try decoder.container(keyedBy: CodingKeys.self)
        self.init(
            value: (try? valueContainer.decode(AnyValue.self, forKey: .value)) ?? Properties.value.defaultValue as! AnyValue,
            numberType: (try? valueContainer.decode(NumericTypeValue.self, forKey: .numberType)) ?? Properties.numberType.defaultValue as! NumericTypeValue
        )
    }
    public func encode(to encoder: Encoder) throws {
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

extension GetSavedDataStep {
     public enum Properties: String, ViewProperty, CaseIterable {
        case key
        public var defaultValue: any EditableVariableValue {
            switch self {
            case .key: return GetSavedDataStep.defaultValue(for: .key)
            }
        }
    }
    public static func make(factory: (Properties) -> any EditableVariableValue) -> Self {
        .init(
            key: factory(.key) as! TypedValue<StringValue>
        )
    }

    public static func makeDefault() -> Self {
        .init(
            key: Properties.key.defaultValue as! TypedValue<StringValue>
        )
    }
    public func value(for property: Properties) -> any EditableVariableValue {
        switch property {
            case .key: return key
        }
    }

    public func set(_ value: Any, for property: Properties) {
        switch property {
            case .key: self.key = value as! TypedValue<StringValue>
        }
    }
}

extension VariableType {
    public static var getSavedDataStep: VariableType { .init(title: "GetSavedDataStep") } // GetSavedDataStep
}

extension GetSavedDataStep {
    enum CodingKeys: String, CodingKey {
        case key
    }

    public convenience init(from decoder: Decoder) throws {
        let valueContainer = try decoder.container(keyedBy: CodingKeys.self)
        self.init(
            key: (try? valueContainer.decode(TypedValue<StringValue>.self, forKey: .key)) ?? Properties.key.defaultValue as! TypedValue<StringValue>
        )
    }
    public func encode(to encoder: Encoder) throws {
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

extension IfStep {
     public enum Properties: String, ViewProperty, CaseIterable {
        case ifAction
        case elseAction
        public var defaultValue: any EditableVariableValue {
            switch self {
            case .ifAction: return IfStep.defaultValue(for: .ifAction)
            case .elseAction: return IfStep.defaultValue(for: .elseAction)
            }
        }
    }
    public static func make(factory: (Properties) -> any EditableVariableValue) -> Self {
        .init(
            ifAction: factory(.ifAction) as! ConditionalActionValue,
            elseAction: factory(.elseAction) as! StepArray
        )
    }

    public static func makeDefault() -> Self {
        .init(
            ifAction: Properties.ifAction.defaultValue as! ConditionalActionValue,
            elseAction: Properties.elseAction.defaultValue as! StepArray
        )
    }
    public func value(for property: Properties) -> any EditableVariableValue {
        switch property {
            case .ifAction: return ifAction
            case .elseAction: return elseAction
        }
    }

    public func set(_ value: Any, for property: Properties) {
        switch property {
            case .ifAction: self.ifAction = value as! ConditionalActionValue
            case .elseAction: self.elseAction = value as! StepArray
        }
    }
}

extension VariableType {
    public static var ifStep: VariableType { .init(title: "IfStep") } // IfStep
}

extension IfStep {
    enum CodingKeys: String, CodingKey {
        case ifAction
        case elseAction
    }

    public convenience init(from decoder: Decoder) throws {
        let valueContainer = try decoder.container(keyedBy: CodingKeys.self)
        self.init(
            ifAction: (try? valueContainer.decode(ConditionalActionValue.self, forKey: .ifAction)) ?? Properties.ifAction.defaultValue as! ConditionalActionValue,
            elseAction: (try? valueContainer.decode(StepArray.self, forKey: .elseAction)) ?? Properties.elseAction.defaultValue as! StepArray
        )
    }
    public func encode(to encoder: Encoder) throws {
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

extension LocationValue {
     public enum Properties: String, ViewProperty, CaseIterable {
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
    public static func make(factory: (Properties) -> any EditableVariableValue) -> Self {
        .init(
            name: factory(.name) as! TypedValue<StringValue>,
            latitude: factory(.latitude) as! TypedValue<FloatValue>,
            longitude: factory(.longitude) as! TypedValue<FloatValue>
        )
    }

    public static func makeDefault() -> Self {
        .init(
            name: Properties.name.defaultValue as! TypedValue<StringValue>,
            latitude: Properties.latitude.defaultValue as! TypedValue<FloatValue>,
            longitude: Properties.longitude.defaultValue as! TypedValue<FloatValue>
        )
    }
    public func value(for property: Properties) -> any EditableVariableValue {
        switch property {
            case .name: return name
            case .latitude: return latitude
            case .longitude: return longitude
        }
    }

    public func set(_ value: Any, for property: Properties) {
        switch property {
            case .name: self.name = value as! TypedValue<StringValue>
            case .latitude: self.latitude = value as! TypedValue<FloatValue>
            case .longitude: self.longitude = value as! TypedValue<FloatValue>
        }
    }
}

extension VariableType {
    public static var location: VariableType { .init(title: "Location") } // LocationValue
}

extension LocationValue {
    enum CodingKeys: String, CodingKey {
        case name
        case latitude
        case longitude
    }

    public convenience init(from decoder: Decoder) throws {
        let valueContainer = try decoder.container(keyedBy: CodingKeys.self)
        self.init(
            name: (try? valueContainer.decode(TypedValue<StringValue>.self, forKey: .name)) ?? Properties.name.defaultValue as! TypedValue<StringValue>,
            latitude: (try? valueContainer.decode(TypedValue<FloatValue>.self, forKey: .latitude)) ?? Properties.latitude.defaultValue as! TypedValue<FloatValue>,
            longitude: (try? valueContainer.decode(TypedValue<FloatValue>.self, forKey: .longitude)) ?? Properties.longitude.defaultValue as! TypedValue<FloatValue>
        )
    }
    public func encode(to encoder: Encoder) throws {
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

extension MakeRangeStep {
     public enum Properties: String, ViewProperty, CaseIterable {
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
    public static func make(factory: (Properties) -> any EditableVariableValue) -> Self {
        .init(
            start: factory(.start) as! any NumericValue,
            end: factory(.end) as! any NumericValue,
            step: factory(.step) as! any NumericValue
        )
    }

    public static func makeDefault() -> Self {
        .init(
            start: Properties.start.defaultValue as! any NumericValue,
            end: Properties.end.defaultValue as! any NumericValue,
            step: Properties.step.defaultValue as! any NumericValue
        )
    }
    public func value(for property: Properties) -> any EditableVariableValue {
        switch property {
            case .start: return start
            case .end: return end
            case .step: return step
        }
    }

    public func set(_ value: Any, for property: Properties) {
        switch property {
            case .start: self.start = value as! any NumericValue
            case .end: self.end = value as! any NumericValue
            case .step: self.step = value as! any NumericValue
        }
    }
}

extension VariableType {
    public static var makeRangeStep: VariableType { .init(title: "MakeRangeStep") } // MakeRangeStep
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

extension MakeableButton {
     public enum Properties: String, ViewProperty, CaseIterable {
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
    public static func make(factory: (Properties) -> any EditableVariableValue) -> Self {
        .init(
            id: UUID(),
            title: factory(.title) as! AnyMakeableView,
            style: factory(.style) as! ButtonStyleValue,
            action: factory(.action) as! FunctionValue
        )
    }

    public static func makeDefault() -> Self {
        .init(
            id: UUID(),
            title: Properties.title.defaultValue as! AnyMakeableView,
            style: Properties.style.defaultValue as! ButtonStyleValue,
            action: Properties.action.defaultValue as! FunctionValue
        )
    }
    public func value(for property: Properties) -> any EditableVariableValue {
        switch property {
            case .title: return title
            case .style: return style
            case .action: return action
        }
    }

    public func set(_ value: Any, for property: Properties) {
        switch property {
            case .title: self.title = value as! AnyMakeableView
            case .style: self.style = value as! ButtonStyleValue
            case .action: self.action = value as! FunctionValue
        }
    }
}

extension VariableType {
    public static var button: VariableType { .init(title: "Button") } // MakeableButton
}

extension MakeableButton {
    enum CodingKeys: String, CodingKey {
        case id
        case title
        case style
        case action
    }

    public convenience init(from decoder: Decoder) throws {
        let valueContainer = try decoder.container(keyedBy: CodingKeys.self)
        self.init(
            id: (try? valueContainer.decode(UUID.self, forKey: .id)) ?? UUID(),
            title: (try? valueContainer.decode(AnyMakeableView.self, forKey: .title)) ?? Properties.title.defaultValue as! AnyMakeableView,
            style: (try? valueContainer.decode(ButtonStyleValue.self, forKey: .style)) ?? Properties.style.defaultValue as! ButtonStyleValue,
            action: (try? valueContainer.decode(FunctionValue.self, forKey: .action)) ?? Properties.action.defaultValue as! FunctionValue
        )
    }
    public func encode(to encoder: Encoder) throws {
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

extension MakeableField {
     public enum Properties: String, ViewProperty, CaseIterable {
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
    public static func make(factory: (Properties) -> any EditableVariableValue) -> Self {
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

    public static func makeDefault() -> Self {
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
    public func value(for property: Properties) -> any EditableVariableValue {
        switch property {
            case .text: return text
            case .fontSize: return fontSize
            case .onTextUpdate: return onTextUpdate
            case .padding: return padding
            case .alignment: return alignment
            case .isMultiline: return isMultiline
        }
    }

    public func set(_ value: Any, for property: Properties) {
        switch property {
            case .text: self.text = value as! TemporaryValue
            case .fontSize: self.fontSize = value as! IntValue
            case .onTextUpdate: self.onTextUpdate = value as! StepArray
            case .padding: self.padding = value as! IntValue
            case .alignment: self.alignment = value as! TextAlignmentValue
            case .isMultiline: self.isMultiline = value as! BoolValue
        }
    }
}

extension VariableType {
    public static var field: VariableType { .init(title: "Field") } // MakeableField
}

extension MakeableField {
    enum CodingKeys: String, CodingKey {
        case id
        case text
        case fontSize
        case onTextUpdate
        case padding
        case alignment
        case isMultiline
    }

    public convenience init(from decoder: Decoder) throws {
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
    public func encode(to encoder: Encoder) throws {
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

extension MakeableList {
     public enum Properties: String, ViewProperty, CaseIterable {
        case data
        case view
        public var defaultValue: any EditableVariableValue {
            switch self {
            case .data: return MakeableList.defaultValue(for: .data)
            case .view: return MakeableList.defaultValue(for: .view)
            }
        }
    }
    public static func make(factory: (Properties) -> any EditableVariableValue) -> Self {
        .init(
            id: UUID(),
            data: factory(.data) as! TypedValue<ArrayValue>,
            view: factory(.view) as! AnyMakeableView
        )
    }

    public static func makeDefault() -> Self {
        .init(
            id: UUID(),
            data: Properties.data.defaultValue as! TypedValue<ArrayValue>,
            view: Properties.view.defaultValue as! AnyMakeableView
        )
    }
    public func value(for property: Properties) -> any EditableVariableValue {
        switch property {
            case .data: return data
            case .view: return view
        }
    }

    public func set(_ value: Any, for property: Properties) {
        switch property {
            case .data: self.data = value as! TypedValue<ArrayValue>
            case .view: self.view = value as! AnyMakeableView
        }
    }
}

extension VariableType {
    public static var listView: VariableType { .init(title: "listView") } // MakeableList
}

extension MakeableList {
    enum CodingKeys: String, CodingKey {
        case id
        case data
        case view
    }

    public convenience init(from decoder: Decoder) throws {
        let valueContainer = try decoder.container(keyedBy: CodingKeys.self)
        self.init(
            id: (try? valueContainer.decode(UUID.self, forKey: .id)) ?? UUID(),
            data: (try? valueContainer.decode(TypedValue<ArrayValue>.self, forKey: .data)) ?? Properties.data.defaultValue as! TypedValue<ArrayValue>,
            view: (try? valueContainer.decode(AnyMakeableView.self, forKey: .view)) ?? Properties.view.defaultValue as! AnyMakeableView
        )
    }
    public func encode(to encoder: Encoder) throws {
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

extension MakeableMap {
     public enum Properties: String, ViewProperty, CaseIterable {
        case locations
        case zoomFollowsNewAnnotations
        public var defaultValue: any EditableVariableValue {
            switch self {
            case .locations: return MakeableMap.defaultValue(for: .locations)
            case .zoomFollowsNewAnnotations: return MakeableMap.defaultValue(for: .zoomFollowsNewAnnotations)
            }
        }
    }
    public static func make(factory: (Properties) -> any EditableVariableValue) -> Self {
        .init(
            id: UUID(),
            locations: factory(.locations) as! TypedValue<ArrayValue>,
            zoomFollowsNewAnnotations: factory(.zoomFollowsNewAnnotations) as! BoolValue
        )
    }

    public static func makeDefault() -> Self {
        .init(
            id: UUID(),
            locations: Properties.locations.defaultValue as! TypedValue<ArrayValue>,
            zoomFollowsNewAnnotations: Properties.zoomFollowsNewAnnotations.defaultValue as! BoolValue
        )
    }
    public func value(for property: Properties) -> any EditableVariableValue {
        switch property {
            case .locations: return locations
            case .zoomFollowsNewAnnotations: return zoomFollowsNewAnnotations
        }
    }

    public func set(_ value: Any, for property: Properties) {
        switch property {
            case .locations: self.locations = value as! TypedValue<ArrayValue>
            case .zoomFollowsNewAnnotations: self.zoomFollowsNewAnnotations = value as! BoolValue
        }
    }
}

extension VariableType {
    public static var map: VariableType { .init(title: "Map") } // MakeableMap
}

extension MakeableMap {
    enum CodingKeys: String, CodingKey {
        case id
        case locations
        case zoomFollowsNewAnnotations
    }

    public convenience init(from decoder: Decoder) throws {
        let valueContainer = try decoder.container(keyedBy: CodingKeys.self)
        self.init(
            id: (try? valueContainer.decode(UUID.self, forKey: .id)) ?? UUID(),
            locations: (try? valueContainer.decode(TypedValue<ArrayValue>.self, forKey: .locations)) ?? Properties.locations.defaultValue as! TypedValue<ArrayValue>,
            zoomFollowsNewAnnotations: (try? valueContainer.decode(BoolValue.self, forKey: .zoomFollowsNewAnnotations)) ?? Properties.zoomFollowsNewAnnotations.defaultValue as! BoolValue
        )
    }
    public func encode(to encoder: Encoder) throws {
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

extension MakeableToggle {
     public enum Properties: String, ViewProperty, CaseIterable {
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
    public static func make(factory: (Properties) -> any EditableVariableValue) -> Self {
        .init(
            id: UUID(),
            isOn: factory(.isOn) as! TemporaryValue,
            onToggleUpdate: factory(.onToggleUpdate) as! StepArray,
            padding: factory(.padding) as! IntValue
        )
    }

    public static func makeDefault() -> Self {
        .init(
            id: UUID(),
            isOn: Properties.isOn.defaultValue as! TemporaryValue,
            onToggleUpdate: Properties.onToggleUpdate.defaultValue as! StepArray,
            padding: Properties.padding.defaultValue as! IntValue
        )
    }
    public func value(for property: Properties) -> any EditableVariableValue {
        switch property {
            case .isOn: return isOn
            case .onToggleUpdate: return onToggleUpdate
            case .padding: return padding
        }
    }

    public func set(_ value: Any, for property: Properties) {
        switch property {
            case .isOn: self.isOn = value as! TemporaryValue
            case .onToggleUpdate: self.onToggleUpdate = value as! StepArray
            case .padding: self.padding = value as! IntValue
        }
    }
}

extension VariableType {
    public static var toggle: VariableType { .init(title: "Toggle") } // MakeableToggle
}

extension MakeableToggle {
    enum CodingKeys: String, CodingKey {
        case id
        case isOn
        case onToggleUpdate
        case padding
    }

    public convenience init(from decoder: Decoder) throws {
        let valueContainer = try decoder.container(keyedBy: CodingKeys.self)
        self.init(
            id: (try? valueContainer.decode(UUID.self, forKey: .id)) ?? UUID(),
            isOn: (try? valueContainer.decode(TemporaryValue.self, forKey: .isOn)) ?? Properties.isOn.defaultValue as! TemporaryValue,
            onToggleUpdate: (try? valueContainer.decode(StepArray.self, forKey: .onToggleUpdate)) ?? Properties.onToggleUpdate.defaultValue as! StepArray,
            padding: (try? valueContainer.decode(IntValue.self, forKey: .padding)) ?? Properties.padding.defaultValue as! IntValue
        )
    }
    public func encode(to encoder: Encoder) throws {
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

extension MapStep {
     public enum Properties: String, ViewProperty, CaseIterable {
        case value
        case mapper
        public var defaultValue: any EditableVariableValue {
            switch self {
            case .value: return MapStep.defaultValue(for: .value)
            case .mapper: return MapStep.defaultValue(for: .mapper)
            }
        }
    }
    public static func make(factory: (Properties) -> any EditableVariableValue) -> Self {
        .init(
            value: factory(.value) as! TypedValue<ArrayValue>,
            mapper: factory(.mapper) as! StepArray
        )
    }

    public static func makeDefault() -> Self {
        .init(
            value: Properties.value.defaultValue as! TypedValue<ArrayValue>,
            mapper: Properties.mapper.defaultValue as! StepArray
        )
    }
    public func value(for property: Properties) -> any EditableVariableValue {
        switch property {
            case .value: return value
            case .mapper: return mapper
        }
    }

    public func set(_ value: Any, for property: Properties) {
        switch property {
            case .value: self.value = value as! TypedValue<ArrayValue>
            case .mapper: self.mapper = value as! StepArray
        }
    }
}

extension VariableType {
    public static var mapStep: VariableType { .init(title: "MapStep") } // MapStep
}

extension MapStep {
    enum CodingKeys: String, CodingKey {
        case value
        case mapper
    }

    public convenience init(from decoder: Decoder) throws {
        let valueContainer = try decoder.container(keyedBy: CodingKeys.self)
        self.init(
            value: (try? valueContainer.decode(TypedValue<ArrayValue>.self, forKey: .value)) ?? Properties.value.defaultValue as! TypedValue<ArrayValue>,
            mapper: (try? valueContainer.decode(StepArray.self, forKey: .mapper)) ?? Properties.mapper.defaultValue as! StepArray
        )
    }
    public func encode(to encoder: Encoder) throws {
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


extension VariableType {
    public static var optional: VariableType { .init(title: "Optional") } // OptionalValue
}

extension OptionalValue {
    enum CodingKeys: String, CodingKey {
        case value
    }

    public convenience init(from decoder: Decoder) throws {
        let valueContainer = try decoder.container(keyedBy: CodingKeys.self)
        self.init(
            value: (try? valueContainer.decode(AnyValue.self, forKey: .value)) ?? Self.makeDefault().value
        )
    }
    public func encode(to encoder: Encoder) throws {
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

extension PrintVarStep {
     public enum Properties: String, ViewProperty, CaseIterable {
        case varName
        public var defaultValue: any EditableVariableValue {
            switch self {
            case .varName: return PrintVarStep.defaultValue(for: .varName)
            }
        }
    }
    public static func make(factory: (Properties) -> any EditableVariableValue) -> Self {
        .init(
            varName: factory(.varName) as! AnyValue
        )
    }

    public static func makeDefault() -> Self {
        .init(
            varName: Properties.varName.defaultValue as! AnyValue
        )
    }
    public func value(for property: Properties) -> any EditableVariableValue {
        switch property {
            case .varName: return varName
        }
    }

    public func set(_ value: Any, for property: Properties) {
        switch property {
            case .varName: self.varName = value as! AnyValue
        }
    }
}

extension VariableType {
    public static var printVarStep: VariableType { .init(title: "PrintVarStep") } // PrintVarStep
}

extension PrintVarStep {
    enum CodingKeys: String, CodingKey {
        case varName
    }

    public convenience init(from decoder: Decoder) throws {
        let valueContainer = try decoder.container(keyedBy: CodingKeys.self)
        self.init(
            varName: (try? valueContainer.decode(AnyValue.self, forKey: .varName)) ?? Properties.varName.defaultValue as! AnyValue
        )
    }
    public func encode(to encoder: Encoder) throws {
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

extension RandomElementStep {
     public enum Properties: String, ViewProperty, CaseIterable {
        case array
        public var defaultValue: any EditableVariableValue {
            switch self {
            case .array: return RandomElementStep.defaultValue(for: .array)
            }
        }
    }
    public static func make(factory: (Properties) -> any EditableVariableValue) -> Self {
        .init(
            array: factory(.array) as! TypedValue<ArrayValue>
        )
    }

    public static func makeDefault() -> Self {
        .init(
            array: Properties.array.defaultValue as! TypedValue<ArrayValue>
        )
    }
    public func value(for property: Properties) -> any EditableVariableValue {
        switch property {
            case .array: return array
        }
    }

    public func set(_ value: Any, for property: Properties) {
        switch property {
            case .array: self.array = value as! TypedValue<ArrayValue>
        }
    }
}

extension VariableType {
    public static var randomElementStep: VariableType { .init(title: "RandomElementStep") } // RandomElementStep
}

extension RandomElementStep {
    enum CodingKeys: String, CodingKey {
        case array
    }

    public convenience init(from decoder: Decoder) throws {
        let valueContainer = try decoder.container(keyedBy: CodingKeys.self)
        self.init(
            array: (try? valueContainer.decode(TypedValue<ArrayValue>.self, forKey: .array)) ?? Properties.array.defaultValue as! TypedValue<ArrayValue>
        )
    }
    public func encode(to encoder: Encoder) throws {
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

extension SaveDataStep {
     public enum Properties: String, ViewProperty, CaseIterable {
        case key
        case data
        public var defaultValue: any EditableVariableValue {
            switch self {
            case .key: return SaveDataStep.defaultValue(for: .key)
            case .data: return SaveDataStep.defaultValue(for: .data)
            }
        }
    }
    public static func make(factory: (Properties) -> any EditableVariableValue) -> Self {
        .init(
            key: factory(.key) as! TypedValue<StringValue>,
            data: factory(.data) as! AnyValue
        )
    }

    public static func makeDefault() -> Self {
        .init(
            key: Properties.key.defaultValue as! TypedValue<StringValue>,
            data: Properties.data.defaultValue as! AnyValue
        )
    }
    public func value(for property: Properties) -> any EditableVariableValue {
        switch property {
            case .key: return key
            case .data: return data
        }
    }

    public func set(_ value: Any, for property: Properties) {
        switch property {
            case .key: self.key = value as! TypedValue<StringValue>
            case .data: self.data = value as! AnyValue
        }
    }
}

extension VariableType {
    public static var saveDataStep: VariableType { .init(title: "SaveDataStep") } // SaveDataStep
}

extension SaveDataStep {
    enum CodingKeys: String, CodingKey {
        case key
        case data
    }

    public convenience init(from decoder: Decoder) throws {
        let valueContainer = try decoder.container(keyedBy: CodingKeys.self)
        self.init(
            key: (try? valueContainer.decode(TypedValue<StringValue>.self, forKey: .key)) ?? Properties.key.defaultValue as! TypedValue<StringValue>,
            data: (try? valueContainer.decode(AnyValue.self, forKey: .data)) ?? Properties.data.defaultValue as! AnyValue
        )
    }
    public func encode(to encoder: Encoder) throws {
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

extension StaticValueStep {
     public enum Properties: String, ViewProperty, CaseIterable {
        case value
        public var defaultValue: any EditableVariableValue {
            switch self {
            case .value: return StaticValueStep.defaultValue(for: .value)
            }
        }
    }
    public static func make(factory: (Properties) -> any EditableVariableValue) -> Self {
        .init(
            value: factory(.value) as! AnyValue
        )
    }

    public static func makeDefault() -> Self {
        .init(
            value: Properties.value.defaultValue as! AnyValue
        )
    }
    public func value(for property: Properties) -> any EditableVariableValue {
        switch property {
            case .value: return value
        }
    }

    public func set(_ value: Any, for property: Properties) {
        switch property {
            case .value: self.value = value as! AnyValue
        }
    }
}

extension VariableType {
    public static var staticStep: VariableType { .init(title: "StaticStep") } // StaticValueStep
}

extension StaticValueStep {
    enum CodingKeys: String, CodingKey {
        case value
    }

    public convenience init(from decoder: Decoder) throws {
        let valueContainer = try decoder.container(keyedBy: CodingKeys.self)
        self.init(
            value: (try? valueContainer.decode(AnyValue.self, forKey: .value)) ?? Properties.value.defaultValue as! AnyValue
        )
    }
    public func encode(to encoder: Encoder) throws {
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

extension TemporaryValue {
     public enum Properties: String, ViewProperty, CaseIterable {
        case initial
        case output
        public var defaultValue: any EditableVariableValue {
            switch self {
            case .initial: return TemporaryValue.defaultValue(for: .initial)
            case .output: return TemporaryValue.defaultValue(for: .output)
            }
        }
    }
    public static func make(factory: (Properties) -> any EditableVariableValue) -> Self {
        .init(
            initial: factory(.initial) as! AnyValue,
            output: factory(.output) as! Variable
        )
    }

    public static func makeDefault() -> Self {
        .init(
            initial: Properties.initial.defaultValue as! AnyValue,
            output: Properties.output.defaultValue as! Variable
        )
    }
    public func value(for property: Properties) -> any EditableVariableValue {
        switch property {
            case .initial: return initial
            case .output: return output
        }
    }

    public func set(_ value: Any, for property: Properties) {
        switch property {
            case .initial: self.initial = value as! AnyValue
            case .output: self.output = value as! Variable
        }
    }
}

extension VariableType {
    public static var temporary: VariableType { .init(title: "Temporary") } // TemporaryValue
}


// URLEncodeStep

extension URLEncodeStep: Copying {
    public func copy() -> URLEncodeStep {
        return URLEncodeStep(
                    value: value
        )
    }
}

extension URLEncodeStep {
     public enum Properties: String, ViewProperty, CaseIterable {
        case value
        public var defaultValue: any EditableVariableValue {
            switch self {
            case .value: return URLEncodeStep.defaultValue(for: .value)
            }
        }
    }
    public static func make(factory: (Properties) -> any EditableVariableValue) -> Self {
        .init(
            value: factory(.value) as! AnyValue
        )
    }

    public static func makeDefault() -> Self {
        .init(
            value: Properties.value.defaultValue as! AnyValue
        )
    }
    public func value(for property: Properties) -> any EditableVariableValue {
        switch property {
            case .value: return value
        }
    }

    public func set(_ value: Any, for property: Properties) {
        switch property {
            case .value: self.value = value as! AnyValue
        }
    }
}

extension VariableType {
    public static var uRLEncodeStep: VariableType { .init(title: "URLEncodeStep") } // URLEncodeStep
}

extension URLEncodeStep {
    enum CodingKeys: String, CodingKey {
        case value
    }

    public convenience init(from decoder: Decoder) throws {
        let valueContainer = try decoder.container(keyedBy: CodingKeys.self)
        self.init(
            value: (try? valueContainer.decode(AnyValue.self, forKey: .value)) ?? Properties.value.defaultValue as! AnyValue
        )
    }
    public func encode(to encoder: Encoder) throws {
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

extension VariableStep {
     public enum Properties: String, ViewProperty, CaseIterable {
        case varName
        case type
        public var defaultValue: any EditableVariableValue {
            switch self {
            case .varName: return VariableStep.defaultValue(for: .varName)
            case .type: return VariableStep.defaultValue(for: .type)
            }
        }
    }
    public static func make(factory: (Properties) -> any EditableVariableValue) -> Self {
        .init(
            varName: factory(.varName) as! AnyValue,
            type: factory(.type) as! VariableTypeValue
        )
    }

    public static func makeDefault() -> Self {
        .init(
            varName: Properties.varName.defaultValue as! AnyValue,
            type: Properties.type.defaultValue as! VariableTypeValue
        )
    }
    public func value(for property: Properties) -> any EditableVariableValue {
        switch property {
            case .varName: return varName
            case .type: return type
        }
    }

    public func set(_ value: Any, for property: Properties) {
        switch property {
            case .varName: self.varName = value as! AnyValue
            case .type: self.type = value as! VariableTypeValue
        }
    }
}

extension VariableType {
    public static var variableStep: VariableType { .init(title: "VariableStep") } // VariableStep
}

extension VariableStep {
    enum CodingKeys: String, CodingKey {
        case varName
        case type
    }

    public convenience init(from decoder: Decoder) throws {
        let valueContainer = try decoder.container(keyedBy: CodingKeys.self)
        self.init(
            varName: (try? valueContainer.decode(AnyValue.self, forKey: .varName)) ?? Properties.varName.defaultValue as! AnyValue,
            type: (try? valueContainer.decode(VariableTypeValue.self, forKey: .type)) ?? Properties.type.defaultValue as! VariableTypeValue
        )
    }
    public func encode(to encoder: Encoder) throws {
        var container = encoder.container(keyedBy: CodingKeys.self)
        try container.encode(varName, forKey: .varName)
        try container.encode(type, forKey: .type)
    }
}














// Generated using Sourcery 2.1.2 — https://github.com/krzysztofzablocki/Sourcery
// DO NOT EDIT



extension APIValueStep: Copying {
    public func copy() -> APIValueStep {
        return APIValueStep(
                    url: url.copy() as! AnyValue
        )
    }
}
extension AddToVarStep: Copying {
    public func copy() -> AddToVarStep {
        return AddToVarStep(
                    varName: varName.copy() as! AnyValue,
                    value: value.copy() as! AnyValue
        )
    }
}
extension AnyMakeableView: Copying {
    public func copy() -> AnyMakeableView {
        return AnyMakeableView(
                    value: value
        )
    }
}
extension AnyValue: Copying {
    public func copy() -> AnyValue {
        return AnyValue(
                    value: value
        )
    }
}
extension ArrayValue: Copying {
    public func copy() -> ArrayValue {
        return ArrayValue(
                    type: type,
                    elements: elements
        )
    }
}
extension ArrayValueStep: Copying {
    public func copy() -> ArrayValueStep {
        return ArrayValueStep(
                    array: array.copy() as! AnyValue,
                    index: index.copy() as! AnyValue
        )
    }
}
extension BoolValue: Copying {
    public func copy() -> BoolValue {
        return BoolValue(
                    value: value
        )
    }
}
extension ColorValue: Copying {
    public func copy() -> ColorValue {
        return ColorValue(
                    value: value
        )
    }
}
extension ComparisonTypeValue: Copying {
    public func copy() -> ComparisonTypeValue {
        return ComparisonTypeValue(
                    value: value
        )
    }
}
extension ComparisonValue: Copying {
    public func copy() -> ComparisonValue {
        return ComparisonValue(
                    lhs: lhs.copy() as! AnyValue,
                    rhs: rhs.copy() as! AnyValue,
                    comparison: comparison.copy() as! ComparisonTypeValue
        )
    }
}
extension ConditionalActionValue: Copying {
    public func copy() -> ConditionalActionValue {
        return ConditionalActionValue(
                    ifCondition: ifCondition.copy() as! ComparisonValue,
                    ifSteps: ifSteps.copy() as! StepArray
        )
    }
}
extension DecodeArrayStep: Copying {
    public func copy() -> DecodeArrayStep {
        return DecodeArrayStep(
                    value: value.copy() as! TypedValue<IntValue>
        )
    }
}
extension DecodeDictionaryStep: Copying {
    public func copy() -> DecodeDictionaryStep {
        return DecodeDictionaryStep(
                    value: value.copy() as! AnyValue
        )
    }
}
extension DictionaryKeysStep: Copying {
    public func copy() -> DictionaryKeysStep {
        return DictionaryKeysStep(
                    dictionary: dictionary.copy() as! TypedValue<DictionaryValue>
        )
    }
}
extension DictionaryValue: Copying {
    public func copy() -> DictionaryValue {
        return DictionaryValue(
                    type: type.copy() as! VariableTypeValue,
                    elements: elements
        )
    }
}
extension DictionaryValueForKeyStep: Copying {
    public func copy() -> DictionaryValueForKeyStep {
        return DictionaryValueForKeyStep(
                    dictionary: dictionary.copy() as! TypedValue<DictionaryValue>,
                    key: key.copy() as! AnyValue
        )
    }
}
extension ForEachStep: Copying {
    public func copy() -> ForEachStep {
        return ForEachStep(
                    values: values.copy() as! TypedValue<ArrayValue>,
                    loop: loop.copy() as! StepArray
        )
    }
}
extension FunctionStep: Copying {
    public func copy() -> FunctionStep {
        return FunctionStep(
                    functionName: functionName.copy() as! AnyValue
        )
    }
}
extension GetNumberStep: Copying {
    public func copy() -> GetNumberStep {
        return GetNumberStep(
                    value: value.copy() as! AnyValue,
                    numberType: numberType
        )
    }
}
extension IfStep: Copying {
    public func copy() -> IfStep {
        return IfStep(
                    ifAction: ifAction.copy() as! ConditionalActionValue,
                    elseAction: elseAction.copy() as! StepArray
        )
    }
}
extension LocationValue: Copying {
    public func copy() -> LocationValue {
        return LocationValue(
                    name: name.copy() as! TypedValue<StringValue>,
                    latitude: latitude.copy() as! TypedValue<FloatValue>,
                    longitude: longitude.copy() as! TypedValue<FloatValue>
        )
    }
}
extension MakeableArray: Copying {
    public func copy() -> MakeableArray {
        return MakeableArray(
                    value: value,
                    axis: axis
        )
    }
}
extension MakeableBase: Copying {
    public func copy() -> MakeableBase {
        return MakeableBase(
                    padding: padding,
                    backgroundColor: backgroundColor.copy() as! ColorValue,
                    cornerRadius: cornerRadius
        )
    }
}
extension MakeableButton: Copying {
    public func copy() -> MakeableButton {
        return MakeableButton(
                    title: title.copy() as! MakeableLabel,
                    style: style,
                    action: action.copy() as! StepArray
        )
    }
}
extension MakeableField: Copying {
    public func copy() -> MakeableField {
        return MakeableField(
                    text: text.copy() as! TemporaryValue,
                    fontSize: fontSize,
                    onTextUpdate: onTextUpdate.copy() as! StepArray,
                    padding: padding,
                    alignment: alignment
        )
    }
}
extension MakeableLabel: Copying {
    public func copy() -> MakeableLabel {
        return MakeableLabel(
                    text: text.copy() as! AnyValue,
                    fontSize: fontSize,
                    fontWeight: fontWeight,
                    italic: italic.copy() as! BoolValue,
                    base: base.copy() as! MakeableBase,
                    textColor: textColor.copy() as! ColorValue
        )
    }
}
extension MakeableList: Copying {
    public func copy() -> MakeableList {
        return MakeableList(
                    data: data.copy() as! TypedValue<ArrayValue>,
                    view: view.copy() as! AnyMakeableView
        )
    }
}
extension MakeableMap: Copying {
    public func copy() -> MakeableMap {
        return MakeableMap(
                    locations: locations.copy() as! TypedValue<ArrayValue>,
                    zoomFollowsNewAnnotations: zoomFollowsNewAnnotations.copy() as! BoolValue
        )
    }
}
extension MakeableStack: Copying {
    public func copy() -> MakeableStack {
        return MakeableStack(
                    content: content.copy() as! MakeableArray,
                    padding: padding
        )
    }
}
extension MakeableToggle: Copying {
    public func copy() -> MakeableToggle {
        return MakeableToggle(
                    isOn: isOn.copy() as! TemporaryValue,
                    onToggleUpdate: onToggleUpdate.copy() as! StepArray,
                    padding: padding
        )
    }
}
extension MapStep: Copying {
    public func copy() -> MapStep {
        return MapStep(
                    value: value.copy() as! TypedValue<ArrayValue>,
                    mapper: mapper.copy() as! StepArray
        )
    }
}
extension NilValue: Copying {
    public func copy() -> NilValue {
        return NilValue(
        )
    }
}
extension NumericalOperationTypeValue: Copying {
    public func copy() -> NumericalOperationTypeValue {
        return NumericalOperationTypeValue(
                    value: value
        )
    }
}
extension NumericalOperationValue: Copying {
    public func copy() -> NumericalOperationValue {
        return NumericalOperationValue(
                    lhs: lhs.copy() as! AnyValue,
                    rhs: rhs.copy() as! AnyValue,
                    operation: operation.copy() as! NumericalOperationTypeValue
        )
    }
}
extension OptionalValue: Copying {
    public func copy() -> OptionalValue {
        return OptionalValue(
                    value: value.copy() as! AnyValue
        )
    }
}
extension PrintVarStep: Copying {
    public func copy() -> PrintVarStep {
        return PrintVarStep(
                    varName: varName.copy() as! AnyValue
        )
    }
}
extension ResultValue: Copying {
    public func copy() -> ResultValue {
        return ResultValue(
                    steps: steps.copy() as! StepArray
        )
    }
}
extension SetVarStep: Copying {
    public func copy() -> SetVarStep {
        return SetVarStep(
                    varName: varName.copy() as! AnyValue,
                    value: value.copy() as! AnyValue
        )
    }
}
extension StaticValueStep: Copying {
    public func copy() -> StaticValueStep {
        return StaticValueStep(
                    value: value.copy() as! AnyValue
        )
    }
}
extension StepArray: Copying {
    public func copy() -> StepArray {
        return StepArray(
                    value: value
        )
    }
}
extension StringValue: Copying {
    public func copy() -> StringValue {
        return StringValue(
                    value: value
        )
    }
}
extension TemporaryValue: Copying {
    public func copy() -> TemporaryValue {
        return TemporaryValue(
                    initial: initial.copy() as! AnyValue,
                    output: output.copy() as! Variable
        )
    }
}
extension TypedValue: Copying {
    public func copy() -> TypedValue {
        return TypedValue(
                    value: value
        )
    }
}
extension URLEncodeStep: Copying {
    public func copy() -> URLEncodeStep {
        return URLEncodeStep(
                    value: value.copy() as! AnyValue
        )
    }
}
extension Variable: Copying {
    public func copy() -> Variable {
        return Variable(
                    value: value
        )
    }
}
extension VariableStep: Copying {
    public func copy() -> VariableStep {
        return VariableStep(
                    varName: varName.copy() as! AnyValue,
                    type: type.copy() as! VariableTypeValue
        )
    }
}
extension VariableTypeValue: Copying {
    public func copy() -> VariableTypeValue {
        return VariableTypeValue(
                    value: value
        )
    }
}


extension CodableMakeableView: Codable {
    enum CodingKeys: String, CodingKey {
        case type
        case value
    }

    init(from decoder: Decoder) throws {
        let valueContainer = try decoder.container(keyedBy: CodingKeys.self)
        self.type = try valueContainer.decode(String.self, forKey: .type)
        switch type {
        case typeString(MakeableBase.self):
            self.value = try valueContainer.decode(MakeableBase.self, forKey: .value)
        case typeString(MakeableButton.self):
            self.value = try valueContainer.decode(MakeableButton.self, forKey: .value)
        case typeString(MakeableField.self):
            self.value = try valueContainer.decode(MakeableField.self, forKey: .value)
        case typeString(MakeableLabel.self):
            self.value = try valueContainer.decode(MakeableLabel.self, forKey: .value)
        case typeString(MakeableList.self):
            self.value = try valueContainer.decode(MakeableList.self, forKey: .value)
        case typeString(MakeableMap.self):
            self.value = try valueContainer.decode(MakeableMap.self, forKey: .value)
        case typeString(MakeableStack.self):
            self.value = try valueContainer.decode(MakeableStack.self, forKey: .value)
        case typeString(MakeableToggle.self):
            self.value = try valueContainer.decode(MakeableToggle.self, forKey: .value)
        default:
            fatalError(type)
        }
    }
    func encode(to encoder: Encoder) throws {
        var container = encoder.container(keyedBy: CodingKeys.self)
        try container.encode(type, forKey: .type)
        switch self.value {
        case let value as MakeableBase:
            try container.encode(value, forKey: .value)
        case let value as MakeableButton:
            try container.encode(value, forKey: .value)
        case let value as MakeableField:
            try container.encode(value, forKey: .value)
        case let value as MakeableLabel:
            try container.encode(value, forKey: .value)
        case let value as MakeableList:
            try container.encode(value, forKey: .value)
        case let value as MakeableMap:
            try container.encode(value, forKey: .value)
        case let value as MakeableStack:
            try container.encode(value, forKey: .value)
        case let value as MakeableToggle:
            try container.encode(value, forKey: .value)
        default: fatalError()
        }
    }
}



extension VariableType {
    static var makeables: [VariableType] { [
        .base, // MakeableBase
        .button, // MakeableButton
        .field, // MakeableField
        .label, // MakeableLabel
        .listView, // MakeableList
        .map, // MakeableMap
        .stack, // MakeableStack
        .toggle, // MakeableToggle
    ] }
}

enum NumericType: String, Codable, CaseIterable {
    static var defaultValue: NumericType = .int
    var title: String { rawValue.capitalized }

    case float
    case int
    func make(from string: String) throws -> any VariableValue {
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
    var codeRepresentation: String {
        title
    }
}




final class AxisValue: PrimitiveEditableVariableValue, Codable, Copying {

    static var type: VariableType { .axis }
    static var defaultValue: Axis { .defaultValue }
    var value: Axis
    init(value: Axis) {
        self.value = value
    }
    static func makeDefault() -> AxisValue {
        .init(value: defaultValue)
    }
    func add(_ other: VariableValue) throws -> VariableValue {
        throw VariableValueError.variableCannotPerformOperation(Self.type, "add")
    }
    var protoString: String { "\(value.title)" }
    var valueString: String { protoString }
    func value(with variables: Variables) async throws -> VariableValue {
        self
    }
    public func copy() -> AxisValue {
        .init(
            value: value
        )
    }
}

extension AxisValue: CodeRepresentable {
    var codeRepresentation: String {
        value.codeRepresentation
    }
}

extension Axis: Copying {
    public func copy() -> Axis {
        return self
    }
}

final class ButtonStyleValue: PrimitiveEditableVariableValue, Codable, Copying {

    static var type: VariableType { .buttonStyle }
    static var defaultValue: ButtonStyle { .defaultValue }
    var value: ButtonStyle
    init(value: ButtonStyle) {
        self.value = value
    }
    static func makeDefault() -> ButtonStyleValue {
        .init(value: defaultValue)
    }
    func add(_ other: VariableValue) throws -> VariableValue {
        throw VariableValueError.variableCannotPerformOperation(Self.type, "add")
    }
    var protoString: String { "\(value.title)" }
    var valueString: String { protoString }
    func value(with variables: Variables) async throws -> VariableValue {
        self
    }
    public func copy() -> ButtonStyleValue {
        .init(
            value: value
        )
    }
}

extension ButtonStyleValue: CodeRepresentable {
    var codeRepresentation: String {
        value.codeRepresentation
    }
}

extension ButtonStyle: Copying {
    public func copy() -> ButtonStyle {
        return self
    }
}

final class FontWeightValue: PrimitiveEditableVariableValue, Codable, Copying {

    static var type: VariableType { .fontWeight }
    static var defaultValue: Font.Weight { .defaultValue }
    var value: Font.Weight
    init(value: Font.Weight) {
        self.value = value
    }
    static func makeDefault() -> FontWeightValue {
        .init(value: defaultValue)
    }
    func add(_ other: VariableValue) throws -> VariableValue {
        throw VariableValueError.variableCannotPerformOperation(Self.type, "add")
    }
    var protoString: String { "\(value.title)" }
    var valueString: String { protoString }
    func value(with variables: Variables) async throws -> VariableValue {
        self
    }
    public func copy() -> FontWeightValue {
        .init(
            value: value
        )
    }
}

extension FontWeightValue: CodeRepresentable {
    var codeRepresentation: String {
        value.codeRepresentation
    }
}

extension Font.Weight: Copying {
    public func copy() -> Font.Weight {
        return self
    }
}

final class NumericTypeValue: PrimitiveEditableVariableValue, Codable, Copying {

    static var type: VariableType { .numericType }
    static var defaultValue: NumericType { .defaultValue }
    var value: NumericType
    init(value: NumericType) {
        self.value = value
    }
    static func makeDefault() -> NumericTypeValue {
        .init(value: defaultValue)
    }
    func add(_ other: VariableValue) throws -> VariableValue {
        throw VariableValueError.variableCannotPerformOperation(Self.type, "add")
    }
    var protoString: String { "\(value.title)" }
    var valueString: String { protoString }
    func value(with variables: Variables) async throws -> VariableValue {
        self
    }
    public func copy() -> NumericTypeValue {
        .init(
            value: value
        )
    }
}

extension NumericTypeValue: CodeRepresentable {
    var codeRepresentation: String {
        value.codeRepresentation
    }
}

extension NumericType: Copying {
    public func copy() -> NumericType {
        return self
    }
}

final class TextAlignmentValue: PrimitiveEditableVariableValue, Codable, Copying {

    static var type: VariableType { .textAlignment }
    static var defaultValue: TextAlignment { .defaultValue }
    var value: TextAlignment
    init(value: TextAlignment) {
        self.value = value
    }
    static func makeDefault() -> TextAlignmentValue {
        .init(value: defaultValue)
    }
    func add(_ other: VariableValue) throws -> VariableValue {
        throw VariableValueError.variableCannotPerformOperation(Self.type, "add")
    }
    var protoString: String { "\(value.title)" }
    var valueString: String { protoString }
    func value(with variables: Variables) async throws -> VariableValue {
        self
    }
    public func copy() -> TextAlignmentValue {
        .init(
            value: value
        )
    }
}

extension TextAlignmentValue: CodeRepresentable {
    var codeRepresentation: String {
        value.codeRepresentation
    }
}

extension TextAlignment: Copying {
    public func copy() -> TextAlignment {
        return self
    }
}





final class FloatValue: EditableVariableValue, Codable, Copying, NumericValue {
    static var type: VariableType { .float }
    var value: Float
    static var defaultValue: Float = .defaultValue
    init(value: Float) {
        self.value = value
    }
    static func makeDefault() -> FloatValue {
        .init(value: Self.defaultValue)
    }
    func editView(title: String, onUpdate: @escaping (FloatValue) -> Void) -> AnyView {
        TextField("", text: .init(get: { [weak self] in
            self?.protoString ?? "ERROR"
        }, set: { [weak self] in
            guard let self = self else { return }
            self.value = Float($0) ?? self.value
            onUpdate(self)
        })).any
    }
    func add(_ other: VariableValue) throws -> VariableValue {
        guard let other = other as? FloatValue else { throw VariableValueError.wrongTypeForOperation }
        self.value = self.value + other.value
        return self
    }
    var protoString: String { "\(value)" }
    var valueString: String { "\(value)"}
    func value(with variables: Variables) throws -> VariableValue {
        self
    }
    public func copy() -> FloatValue {
        .init(
            value: value
        )
    }
}

extension FloatValue: CodeRepresentable {
    var codeRepresentation: String {
        "\(value)"
    }
}

extension Float: Copying {
    public func copy() -> Float {
        return self
    }
}

final class IntValue: EditableVariableValue, Codable, Copying, NumericValue {
    static var type: VariableType { .int }
    var value: Int
    static var defaultValue: Int = .defaultValue
    init(value: Int) {
        self.value = value
    }
    static func makeDefault() -> IntValue {
        .init(value: Self.defaultValue)
    }
    func editView(title: String, onUpdate: @escaping (IntValue) -> Void) -> AnyView {
        TextField("", text: .init(get: { [weak self] in
            self?.protoString ?? "ERROR"
        }, set: { [weak self] in
            guard let self = self else { return }
            self.value = Int($0) ?? self.value
            onUpdate(self)
        })).any
    }
    func add(_ other: VariableValue) throws -> VariableValue {
        guard let other = other as? IntValue else { throw VariableValueError.wrongTypeForOperation }
        self.value = self.value + other.value
        return self
    }
    var protoString: String { "\(value)" }
    var valueString: String { "\(value)"}
    func value(with variables: Variables) throws -> VariableValue {
        self
    }
    public func copy() -> IntValue {
        .init(
            value: value
        )
    }
}

extension IntValue: CodeRepresentable {
    var codeRepresentation: String {
        "\(value)"
    }
}

extension Int: Copying {
    public func copy() -> Int {
        return self
    }
}


import SwiftUI
import Armstrong


extension APIValueStep {
	 enum Properties: String, ViewProperty {
        case url
        var defaultValue: any EditableVariableValue {
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
	        case .url: self.url = value as! AnyValue
	    }
	}
}
extension AddToVarStep {
	 enum Properties: String, ViewProperty {
        case varName
        case value
        var defaultValue: any EditableVariableValue {
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
	        case .varName: self.varName = value as! AnyValue
	        case .value: self.value = value as! AnyValue
	    }
	}
}
extension ArrayValueStep {
	 enum Properties: String, ViewProperty {
        case array
        case index
        var defaultValue: any EditableVariableValue {
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
	        case .array: self.array = value as! AnyValue
	        case .index: self.index = value as! AnyValue
	    }
	}
}
extension ComparisonValue {
	 enum Properties: String, ViewProperty {
        case lhs
        case rhs
        case comparison
        var defaultValue: any EditableVariableValue {
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
	        case .lhs: self.lhs = value as! AnyValue
	        case .rhs: self.rhs = value as! AnyValue
	        case .comparison: self.comparison = value as! ComparisonTypeValue
	    }
	}
}
extension ConditionalActionValue {
	 enum Properties: String, ViewProperty {
        case ifCondition
        case ifSteps
        var defaultValue: any EditableVariableValue {
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
	        case .ifCondition: self.ifCondition = value as! ComparisonValue
	        case .ifSteps: self.ifSteps = value as! StepArray
	    }
	}
}
extension DecodeArrayStep {
	 enum Properties: String, ViewProperty {
        case value
        var defaultValue: any EditableVariableValue {
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
extension DecodeDictionaryStep {
	 enum Properties: String, ViewProperty {
        case value
        var defaultValue: any EditableVariableValue {
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
extension DictionaryKeysStep {
	 enum Properties: String, ViewProperty {
        case dictionary
        var defaultValue: any EditableVariableValue {
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
	        case .dictionary: self.dictionary = value as! TypedValue<DictionaryValue>
	    }
	}
}
extension DictionaryValueForKeyStep {
	 enum Properties: String, ViewProperty {
        case dictionary
        case key
        var defaultValue: any EditableVariableValue {
            switch self {
            case .dictionary: return DictionaryValueForKeyStep.defaultValue(for: .dictionary)
            case .key: return DictionaryValueForKeyStep.defaultValue(for: .key)
            }
        }
    }
    static func make(factory: (Properties) -> any EditableVariableValue) -> Self {
        .init(
            dictionary: factory(.dictionary) as! TypedValue<DictionaryValue>,
            key: factory(.key) as! AnyValue
        )
    }

    static func makeDefault() -> Self {
        .init(
            dictionary: Properties.dictionary.defaultValue as! TypedValue<DictionaryValue>,
            key: Properties.key.defaultValue as! AnyValue
		)
    }
    func value(for property: Properties) -> any EditableVariableValue {
		switch property {
	        case .dictionary: return dictionary
	        case .key: return key
        }
    }

	func set(_ value: Any, for property: Properties) {
		switch property {
	        case .dictionary: self.dictionary = value as! TypedValue<DictionaryValue>
	        case .key: self.key = value as! AnyValue
	    }
	}
}
extension ForEachStep {
	 enum Properties: String, ViewProperty {
        case values
        case loop
        var defaultValue: any EditableVariableValue {
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
	        case .values: self.values = value as! TypedValue<ArrayValue>
	        case .loop: self.loop = value as! StepArray
	    }
	}
}
extension FunctionStep {
	 enum Properties: String, ViewProperty {
        case functionName
        var defaultValue: any EditableVariableValue {
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
	        case .functionName: self.functionName = value as! AnyValue
	    }
	}
}
extension GetNumberStep {
	 enum Properties: String, ViewProperty {
        case value
        case numberType
        var defaultValue: any EditableVariableValue {
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
	        case .numberType: self.numberType = value as! NumericTypeValue
	    }
	}
}
extension IfStep {
	 enum Properties: String, ViewProperty {
        case ifAction
        case elseAction
        var defaultValue: any EditableVariableValue {
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
	        case .ifAction: self.ifAction = value as! ConditionalActionValue
	        case .elseAction: self.elseAction = value as! StepArray
	    }
	}
}
extension LocationValue {
	 enum Properties: String, ViewProperty {
        case name
        case latitude
        case longitude
        var defaultValue: any EditableVariableValue {
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
	        case .name: self.name = value as! TypedValue<StringValue>
	        case .latitude: self.latitude = value as! TypedValue<FloatValue>
	        case .longitude: self.longitude = value as! TypedValue<FloatValue>
	    }
	}
}
extension MakeableBase {
	 enum Properties: String, ViewProperty {
        case padding
        case backgroundColor
        case cornerRadius
        var defaultValue: any EditableVariableValue {
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
	        case .padding: self.padding = value as! IntValue
	        case .backgroundColor: self.backgroundColor = value as! ColorValue
	        case .cornerRadius: self.cornerRadius = value as! IntValue
	    }
	}
}
extension MakeableButton {
	 enum Properties: String, ViewProperty {
        case title
        case style
        case action
        var defaultValue: any EditableVariableValue {
            switch self {
            case .title: return MakeableButton.defaultValue(for: .title)
            case .style: return MakeableButton.defaultValue(for: .style)
            case .action: return MakeableButton.defaultValue(for: .action)
            }
        }
    }
    static func make(factory: (Properties) -> any EditableVariableValue) -> Self {
        .init(
            title: factory(.title) as! MakeableLabel,
            style: factory(.style) as! ButtonStyleValue,
            action: factory(.action) as! StepArray
        )
    }

    static func makeDefault() -> Self {
        .init(
            title: Properties.title.defaultValue as! MakeableLabel,
            style: Properties.style.defaultValue as! ButtonStyleValue,
            action: Properties.action.defaultValue as! StepArray
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
	        case .title: self.title = value as! MakeableLabel
	        case .style: self.style = value as! ButtonStyleValue
	        case .action: self.action = value as! StepArray
	    }
	}
}
extension MakeableField {
	 enum Properties: String, ViewProperty {
        case text
        case fontSize
        case onTextUpdate
        case padding
        case alignment
        var defaultValue: any EditableVariableValue {
            switch self {
            case .text: return MakeableField.defaultValue(for: .text)
            case .fontSize: return MakeableField.defaultValue(for: .fontSize)
            case .onTextUpdate: return MakeableField.defaultValue(for: .onTextUpdate)
            case .padding: return MakeableField.defaultValue(for: .padding)
            case .alignment: return MakeableField.defaultValue(for: .alignment)
            }
        }
    }
    static func make(factory: (Properties) -> any EditableVariableValue) -> Self {
        .init(
            text: factory(.text) as! TemporaryValue,
            fontSize: factory(.fontSize) as! IntValue,
            onTextUpdate: factory(.onTextUpdate) as! StepArray,
            padding: factory(.padding) as! IntValue,
            alignment: factory(.alignment) as! TextAlignmentValue
        )
    }

    static func makeDefault() -> Self {
        .init(
            text: Properties.text.defaultValue as! TemporaryValue,
            fontSize: Properties.fontSize.defaultValue as! IntValue,
            onTextUpdate: Properties.onTextUpdate.defaultValue as! StepArray,
            padding: Properties.padding.defaultValue as! IntValue,
            alignment: Properties.alignment.defaultValue as! TextAlignmentValue
		)
    }
    func value(for property: Properties) -> any EditableVariableValue {
		switch property {
	        case .text: return text
	        case .fontSize: return fontSize
	        case .onTextUpdate: return onTextUpdate
	        case .padding: return padding
	        case .alignment: return alignment
        }
    }

	func set(_ value: Any, for property: Properties) {
		switch property {
	        case .text: self.text = value as! TemporaryValue
	        case .fontSize: self.fontSize = value as! IntValue
	        case .onTextUpdate: self.onTextUpdate = value as! StepArray
	        case .padding: self.padding = value as! IntValue
	        case .alignment: self.alignment = value as! TextAlignmentValue
	    }
	}
}
extension MakeableLabel {
	 enum Properties: String, ViewProperty {
        case text
        case fontSize
        case fontWeight
        case italic
        case base
        case textColor
        var defaultValue: any EditableVariableValue {
            switch self {
            case .text: return MakeableLabel.defaultValue(for: .text)
            case .fontSize: return MakeableLabel.defaultValue(for: .fontSize)
            case .fontWeight: return MakeableLabel.defaultValue(for: .fontWeight)
            case .italic: return MakeableLabel.defaultValue(for: .italic)
            case .base: return MakeableLabel.defaultValue(for: .base)
            case .textColor: return MakeableLabel.defaultValue(for: .textColor)
            }
        }
    }
    static func make(factory: (Properties) -> any EditableVariableValue) -> Self {
        .init(
            text: factory(.text) as! AnyValue,
            fontSize: factory(.fontSize) as! IntValue,
            fontWeight: factory(.fontWeight) as! FontWeightValue,
            italic: factory(.italic) as! BoolValue,
            base: factory(.base) as! MakeableBase,
            textColor: factory(.textColor) as! ColorValue
        )
    }

    static func makeDefault() -> Self {
        .init(
            text: Properties.text.defaultValue as! AnyValue,
            fontSize: Properties.fontSize.defaultValue as! IntValue,
            fontWeight: Properties.fontWeight.defaultValue as! FontWeightValue,
            italic: Properties.italic.defaultValue as! BoolValue,
            base: Properties.base.defaultValue as! MakeableBase,
            textColor: Properties.textColor.defaultValue as! ColorValue
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
        }
    }

	func set(_ value: Any, for property: Properties) {
		switch property {
	        case .text: self.text = value as! AnyValue
	        case .fontSize: self.fontSize = value as! IntValue
	        case .fontWeight: self.fontWeight = value as! FontWeightValue
	        case .italic: self.italic = value as! BoolValue
	        case .base: self.base = value as! MakeableBase
	        case .textColor: self.textColor = value as! ColorValue
	    }
	}
}
extension MakeableList {
	 enum Properties: String, ViewProperty {
        case data
        case view
        var defaultValue: any EditableVariableValue {
            switch self {
            case .data: return MakeableList.defaultValue(for: .data)
            case .view: return MakeableList.defaultValue(for: .view)
            }
        }
    }
    static func make(factory: (Properties) -> any EditableVariableValue) -> Self {
        .init(
            data: factory(.data) as! TypedValue<ArrayValue>,
            view: factory(.view) as! AnyMakeableView
        )
    }

    static func makeDefault() -> Self {
        .init(
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
	        case .data: self.data = value as! TypedValue<ArrayValue>
	        case .view: self.view = value as! AnyMakeableView
	    }
	}
}
extension MakeableMap {
	 enum Properties: String, ViewProperty {
        case locations
        case zoomFollowsNewAnnotations
        var defaultValue: any EditableVariableValue {
            switch self {
            case .locations: return MakeableMap.defaultValue(for: .locations)
            case .zoomFollowsNewAnnotations: return MakeableMap.defaultValue(for: .zoomFollowsNewAnnotations)
            }
        }
    }
    static func make(factory: (Properties) -> any EditableVariableValue) -> Self {
        .init(
            locations: factory(.locations) as! TypedValue<ArrayValue>,
            zoomFollowsNewAnnotations: factory(.zoomFollowsNewAnnotations) as! BoolValue
        )
    }

    static func makeDefault() -> Self {
        .init(
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
	        case .locations: self.locations = value as! TypedValue<ArrayValue>
	        case .zoomFollowsNewAnnotations: self.zoomFollowsNewAnnotations = value as! BoolValue
	    }
	}
}
extension MakeableStack {
	 enum Properties: String, ViewProperty {
        case content
        case padding
        var defaultValue: any EditableVariableValue {
            switch self {
            case .content: return MakeableStack.defaultValue(for: .content)
            case .padding: return MakeableStack.defaultValue(for: .padding)
            }
        }
    }
    static func make(factory: (Properties) -> any EditableVariableValue) -> Self {
        .init(
            content: factory(.content) as! MakeableArray,
            padding: factory(.padding) as! IntValue
        )
    }

    static func makeDefault() -> Self {
        .init(
            content: Properties.content.defaultValue as! MakeableArray,
            padding: Properties.padding.defaultValue as! IntValue
		)
    }
    func value(for property: Properties) -> any EditableVariableValue {
		switch property {
	        case .content: return content
	        case .padding: return padding
        }
    }

	func set(_ value: Any, for property: Properties) {
		switch property {
	        case .content: self.content = value as! MakeableArray
	        case .padding: self.padding = value as! IntValue
	    }
	}
}
extension MakeableToggle {
	 enum Properties: String, ViewProperty {
        case isOn
        case onToggleUpdate
        case padding
        var defaultValue: any EditableVariableValue {
            switch self {
            case .isOn: return MakeableToggle.defaultValue(for: .isOn)
            case .onToggleUpdate: return MakeableToggle.defaultValue(for: .onToggleUpdate)
            case .padding: return MakeableToggle.defaultValue(for: .padding)
            }
        }
    }
    static func make(factory: (Properties) -> any EditableVariableValue) -> Self {
        .init(
            isOn: factory(.isOn) as! TemporaryValue,
            onToggleUpdate: factory(.onToggleUpdate) as! StepArray,
            padding: factory(.padding) as! IntValue
        )
    }

    static func makeDefault() -> Self {
        .init(
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
	        case .isOn: self.isOn = value as! TemporaryValue
	        case .onToggleUpdate: self.onToggleUpdate = value as! StepArray
	        case .padding: self.padding = value as! IntValue
	    }
	}
}
extension MapStep {
	 enum Properties: String, ViewProperty {
        case value
        case mapper
        var defaultValue: any EditableVariableValue {
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
	        case .mapper: self.mapper = value as! StepArray
	    }
	}
}
extension NumericalOperationValue {
	 enum Properties: String, ViewProperty {
        case lhs
        case rhs
        case operation
        var defaultValue: any EditableVariableValue {
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
	        case .lhs: self.lhs = value as! AnyValue
	        case .rhs: self.rhs = value as! AnyValue
	        case .operation: self.operation = value as! NumericalOperationTypeValue
	    }
	}
}
extension PrintVarStep {
	 enum Properties: String, ViewProperty {
        case varName
        var defaultValue: any EditableVariableValue {
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
	        case .varName: self.varName = value as! AnyValue
	    }
	}
}
extension SetVarStep {
	 enum Properties: String, ViewProperty {
        case varName
        case value
        var defaultValue: any EditableVariableValue {
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
	        case .varName: self.varName = value as! AnyValue
	        case .value: self.value = value as! AnyValue
	    }
	}
}
extension StaticValueStep {
	 enum Properties: String, ViewProperty {
        case value
        var defaultValue: any EditableVariableValue {
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
extension TemporaryValue {
	 enum Properties: String, ViewProperty {
        case initial
        case output
        var defaultValue: any EditableVariableValue {
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
	        case .initial: self.initial = value as! AnyValue
	        case .output: self.output = value as! Variable
	    }
	}
}
extension URLEncodeStep {
	 enum Properties: String, ViewProperty {
        case value
        var defaultValue: any EditableVariableValue {
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
extension VariableStep {
	 enum Properties: String, ViewProperty {
        case varName
        case type
        var defaultValue: any EditableVariableValue {
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
	        case .varName: self.varName = value as! AnyValue
	        case .type: self.type = value as! VariableTypeValue
	    }
	}
}

extension CodableVariableValue: Codable {
	enum CodingKeys: String, CodingKey {
        case type
        case value
    }

    init(from decoder: Decoder) throws {
        let valueContainer = try decoder.container(keyedBy: CodingKeys.self)
        self.type = try valueContainer.decode(String.self, forKey: .type)


        switch type {
        case typeString(APIValueStep.self):
            self.value = try valueContainer.decode(APIValueStep.self, forKey: .value)
        case typeString(AddToVarStep.self):
            self.value = try valueContainer.decode(AddToVarStep.self, forKey: .value)
        case typeString(AnyMakeableView.self):
            self.value = try valueContainer.decode(AnyMakeableView.self, forKey: .value)
        case typeString(AnyValue.self):
            self.value = try valueContainer.decode(AnyValue.self, forKey: .value)
        case typeString(ArrayValue.self):
            self.value = try valueContainer.decode(ArrayValue.self, forKey: .value)
        case typeString(ArrayValueStep.self):
            self.value = try valueContainer.decode(ArrayValueStep.self, forKey: .value)
        case typeString(BoolValue.self):
            self.value = try valueContainer.decode(BoolValue.self, forKey: .value)
        case typeString(ColorValue.self):
            self.value = try valueContainer.decode(ColorValue.self, forKey: .value)
        case typeString(ComparisonTypeValue.self):
            self.value = try valueContainer.decode(ComparisonTypeValue.self, forKey: .value)
        case typeString(ComparisonValue.self):
            self.value = try valueContainer.decode(ComparisonValue.self, forKey: .value)
        case typeString(ConditionalActionValue.self):
            self.value = try valueContainer.decode(ConditionalActionValue.self, forKey: .value)
        case typeString(DecodeArrayStep.self):
            self.value = try valueContainer.decode(DecodeArrayStep.self, forKey: .value)
        case typeString(DecodeDictionaryStep.self):
            self.value = try valueContainer.decode(DecodeDictionaryStep.self, forKey: .value)
        case typeString(DictionaryKeysStep.self):
            self.value = try valueContainer.decode(DictionaryKeysStep.self, forKey: .value)
        case typeString(DictionaryValue.self):
            self.value = try valueContainer.decode(DictionaryValue.self, forKey: .value)
        case typeString(DictionaryValueForKeyStep.self):
            self.value = try valueContainer.decode(DictionaryValueForKeyStep.self, forKey: .value)
        case typeString(ForEachStep.self):
            self.value = try valueContainer.decode(ForEachStep.self, forKey: .value)
        case typeString(FunctionStep.self):
            self.value = try valueContainer.decode(FunctionStep.self, forKey: .value)
        case typeString(GetNumberStep.self):
            self.value = try valueContainer.decode(GetNumberStep.self, forKey: .value)
        case typeString(IfStep.self):
            self.value = try valueContainer.decode(IfStep.self, forKey: .value)
        case typeString(LocationValue.self):
            self.value = try valueContainer.decode(LocationValue.self, forKey: .value)
        case typeString(MakeableArray.self):
            self.value = try valueContainer.decode(MakeableArray.self, forKey: .value)
        case typeString(MakeableBase.self):
            self.value = try valueContainer.decode(MakeableBase.self, forKey: .value)
        case typeString(MakeableButton.self):
            self.value = try valueContainer.decode(MakeableButton.self, forKey: .value)
        case typeString(MakeableField.self):
            self.value = try valueContainer.decode(MakeableField.self, forKey: .value)
        case typeString(MakeableLabel.self):
            self.value = try valueContainer.decode(MakeableLabel.self, forKey: .value)
        case typeString(MakeableList.self):
            self.value = try valueContainer.decode(MakeableList.self, forKey: .value)
        case typeString(MakeableMap.self):
            self.value = try valueContainer.decode(MakeableMap.self, forKey: .value)
        case typeString(MakeableStack.self):
            self.value = try valueContainer.decode(MakeableStack.self, forKey: .value)
        case typeString(MakeableToggle.self):
            self.value = try valueContainer.decode(MakeableToggle.self, forKey: .value)
        case typeString(MapStep.self):
            self.value = try valueContainer.decode(MapStep.self, forKey: .value)
        case typeString(NilValue.self):
            self.value = try valueContainer.decode(NilValue.self, forKey: .value)
        case typeString(NumericalOperationTypeValue.self):
            self.value = try valueContainer.decode(NumericalOperationTypeValue.self, forKey: .value)
        case typeString(NumericalOperationValue.self):
            self.value = try valueContainer.decode(NumericalOperationValue.self, forKey: .value)
        case typeString(OptionalValue.self):
            self.value = try valueContainer.decode(OptionalValue.self, forKey: .value)
        case typeString(PrintVarStep.self):
            self.value = try valueContainer.decode(PrintVarStep.self, forKey: .value)
        case typeString(ResultValue.self):
            self.value = try valueContainer.decode(ResultValue.self, forKey: .value)
        case typeString(SetVarStep.self):
            self.value = try valueContainer.decode(SetVarStep.self, forKey: .value)
        case typeString(StaticValueStep.self):
            self.value = try valueContainer.decode(StaticValueStep.self, forKey: .value)
        case typeString(StepArray.self):
            self.value = try valueContainer.decode(StepArray.self, forKey: .value)
        case typeString(StringValue.self):
            self.value = try valueContainer.decode(StringValue.self, forKey: .value)
        case typeString(TemporaryValue.self):
            self.value = try valueContainer.decode(TemporaryValue.self, forKey: .value)
        case typeString(URLEncodeStep.self):
            self.value = try valueContainer.decode(URLEncodeStep.self, forKey: .value)
        case typeString(Variable.self):
            self.value = try valueContainer.decode(Variable.self, forKey: .value)
        case typeString(VariableStep.self):
            self.value = try valueContainer.decode(VariableStep.self, forKey: .value)
        case typeString(VariableTypeValue.self):
            self.value = try valueContainer.decode(VariableTypeValue.self, forKey: .value)
        case typeString(AxisValue.self):
            self.value = try valueContainer.decode(AxisValue.self, forKey: .value)
        case typeString(ButtonStyleValue.self):
            self.value = try valueContainer.decode(ButtonStyleValue.self, forKey: .value)
        case typeString(FontWeightValue.self):
            self.value = try valueContainer.decode(FontWeightValue.self, forKey: .value)
        case typeString(NumericTypeValue.self):
            self.value = try valueContainer.decode(NumericTypeValue.self, forKey: .value)
        case typeString(TextAlignmentValue.self):
            self.value = try valueContainer.decode(TextAlignmentValue.self, forKey: .value)
        case typeString(FloatValue.self):
            self.value = try valueContainer.decode(FloatValue.self, forKey: .value)
        case typeString(IntValue.self):
            self.value = try valueContainer.decode(IntValue.self, forKey: .value)

        default:
            fatalError(type)
        }
    }
    func encode(to encoder: Encoder) throws {
        var container = encoder.container(keyedBy: CodingKeys.self)
        try container.encode(type, forKey: .type)
        switch self.value {
        case let value as APIValueStep:
            try container.encode(value, forKey: .value)
        case let value as AddToVarStep:
            try container.encode(value, forKey: .value)
        case let value as AnyMakeableView:
            try container.encode(value, forKey: .value)
        case let value as AnyValue:
            try container.encode(value, forKey: .value)
        case let value as ArrayValue:
            try container.encode(value, forKey: .value)
        case let value as ArrayValueStep:
            try container.encode(value, forKey: .value)
        case let value as BoolValue:
            try container.encode(value, forKey: .value)
        case let value as ColorValue:
            try container.encode(value, forKey: .value)
        case let value as ComparisonTypeValue:
            try container.encode(value, forKey: .value)
        case let value as ComparisonValue:
            try container.encode(value, forKey: .value)
        case let value as ConditionalActionValue:
            try container.encode(value, forKey: .value)
        case let value as DecodeArrayStep:
            try container.encode(value, forKey: .value)
        case let value as DecodeDictionaryStep:
            try container.encode(value, forKey: .value)
        case let value as DictionaryKeysStep:
            try container.encode(value, forKey: .value)
        case let value as DictionaryValue:
            try container.encode(value, forKey: .value)
        case let value as DictionaryValueForKeyStep:
            try container.encode(value, forKey: .value)
        case let value as ForEachStep:
            try container.encode(value, forKey: .value)
        case let value as FunctionStep:
            try container.encode(value, forKey: .value)
        case let value as GetNumberStep:
            try container.encode(value, forKey: .value)
        case let value as IfStep:
            try container.encode(value, forKey: .value)
        case let value as LocationValue:
            try container.encode(value, forKey: .value)
        case let value as MakeableArray:
            try container.encode(value, forKey: .value)
        case let value as MakeableBase:
            try container.encode(value, forKey: .value)
        case let value as MakeableButton:
            try container.encode(value, forKey: .value)
        case let value as MakeableField:
            try container.encode(value, forKey: .value)
        case let value as MakeableLabel:
            try container.encode(value, forKey: .value)
        case let value as MakeableList:
            try container.encode(value, forKey: .value)
        case let value as MakeableMap:
            try container.encode(value, forKey: .value)
        case let value as MakeableStack:
            try container.encode(value, forKey: .value)
        case let value as MakeableToggle:
            try container.encode(value, forKey: .value)
        case let value as MapStep:
            try container.encode(value, forKey: .value)
        case let value as NilValue:
            try container.encode(value, forKey: .value)
        case let value as NumericalOperationTypeValue:
            try container.encode(value, forKey: .value)
        case let value as NumericalOperationValue:
            try container.encode(value, forKey: .value)
        case let value as OptionalValue:
            try container.encode(value, forKey: .value)
        case let value as PrintVarStep:
            try container.encode(value, forKey: .value)
        case let value as ResultValue:
            try container.encode(value, forKey: .value)
        case let value as SetVarStep:
            try container.encode(value, forKey: .value)
        case let value as StaticValueStep:
            try container.encode(value, forKey: .value)
        case let value as StepArray:
            try container.encode(value, forKey: .value)
        case let value as StringValue:
            try container.encode(value, forKey: .value)
        case let value as TemporaryValue:
            try container.encode(value, forKey: .value)
        case let value as URLEncodeStep:
            try container.encode(value, forKey: .value)
        case let value as Variable:
            try container.encode(value, forKey: .value)
        case let value as VariableStep:
            try container.encode(value, forKey: .value)
        case let value as VariableTypeValue:
            try container.encode(value, forKey: .value)

        case let value as AxisValue:
            try container.encode(value, forKey: .value)
        case let value as ButtonStyleValue:
            try container.encode(value, forKey: .value)
        case let value as FontWeightValue:
            try container.encode(value, forKey: .value)
        case let value as NumericTypeValue:
            try container.encode(value, forKey: .value)
        case let value as TextAlignmentValue:
            try container.encode(value, forKey: .value)

        case let value as FloatValue:
            try container.encode(value, forKey: .value)
        case let value as IntValue:
            try container.encode(value, forKey: .value)

        default: fatalError()
        }
    }
}

extension AddViewViewModel {
	convenience init(onSelect: @escaping (any MakeableView) -> Void) {
		self.init(rows: [

            .init(title: "Base", onTap: {
                onSelect(MakeableBase.makeDefault())
            }),

            .init(title: "Button", onTap: {
                onSelect(MakeableButton.makeDefault())
            }),

            .init(title: "Field", onTap: {
                onSelect(MakeableField.makeDefault())
            }),

            .init(title: "Label", onTap: {
                onSelect(MakeableLabel.makeDefault())
            }),

            .init(title: "List", onTap: {
                onSelect(MakeableList.makeDefault())
            }),

            .init(title: "Map", onTap: {
                onSelect(MakeableMap.makeDefault())
            }),

            .init(title: "Stack", onTap: {
                onSelect(MakeableStack.makeDefault())
            }),

            .init(title: "Toggle", onTap: {
                onSelect(MakeableToggle.makeDefault())
            })
        ])
	}
}



extension VariableType {

	static var view: VariableType { .init() } // AnyMakeableView
	static var anyValue: VariableType { .init() } // AnyValue
	static var list: VariableType { .init() } // ArrayValue
	static var boolean: VariableType { .init() } // BoolValue
	static var color: VariableType { .init() } // ColorValue
	static var comparisonType: VariableType { .init() } // ComparisonTypeValue
	static var comparison: VariableType { .init() } // ComparisonValue
	static var conditionalAction: VariableType { .init() } // ConditionalActionValue
	static var dictionary: VariableType { .init() } // DictionaryValue
	static var location: VariableType { .init() } // LocationValue
	static var makeableArray: VariableType { .init() } // MakeableArray
	static var base: VariableType { .init() } // MakeableBase
	static var button: VariableType { .init() } // MakeableButton
	static var field: VariableType { .init() } // MakeableField
	static var label: VariableType { .init() } // MakeableLabel
	static var listView: VariableType { .init() } // MakeableList
	static var map: VariableType { .init() } // MakeableMap
	static var stack: VariableType { .init() } // MakeableStack
	static var toggle: VariableType { .init() } // MakeableToggle
	static var `nil`: VariableType { .init() } // NilValue
	static var numericalOperationType: VariableType { .init() } // NumericalOperationTypeValue
	static var numericalOperation: VariableType { .init() } // NumericalOperationValue
	static var optional: VariableType { .init() } // OptionalValue
	static var result: VariableType { .init() } // ResultValue
	static var stepArray: VariableType { .init() } // StepArray
	static var string: VariableType { .init() } // StringValue
	static var temporary: VariableType { .init() } // TemporaryValue
	static var variable: VariableType { .init() } // Variable
	static var type: VariableType { .init() } // VariableTypeValue

        static var axis: VariableType { .init() } // Axis
        static var buttonStyle: VariableType { .init() } // ButtonStyle
        static var fontWeight: VariableType { .init() } // Font.Weight
        static var numericType: VariableType { .init() } // NumericType
        static var textAlignment: VariableType { .init() } // TextAlignment

        static var float: VariableType { .init() } // Float
        static var int: VariableType { .init() } // Int
}

extension MakeableWrapperView {
	var body: some View {
        ZStack {
            inner
        }
    }
    var inner: some View {
        switch view {
        case let value as MakeableBase:
            return MakeableBaseView(isRunning: isRunning, showEditControls: showEditControls, base: value, onContentUpdate: onContentUpdate, onRuntimeUpdate: onRuntimeUpdate, error: $error).any
        case let value as MakeableButton:
            return MakeableButtonView(isRunning: isRunning, showEditControls: showEditControls, button: value, onContentUpdate: onContentUpdate, onRuntimeUpdate: onRuntimeUpdate, error: $error).any
        case let value as MakeableField:
            return MakeableFieldView(isRunning: isRunning, showEditControls: showEditControls, field: value, onContentUpdate: onContentUpdate, onRuntimeUpdate: onRuntimeUpdate, error: $error).any
        case let value as MakeableLabel:
            return MakeableLabelView(isRunning: isRunning, showEditControls: showEditControls, label: value, onContentUpdate: onContentUpdate, onRuntimeUpdate: onRuntimeUpdate, error: $error).any
        case let value as MakeableList:
            return MakeableListView(isRunning: isRunning, showEditControls: showEditControls, listView: value, onContentUpdate: onContentUpdate, onRuntimeUpdate: onRuntimeUpdate, error: $error).any
        case let value as MakeableMap:
            return MakeableMapView(isRunning: isRunning, showEditControls: showEditControls, map: value, onContentUpdate: onContentUpdate, onRuntimeUpdate: onRuntimeUpdate, error: $error).any
        case let value as MakeableStack:
            return MakeableStackView(isRunning: isRunning, showEditControls: showEditControls, stack: value, onContentUpdate: onContentUpdate, onRuntimeUpdate: onRuntimeUpdate, error: $error).any
        case let value as MakeableToggle:
            return MakeableToggleView(isRunning: isRunning, showEditControls: showEditControls, toggle: value, onContentUpdate: onContentUpdate, onRuntimeUpdate: onRuntimeUpdate, error: $error).any
        default:
            return Text("UNKNOWN VIEW").any
        }
    }
}


extension AddActionView {
	enum Actions: Int, CaseIterable {
		case APIValue
		case AddToVar
		case ArrayValue
		case DecodeArray
		case DecodeDictionary
		case DictionaryKeys
		case DictionaryValueForKey
		case ForEach
		case Function
		case GetNumber
		case If
		case Map
		case PrintVar
		case SetVar
		case StaticValue
		case URLEncode
		case Variable
        var title: String {
            switch self {
            case .APIValue: return APIValueStep.title
            case .AddToVar: return AddToVarStep.title
            case .ArrayValue: return ArrayValueStep.title
            case .DecodeArray: return DecodeArrayStep.title
            case .DecodeDictionary: return DecodeDictionaryStep.title
            case .DictionaryKeys: return DictionaryKeysStep.title
            case .DictionaryValueForKey: return DictionaryValueForKeyStep.title
            case .ForEach: return ForEachStep.title
            case .Function: return FunctionStep.title
            case .GetNumber: return GetNumberStep.title
            case .If: return IfStep.title
            case .Map: return MapStep.title
            case .PrintVar: return PrintVarStep.title
            case .SetVar: return SetVarStep.title
            case .StaticValue: return StaticValueStep.title
            case .URLEncode: return URLEncodeStep.title
            case .Variable: return VariableStep.title
            }
        }
        func make() -> any StepType {
            switch self {
            case .APIValue: APIValueStep.makeDefault()
            case .AddToVar: AddToVarStep.makeDefault()
            case .ArrayValue: ArrayValueStep.makeDefault()
            case .DecodeArray: DecodeArrayStep.makeDefault()
            case .DecodeDictionary: DecodeDictionaryStep.makeDefault()
            case .DictionaryKeys: DictionaryKeysStep.makeDefault()
            case .DictionaryValueForKey: DictionaryValueForKeyStep.makeDefault()
            case .ForEach: ForEachStep.makeDefault()
            case .Function: FunctionStep.makeDefault()
            case .GetNumber: GetNumberStep.makeDefault()
            case .If: IfStep.makeDefault()
            case .Map: MapStep.makeDefault()
            case .PrintVar: PrintVarStep.makeDefault()
            case .SetVar: SetVarStep.makeDefault()
            case .StaticValue: StaticValueStep.makeDefault()
            case .URLEncode: URLEncodeStep.makeDefault()
            case .Variable: VariableStep.makeDefault()
            }
        }
    }
}

extension CodableStep: Codable {
	init(from decoder: Decoder) throws {
        let valueContainer = try decoder.container(keyedBy: CodingKeys.self)
        self.type = try valueContainer.decode(String.self, forKey: .type)
        switch type {
        case typeString(APIValueStep.self):
			self.value = try valueContainer.decode(APIValueStep.self, forKey: .value)
        case typeString(AddToVarStep.self):
			self.value = try valueContainer.decode(AddToVarStep.self, forKey: .value)
        case typeString(ArrayValueStep.self):
			self.value = try valueContainer.decode(ArrayValueStep.self, forKey: .value)
        case typeString(DecodeArrayStep.self):
			self.value = try valueContainer.decode(DecodeArrayStep.self, forKey: .value)
        case typeString(DecodeDictionaryStep.self):
			self.value = try valueContainer.decode(DecodeDictionaryStep.self, forKey: .value)
        case typeString(DictionaryKeysStep.self):
			self.value = try valueContainer.decode(DictionaryKeysStep.self, forKey: .value)
        case typeString(DictionaryValueForKeyStep.self):
			self.value = try valueContainer.decode(DictionaryValueForKeyStep.self, forKey: .value)
        case typeString(ForEachStep.self):
			self.value = try valueContainer.decode(ForEachStep.self, forKey: .value)
        case typeString(FunctionStep.self):
			self.value = try valueContainer.decode(FunctionStep.self, forKey: .value)
        case typeString(GetNumberStep.self):
			self.value = try valueContainer.decode(GetNumberStep.self, forKey: .value)
        case typeString(IfStep.self):
			self.value = try valueContainer.decode(IfStep.self, forKey: .value)
        case typeString(MapStep.self):
			self.value = try valueContainer.decode(MapStep.self, forKey: .value)
        case typeString(PrintVarStep.self):
			self.value = try valueContainer.decode(PrintVarStep.self, forKey: .value)
        case typeString(SetVarStep.self):
			self.value = try valueContainer.decode(SetVarStep.self, forKey: .value)
        case typeString(StaticValueStep.self):
			self.value = try valueContainer.decode(StaticValueStep.self, forKey: .value)
        case typeString(URLEncodeStep.self):
			self.value = try valueContainer.decode(URLEncodeStep.self, forKey: .value)
        case typeString(VariableStep.self):
			self.value = try valueContainer.decode(VariableStep.self, forKey: .value)
        default:
            fatalError(type)
        }
    }
    func encode(to encoder: Encoder) throws {
        var container = encoder.container(keyedBy: CodingKeys.self)
        try container.encode(type, forKey: .type)
        switch self.value {
		case let value as APIValueStep:
			try container.encode(value, forKey: .value)
		case let value as AddToVarStep:
			try container.encode(value, forKey: .value)
		case let value as ArrayValueStep:
			try container.encode(value, forKey: .value)
		case let value as DecodeArrayStep:
			try container.encode(value, forKey: .value)
		case let value as DecodeDictionaryStep:
			try container.encode(value, forKey: .value)
		case let value as DictionaryKeysStep:
			try container.encode(value, forKey: .value)
		case let value as DictionaryValueForKeyStep:
			try container.encode(value, forKey: .value)
		case let value as ForEachStep:
			try container.encode(value, forKey: .value)
		case let value as FunctionStep:
			try container.encode(value, forKey: .value)
		case let value as GetNumberStep:
			try container.encode(value, forKey: .value)
		case let value as IfStep:
			try container.encode(value, forKey: .value)
		case let value as MapStep:
			try container.encode(value, forKey: .value)
		case let value as PrintVarStep:
			try container.encode(value, forKey: .value)
		case let value as SetVarStep:
			try container.encode(value, forKey: .value)
		case let value as StaticValueStep:
			try container.encode(value, forKey: .value)
		case let value as URLEncodeStep:
			try container.encode(value, forKey: .value)
		case let value as VariableStep:
			try container.encode(value, forKey: .value)
        default: fatalError()
        }
    }
}

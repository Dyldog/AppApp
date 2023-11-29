// Generated using Sourcery 2.1.2 — https://github.com/krzysztofzablocki/Sourcery
// DO NOT EDIT



extension APIValueStep: Copying {
    func copy() -> APIValueStep {
        return APIValueStep(
                    url: url.copy() as! AnyValue
        )
    }
}
extension AddToVarStep: Copying {
    func copy() -> AddToVarStep {
        return AddToVarStep(
                    varName: varName.copy() as! AnyValue,
                    value: value.copy() as! AnyValue
        )
    }
}
extension AnyMakeableView: Copying {
    func copy() -> AnyMakeableView {
        return AnyMakeableView(
                    value: value
        )
    }
}
extension AnyValue: Copying {
    func copy() -> AnyValue {
        return AnyValue(
                    value: value
        )
    }
}
extension ArrayValue: Copying {
    func copy() -> ArrayValue {
        return ArrayValue(
                    type: type,
                    elements: elements
        )
    }
}
extension ArrayValueStep: Copying {
    func copy() -> ArrayValueStep {
        return ArrayValueStep(
                    array: array.copy() as! AnyValue,
                    index: index.copy() as! AnyValue
        )
    }
}
extension AxisValue: Copying {
    func copy() -> AxisValue {
        return AxisValue(
                    value: value
        )
    }
}
extension BoolValue: Copying {
    func copy() -> BoolValue {
        return BoolValue(
                    value: value
        )
    }
}
extension ColorValue: Copying {
    func copy() -> ColorValue {
        return ColorValue(
                    value: value
        )
    }
}
extension ComparisonTypeValue: Copying {
    func copy() -> ComparisonTypeValue {
        return ComparisonTypeValue(
                    value: value
        )
    }
}
extension ComparisonValue: Copying {
    func copy() -> ComparisonValue {
        return ComparisonValue(
                    lhs: lhs.copy() as! AnyValue,
                    rhs: rhs.copy() as! AnyValue,
                    comparison: comparison.copy() as! ComparisonTypeValue
        )
    }
}
extension ConditionalActionValue: Copying {
    func copy() -> ConditionalActionValue {
        return ConditionalActionValue(
                    ifCondition: ifCondition.copy() as! ComparisonValue,
                    ifSteps: ifSteps.copy() as! StepArray
        )
    }
}
extension DecodeDictionaryStep: Copying {
    func copy() -> DecodeDictionaryStep {
        return DecodeDictionaryStep(
                    value: value.copy() as! AnyValue
        )
    }
}
extension DictionaryValue: Copying {
    func copy() -> DictionaryValue {
        return DictionaryValue(
                    type: type.copy() as! VariableTypeValue,
                    elements: elements
        )
    }
}
extension FontWeightValue: Copying {
    func copy() -> FontWeightValue {
        return FontWeightValue(
                    value: value
        )
    }
}
extension FunctionStep: Copying {
    func copy() -> FunctionStep {
        return FunctionStep(
                    functionName: functionName.copy() as! AnyValue
        )
    }
}
extension IfStep: Copying {
    func copy() -> IfStep {
        return IfStep(
                    ifAction: ifAction.copy() as! ConditionalActionValue,
                    elseAction: elseAction.copy() as! StepArray
        )
    }
}
extension IntValue: Copying {
    func copy() -> IntValue {
        return IntValue(
                    value: value
        )
    }
}
extension MakeableArray: Copying {
    func copy() -> MakeableArray {
        return MakeableArray(
                    value: value,
                    axis: axis.copy() as! AxisValue
        )
    }
}
extension MakeableBase: Copying {
    func copy() -> MakeableBase {
        return MakeableBase(
                    padding: padding.copy() as! IntValue,
                    backgroundColor: backgroundColor.copy() as! ColorValue
        )
    }
}
extension MakeableButton: Copying {
    func copy() -> MakeableButton {
        return MakeableButton(
                    title: title.copy() as! MakeableLabel,
                    action: action.copy() as! StepArray
        )
    }
}
extension MakeableField: Copying {
    func copy() -> MakeableField {
        return MakeableField(
                    text: text.copy() as! TemporaryValue,
                    fontSize: fontSize.copy() as! IntValue,
                    onTextUpdate: onTextUpdate.copy() as! StepArray,
                    padding: padding.copy() as! IntValue
        )
    }
}
extension MakeableLabel: Copying {
    func copy() -> MakeableLabel {
        return MakeableLabel(
                    text: text.copy() as! AnyValue,
                    fontSize: fontSize.copy() as! IntValue,
                    fontWeight: fontWeight.copy() as! FontWeightValue,
                    italic: italic.copy() as! BoolValue,
                    base: base.copy() as! MakeableBase,
                    textColor: textColor.copy() as! ColorValue
        )
    }
}
extension MakeableList: Copying {
    func copy() -> MakeableList {
        return MakeableList(
                    data: data.copy() as! TypedValue<ArrayValue>,
                    view: view.copy() as! AnyMakeableView
        )
    }
}
extension MakeableStack: Copying {
    func copy() -> MakeableStack {
        return MakeableStack(
                    content: content.copy() as! MakeableArray,
                    padding: padding.copy() as! IntValue
        )
    }
}
extension MakeableToggle: Copying {
    func copy() -> MakeableToggle {
        return MakeableToggle(
                    isOn: isOn.copy() as! TemporaryValue,
                    onToggleUpdate: onToggleUpdate.copy() as! StepArray,
                    padding: padding.copy() as! IntValue
        )
    }
}
extension NilValue: Copying {
    func copy() -> NilValue {
        return NilValue(
        )
    }
}
extension NumericalOperationTypeValue: Copying {
    func copy() -> NumericalOperationTypeValue {
        return NumericalOperationTypeValue(
                    value: value
        )
    }
}
extension NumericalOperationValue: Copying {
    func copy() -> NumericalOperationValue {
        return NumericalOperationValue(
                    lhs: lhs.copy() as! AnyValue,
                    rhs: rhs.copy() as! AnyValue,
                    operation: operation.copy() as! NumericalOperationTypeValue
        )
    }
}
extension OptionalValue: Copying {
    func copy() -> OptionalValue {
        return OptionalValue(
                    value: value.copy() as! AnyValue
        )
    }
}
extension PrintVarStep: Copying {
    func copy() -> PrintVarStep {
        return PrintVarStep(
                    varName: varName.copy() as! AnyValue
        )
    }
}
extension SetVarStep: Copying {
    func copy() -> SetVarStep {
        return SetVarStep(
                    varName: varName.copy() as! AnyValue,
                    value: value.copy() as! AnyValue
        )
    }
}
extension StaticValueStep: Copying {
    func copy() -> StaticValueStep {
        return StaticValueStep(
                    value: value.copy() as! AnyValue,
                    type: type.copy() as! VariableTypeValue
        )
    }
}
extension StepArray: Copying {
    func copy() -> StepArray {
        return StepArray(
                    value: value
        )
    }
}
extension StringValue: Copying {
    func copy() -> StringValue {
        return StringValue(
                    value: value
        )
    }
}
extension TemporaryValue: Copying {
    func copy() -> TemporaryValue {
        return TemporaryValue(
                    initial: initial.copy() as! AnyValue,
                    output: output.copy() as! Variable
        )
    }
}
extension TypedValue: Copying {
    func copy() -> TypedValue {
        return TypedValue(
                    value: value
        )
    }
}
extension Variable: Copying {
    func copy() -> Variable {
        return Variable(
                    value: value
        )
    }
}
extension VariableStep: Copying {
    func copy() -> VariableStep {
        return VariableStep(
                    varName: varName.copy() as! AnyValue,
                    type: type.copy() as! VariableTypeValue
        )
    }
}
extension VariableTypeValue: Copying {
    func copy() -> VariableTypeValue {
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
        .stack, // MakeableStack
        .toggle, // MakeableToggle
    ] }
}

import SwiftUI


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
extension MakeableBase {
	 enum Properties: String, ViewProperty {
        case padding
        case backgroundColor
        var defaultValue: any EditableVariableValue {
            switch self {
            case .padding: return MakeableBase.defaultValue(for: .padding)
            case .backgroundColor: return MakeableBase.defaultValue(for: .backgroundColor)
            }
        }
    }
    static func make(factory: (Properties) -> any EditableVariableValue) -> Self {
        .init(
            padding: factory(.padding) as! IntValue,
            backgroundColor: factory(.backgroundColor) as! ColorValue
        )
    }

    static func makeDefault() -> Self {
        .init(
            padding: Properties.padding.defaultValue as! IntValue,
            backgroundColor: Properties.backgroundColor.defaultValue as! ColorValue
		)
    }
    func value(for property: Properties) -> any EditableVariableValue {
		switch property {
	        case .padding: return padding
	        case .backgroundColor: return backgroundColor
        }
    }

	func set(_ value: Any, for property: Properties) {
		switch property {
	        case .padding: self.padding = value as! IntValue
	        case .backgroundColor: self.backgroundColor = value as! ColorValue
	    }
	}
}
extension MakeableButton {
	 enum Properties: String, ViewProperty {
        case title
        case action
        var defaultValue: any EditableVariableValue {
            switch self {
            case .title: return MakeableButton.defaultValue(for: .title)
            case .action: return MakeableButton.defaultValue(for: .action)
            }
        }
    }
    static func make(factory: (Properties) -> any EditableVariableValue) -> Self {
        .init(
            title: factory(.title) as! MakeableLabel,
            action: factory(.action) as! StepArray
        )
    }

    static func makeDefault() -> Self {
        .init(
            title: Properties.title.defaultValue as! MakeableLabel,
            action: Properties.action.defaultValue as! StepArray
		)
    }
    func value(for property: Properties) -> any EditableVariableValue {
		switch property {
	        case .title: return title
	        case .action: return action
        }
    }

	func set(_ value: Any, for property: Properties) {
		switch property {
	        case .title: self.title = value as! MakeableLabel
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
        var defaultValue: any EditableVariableValue {
            switch self {
            case .text: return MakeableField.defaultValue(for: .text)
            case .fontSize: return MakeableField.defaultValue(for: .fontSize)
            case .onTextUpdate: return MakeableField.defaultValue(for: .onTextUpdate)
            case .padding: return MakeableField.defaultValue(for: .padding)
            }
        }
    }
    static func make(factory: (Properties) -> any EditableVariableValue) -> Self {
        .init(
            text: factory(.text) as! TemporaryValue,
            fontSize: factory(.fontSize) as! IntValue,
            onTextUpdate: factory(.onTextUpdate) as! StepArray,
            padding: factory(.padding) as! IntValue
        )
    }

    static func makeDefault() -> Self {
        .init(
            text: Properties.text.defaultValue as! TemporaryValue,
            fontSize: Properties.fontSize.defaultValue as! IntValue,
            onTextUpdate: Properties.onTextUpdate.defaultValue as! StepArray,
            padding: Properties.padding.defaultValue as! IntValue
		)
    }
    func value(for property: Properties) -> any EditableVariableValue {
		switch property {
	        case .text: return text
	        case .fontSize: return fontSize
	        case .onTextUpdate: return onTextUpdate
	        case .padding: return padding
        }
    }

	func set(_ value: Any, for property: Properties) {
		switch property {
	        case .text: self.text = value as! TemporaryValue
	        case .fontSize: self.fontSize = value as! IntValue
	        case .onTextUpdate: self.onTextUpdate = value as! StepArray
	        case .padding: self.padding = value as! IntValue
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
        case type
        var defaultValue: any EditableVariableValue {
            switch self {
            case .value: return StaticValueStep.defaultValue(for: .value)
            case .type: return StaticValueStep.defaultValue(for: .type)
            }
        }
    }
    static func make(factory: (Properties) -> any EditableVariableValue) -> Self {
        .init(
            value: factory(.value) as! AnyValue,
            type: factory(.type) as! VariableTypeValue
        )
    }

    static func makeDefault() -> Self {
        .init(
            value: Properties.value.defaultValue as! AnyValue,
            type: Properties.type.defaultValue as! VariableTypeValue
		)
    }
    func value(for property: Properties) -> any EditableVariableValue {
		switch property {
	        case .value: return value
	        case .type: return type
        }
    }

	func set(_ value: Any, for property: Properties) {
		switch property {
	        case .value: self.value = value as! AnyValue
	        case .type: self.type = value as! VariableTypeValue
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
        case typeString(AxisValue.self):
            self.value = try valueContainer.decode(AxisValue.self, forKey: .value)
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
        case typeString(DecodeDictionaryStep.self):
            self.value = try valueContainer.decode(DecodeDictionaryStep.self, forKey: .value)
        case typeString(DictionaryValue.self):
            self.value = try valueContainer.decode(DictionaryValue.self, forKey: .value)
        case typeString(FontWeightValue.self):
            self.value = try valueContainer.decode(FontWeightValue.self, forKey: .value)
        case typeString(FunctionStep.self):
            self.value = try valueContainer.decode(FunctionStep.self, forKey: .value)
        case typeString(IfStep.self):
            self.value = try valueContainer.decode(IfStep.self, forKey: .value)
        case typeString(IntValue.self):
            self.value = try valueContainer.decode(IntValue.self, forKey: .value)
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
        case typeString(MakeableStack.self):
            self.value = try valueContainer.decode(MakeableStack.self, forKey: .value)
        case typeString(MakeableToggle.self):
            self.value = try valueContainer.decode(MakeableToggle.self, forKey: .value)
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
        case typeString(Variable.self):
            self.value = try valueContainer.decode(Variable.self, forKey: .value)
        case typeString(VariableStep.self):
            self.value = try valueContainer.decode(VariableStep.self, forKey: .value)
        case typeString(VariableTypeValue.self):
            self.value = try valueContainer.decode(VariableTypeValue.self, forKey: .value)
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
        case let value as AxisValue:
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
        case let value as DecodeDictionaryStep:
            try container.encode(value, forKey: .value)
        case let value as DictionaryValue:
            try container.encode(value, forKey: .value)
        case let value as FontWeightValue:
            try container.encode(value, forKey: .value)
        case let value as FunctionStep:
            try container.encode(value, forKey: .value)
        case let value as IfStep:
            try container.encode(value, forKey: .value)
        case let value as IntValue:
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
        case let value as MakeableStack:
            try container.encode(value, forKey: .value)
        case let value as MakeableToggle:
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
        case let value as Variable:
            try container.encode(value, forKey: .value)
        case let value as VariableStep:
            try container.encode(value, forKey: .value)
        case let value as VariableTypeValue:
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

            .init(title: "Stack", onTap: {
                onSelect(MakeableStack.makeDefault())
            }),

            .init(title: "Toggle", onTap: {
                onSelect(MakeableToggle.makeDefault())
            })
        ])
	}
}


enum VariableType: String, CaseIterable, Equatable, Codable, Titleable {   
	case view // AnyMakeableView
	case anyValue // AnyValue
	case list // ArrayValue
	case axis // AxisValue
	case boolean // BoolValue
	case color // ColorValue
	case comparisonType // ComparisonTypeValue
	case comparison // ComparisonValue
	case conditionalAction // ConditionalActionValue
	case dictionary // DictionaryValue
	case fontWeight // FontWeightValue
	case int // IntValue
	case makeableArray // MakeableArray
	case base // MakeableBase
	case button // MakeableButton
	case field // MakeableField
	case label // MakeableLabel
	case listView // MakeableList
	case stack // MakeableStack
	case toggle // MakeableToggle
	case `nil` // NilValue
	case numericalOperationType // NumericalOperationTypeValue
	case numericalOperation // NumericalOperationValue
	case optional // OptionalValue
	case stepArray // StepArray
	case string // StringValue
	case temporary // TemporaryValue
	case variable // Variable
	case type // VariableTypeValue

	var defaultView: any EditableVariableValue {
        switch self {
        case .view: return AnyMakeableView.makeDefault()
        case .anyValue: return AnyValue.makeDefault()
        case .list: return ArrayValue.makeDefault()
        case .axis: return AxisValue.makeDefault()
        case .boolean: return BoolValue.makeDefault()
        case .color: return ColorValue.makeDefault()
        case .comparisonType: return ComparisonTypeValue.makeDefault()
        case .comparison: return ComparisonValue.makeDefault()
        case .conditionalAction: return ConditionalActionValue.makeDefault()
        case .dictionary: return DictionaryValue.makeDefault()
        case .fontWeight: return FontWeightValue.makeDefault()
        case .int: return IntValue.makeDefault()
        case .makeableArray: return MakeableArray.makeDefault()
        case .base: return MakeableBase.makeDefault()
        case .button: return MakeableButton.makeDefault()
        case .field: return MakeableField.makeDefault()
        case .label: return MakeableLabel.makeDefault()
        case .listView: return MakeableList.makeDefault()
        case .stack: return MakeableStack.makeDefault()
        case .toggle: return MakeableToggle.makeDefault()
        case .`nil`: return NilValue.makeDefault()
        case .numericalOperationType: return NumericalOperationTypeValue.makeDefault()
        case .numericalOperation: return NumericalOperationValue.makeDefault()
        case .optional: return OptionalValue.makeDefault()
        case .stepArray: return StepArray.makeDefault()
        case .string: return StringValue.makeDefault()
        case .temporary: return TemporaryValue.makeDefault()
        case .variable: return Variable.makeDefault()
        case .type: return VariableTypeValue.makeDefault()
        }
    }
    var title: String {
        switch self {
        case .view: return "view"
        case .anyValue: return "anyValue"
        case .list: return "list"
        case .axis: return "axis"
        case .boolean: return "boolean"
        case .color: return "color"
        case .comparisonType: return "comparisonType"
        case .comparison: return "comparison"
        case .conditionalAction: return "conditionalAction"
        case .dictionary: return "dictionary"
        case .fontWeight: return "fontWeight"
        case .int: return "int"
        case .makeableArray: return "makeableArray"
        case .base: return "base"
        case .button: return "button"
        case .field: return "field"
        case .label: return "label"
        case .listView: return "listView"
        case .stack: return "stack"
        case .toggle: return "toggle"
        case .`nil`: return "`nil`"
        case .numericalOperationType: return "numericalOperationType"
        case .numericalOperation: return "numericalOperation"
        case .optional: return "optional"
        case .stepArray: return "stepArray"
        case .string: return "string"
        case .temporary: return "temporary"
        case .variable: return "variable"
        case .type: return "type"
        }
    }
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
		case DecodeDictionary
		case Function
		case If
		case PrintVar
		case SetVar
		case StaticValue
		case Variable
        var title: String {
            switch self {
            case .APIValue: return APIValueStep.title
            case .AddToVar: return AddToVarStep.title
            case .ArrayValue: return ArrayValueStep.title
            case .DecodeDictionary: return DecodeDictionaryStep.title
            case .Function: return FunctionStep.title
            case .If: return IfStep.title
            case .PrintVar: return PrintVarStep.title
            case .SetVar: return SetVarStep.title
            case .StaticValue: return StaticValueStep.title
            case .Variable: return VariableStep.title
            }
        }
        func make() -> any StepType {
            switch self {
            case .APIValue: APIValueStep.makeDefault()
            case .AddToVar: AddToVarStep.makeDefault()
            case .ArrayValue: ArrayValueStep.makeDefault()
            case .DecodeDictionary: DecodeDictionaryStep.makeDefault()
            case .Function: FunctionStep.makeDefault()
            case .If: IfStep.makeDefault()
            case .PrintVar: PrintVarStep.makeDefault()
            case .SetVar: SetVarStep.makeDefault()
            case .StaticValue: StaticValueStep.makeDefault()
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
        case typeString(DecodeDictionaryStep.self):
			self.value = try valueContainer.decode(DecodeDictionaryStep.self, forKey: .value)
        case typeString(FunctionStep.self):
			self.value = try valueContainer.decode(FunctionStep.self, forKey: .value)
        case typeString(IfStep.self):
			self.value = try valueContainer.decode(IfStep.self, forKey: .value)
        case typeString(PrintVarStep.self):
			self.value = try valueContainer.decode(PrintVarStep.self, forKey: .value)
        case typeString(SetVarStep.self):
			self.value = try valueContainer.decode(SetVarStep.self, forKey: .value)
        case typeString(StaticValueStep.self):
			self.value = try valueContainer.decode(StaticValueStep.self, forKey: .value)
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
		case let value as DecodeDictionaryStep:
			try container.encode(value, forKey: .value)
		case let value as FunctionStep:
			try container.encode(value, forKey: .value)
		case let value as IfStep:
			try container.encode(value, forKey: .value)
		case let value as PrintVarStep:
			try container.encode(value, forKey: .value)
		case let value as SetVarStep:
			try container.encode(value, forKey: .value)
		case let value as StaticValueStep:
			try container.encode(value, forKey: .value)
		case let value as VariableStep:
			try container.encode(value, forKey: .value)
        default: fatalError()
        }
    }
}

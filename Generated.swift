// Generated using Sourcery 2.1.2 — https://github.com/krzysztofzablocki/Sourcery
// DO NOT EDIT

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
    static func make(factory: (Properties) -> any EditableVariableValue) -> APIValueStep {
        .init(
            url: factory(.url) as! Value
        )
    }

    static func makeDefault() -> APIValueStep {
        .init(
            url: Properties.url.defaultValue as! Value
		)
    }
    func value(for property: Properties) -> any EditableVariableValue {
		switch property {
	        case .url: return url
        }
    }

	func set(_ value: Any, for property: Properties) {
		switch property {
	        case .url: self.url = value as! Value
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
    static func make(factory: (Properties) -> any EditableVariableValue) -> AddToVarStep {
        .init(
            varName: factory(.varName) as! Value,
            value: factory(.value) as! Value
        )
    }

    static func makeDefault() -> AddToVarStep {
        .init(
            varName: Properties.varName.defaultValue as! Value,
            value: Properties.value.defaultValue as! Value
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
	        case .varName: self.varName = value as! Value
	        case .value: self.value = value as! Value
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
    static func make(factory: (Properties) -> any EditableVariableValue) -> ArrayValueStep {
        .init(
            array: factory(.array) as! Value,
            index: factory(.index) as! Value
        )
    }

    static func makeDefault() -> ArrayValueStep {
        .init(
            array: Properties.array.defaultValue as! Value,
            index: Properties.index.defaultValue as! Value
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
	        case .array: self.array = value as! Value
	        case .index: self.index = value as! Value
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
    static func make(factory: (Properties) -> any EditableVariableValue) -> ComparisonValue {
        .init(
            lhs: factory(.lhs) as! Value,
            rhs: factory(.rhs) as! Value,
            comparison: factory(.comparison) as! ComparisonTypeValue
        )
    }

    static func makeDefault() -> ComparisonValue {
        .init(
            lhs: Properties.lhs.defaultValue as! Value,
            rhs: Properties.rhs.defaultValue as! Value,
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
	        case .lhs: self.lhs = value as! Value
	        case .rhs: self.rhs = value as! Value
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
    static func make(factory: (Properties) -> any EditableVariableValue) -> ConditionalActionValue {
        .init(
            ifCondition: factory(.ifCondition) as! ComparisonValue,
            ifSteps: factory(.ifSteps) as! StepArray
        )
    }

    static func makeDefault() -> ConditionalActionValue {
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
    static func make(factory: (Properties) -> any EditableVariableValue) -> DecodeDictionaryStep {
        .init(
            value: factory(.value) as! Value
        )
    }

    static func makeDefault() -> DecodeDictionaryStep {
        .init(
            value: Properties.value.defaultValue as! Value
		)
    }
    func value(for property: Properties) -> any EditableVariableValue {
		switch property {
	        case .value: return value
        }
    }

	func set(_ value: Any, for property: Properties) {
		switch property {
	        case .value: self.value = value as! Value
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
    static func make(factory: (Properties) -> any EditableVariableValue) -> FunctionStep {
        .init(
            functionName: factory(.functionName) as! Value
        )
    }

    static func makeDefault() -> FunctionStep {
        .init(
            functionName: Properties.functionName.defaultValue as! Value
		)
    }
    func value(for property: Properties) -> any EditableVariableValue {
		switch property {
	        case .functionName: return functionName
        }
    }

	func set(_ value: Any, for property: Properties) {
		switch property {
	        case .functionName: self.functionName = value as! Value
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
    static func make(factory: (Properties) -> any EditableVariableValue) -> IfStep {
        .init(
            ifAction: factory(.ifAction) as! ConditionalActionValue,
            elseAction: factory(.elseAction) as! StepArray
        )
    }

    static func makeDefault() -> IfStep {
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
    static func make(factory: (Properties) -> any EditableVariableValue) -> MakeableButton {
        .init(
            title: factory(.title) as! MakeableLabel,
            action: factory(.action) as! StepArray
        )
    }

    static func makeDefault() -> MakeableButton {
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
        var defaultValue: any EditableVariableValue {
            switch self {
            case .text: return MakeableField.defaultValue(for: .text)
            case .fontSize: return MakeableField.defaultValue(for: .fontSize)
            case .onTextUpdate: return MakeableField.defaultValue(for: .onTextUpdate)
            }
        }
    }
    static func make(factory: (Properties) -> any EditableVariableValue) -> MakeableField {
        .init(
            text: factory(.text) as! TemporaryValue,
            fontSize: factory(.fontSize) as! IntValue,
            onTextUpdate: factory(.onTextUpdate) as! StepArray
        )
    }

    static func makeDefault() -> MakeableField {
        .init(
            text: Properties.text.defaultValue as! TemporaryValue,
            fontSize: Properties.fontSize.defaultValue as! IntValue,
            onTextUpdate: Properties.onTextUpdate.defaultValue as! StepArray
		)
    }
    func value(for property: Properties) -> any EditableVariableValue {
		switch property {
	        case .text: return text
	        case .fontSize: return fontSize
	        case .onTextUpdate: return onTextUpdate
        }
    }

	func set(_ value: Any, for property: Properties) {
		switch property {
	        case .text: self.text = value as! TemporaryValue
	        case .fontSize: self.fontSize = value as! IntValue
	        case .onTextUpdate: self.onTextUpdate = value as! StepArray
	    }
	}
}
extension MakeableLabel {
	 enum Properties: String, ViewProperty {
        case text
        case fontSize
        case fontWeight
        case italic
        var defaultValue: any EditableVariableValue {
            switch self {
            case .text: return MakeableLabel.defaultValue(for: .text)
            case .fontSize: return MakeableLabel.defaultValue(for: .fontSize)
            case .fontWeight: return MakeableLabel.defaultValue(for: .fontWeight)
            case .italic: return MakeableLabel.defaultValue(for: .italic)
            }
        }
    }
    static func make(factory: (Properties) -> any EditableVariableValue) -> MakeableLabel {
        .init(
            text: factory(.text) as! Value,
            fontSize: factory(.fontSize) as! IntValue,
            fontWeight: factory(.fontWeight) as! FontWeightValue,
            italic: factory(.italic) as! BoolValue
        )
    }

    static func makeDefault() -> MakeableLabel {
        .init(
            text: Properties.text.defaultValue as! Value,
            fontSize: Properties.fontSize.defaultValue as! IntValue,
            fontWeight: Properties.fontWeight.defaultValue as! FontWeightValue,
            italic: Properties.italic.defaultValue as! BoolValue
		)
    }
    func value(for property: Properties) -> any EditableVariableValue {
		switch property {
	        case .text: return text
	        case .fontSize: return fontSize
	        case .fontWeight: return fontWeight
	        case .italic: return italic
        }
    }

	func set(_ value: Any, for property: Properties) {
		switch property {
	        case .text: self.text = value as! Value
	        case .fontSize: self.fontSize = value as! IntValue
	        case .fontWeight: self.fontWeight = value as! FontWeightValue
	        case .italic: self.italic = value as! BoolValue
	    }
	}
}
extension MakeableStack {
	 enum Properties: String, ViewProperty {
        case content
        var defaultValue: any EditableVariableValue {
            switch self {
            case .content: return MakeableStack.defaultValue(for: .content)
            }
        }
    }
    static func make(factory: (Properties) -> any EditableVariableValue) -> MakeableStack {
        .init(
            content: factory(.content) as! MakeableArray
        )
    }

    static func makeDefault() -> MakeableStack {
        .init(
            content: Properties.content.defaultValue as! MakeableArray
		)
    }
    func value(for property: Properties) -> any EditableVariableValue {
		switch property {
	        case .content: return content
        }
    }

	func set(_ value: Any, for property: Properties) {
		switch property {
	        case .content: self.content = value as! MakeableArray
	    }
	}
}
extension MakeableToggle {
	 enum Properties: String, ViewProperty {
        case isOn
        case onToggleUpdate
        var defaultValue: any EditableVariableValue {
            switch self {
            case .isOn: return MakeableToggle.defaultValue(for: .isOn)
            case .onToggleUpdate: return MakeableToggle.defaultValue(for: .onToggleUpdate)
            }
        }
    }
    static func make(factory: (Properties) -> any EditableVariableValue) -> MakeableToggle {
        .init(
            isOn: factory(.isOn) as! TemporaryValue,
            onToggleUpdate: factory(.onToggleUpdate) as! StepArray
        )
    }

    static func makeDefault() -> MakeableToggle {
        .init(
            isOn: Properties.isOn.defaultValue as! TemporaryValue,
            onToggleUpdate: Properties.onToggleUpdate.defaultValue as! StepArray
		)
    }
    func value(for property: Properties) -> any EditableVariableValue {
		switch property {
	        case .isOn: return isOn
	        case .onToggleUpdate: return onToggleUpdate
        }
    }

	func set(_ value: Any, for property: Properties) {
		switch property {
	        case .isOn: self.isOn = value as! TemporaryValue
	        case .onToggleUpdate: self.onToggleUpdate = value as! StepArray
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
    static func make(factory: (Properties) -> any EditableVariableValue) -> NumericalOperationValue {
        .init(
            lhs: factory(.lhs) as! Value,
            rhs: factory(.rhs) as! Value,
            operation: factory(.operation) as! NumericalOperationTypeValue
        )
    }

    static func makeDefault() -> NumericalOperationValue {
        .init(
            lhs: Properties.lhs.defaultValue as! Value,
            rhs: Properties.rhs.defaultValue as! Value,
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
	        case .lhs: self.lhs = value as! Value
	        case .rhs: self.rhs = value as! Value
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
    static func make(factory: (Properties) -> any EditableVariableValue) -> PrintVarStep {
        .init(
            varName: factory(.varName) as! Value
        )
    }

    static func makeDefault() -> PrintVarStep {
        .init(
            varName: Properties.varName.defaultValue as! Value
		)
    }
    func value(for property: Properties) -> any EditableVariableValue {
		switch property {
	        case .varName: return varName
        }
    }

	func set(_ value: Any, for property: Properties) {
		switch property {
	        case .varName: self.varName = value as! Value
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
    static func make(factory: (Properties) -> any EditableVariableValue) -> SetVarStep {
        .init(
            varName: factory(.varName) as! Value,
            value: factory(.value) as! Value
        )
    }

    static func makeDefault() -> SetVarStep {
        .init(
            varName: Properties.varName.defaultValue as! Value,
            value: Properties.value.defaultValue as! Value
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
	        case .varName: self.varName = value as! Value
	        case .value: self.value = value as! Value
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
    static func make(factory: (Properties) -> any EditableVariableValue) -> StaticValueStep {
        .init(
            value: factory(.value) as! Value,
            type: factory(.type) as! VariableTypeValue
        )
    }

    static func makeDefault() -> StaticValueStep {
        .init(
            value: Properties.value.defaultValue as! Value,
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
	        case .value: self.value = value as! Value
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
    static func make(factory: (Properties) -> any EditableVariableValue) -> TemporaryValue {
        .init(
            initial: factory(.initial) as! Value,
            output: factory(.output) as! Variable
        )
    }

    static func makeDefault() -> TemporaryValue {
        .init(
            initial: Properties.initial.defaultValue as! Value,
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
	        case .initial: self.initial = value as! Value
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
    static func make(factory: (Properties) -> any EditableVariableValue) -> VariableStep {
        .init(
            varName: factory(.varName) as! Value,
            type: factory(.type) as! VariableTypeValue
        )
    }

    static func makeDefault() -> VariableStep {
        .init(
            varName: Properties.varName.defaultValue as! Value,
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
	        case .varName: self.varName = value as! Value
	        case .type: self.type = value as! VariableTypeValue
	    }
	}
}

extension CodableMakeableList: Codable {
	init(from decoder: Decoder) throws {
        var contentContainer = try decoder.unkeyedContainer()
        var content: [any MakeableView] = []
        while !contentContainer.isAtEnd {
            if let value = try? contentContainer.decode(MakeableButton.self) {
                content.append(value)
            }  
            else if let value = try? contentContainer.decode(MakeableField.self) {
                content.append(value)
            }  
            else if let value = try? contentContainer.decode(MakeableLabel.self) {
                content.append(value)
            }  
            else if let value = try? contentContainer.decode(MakeableStack.self) {
                content.append(value)
            }  
            else if let value = try? contentContainer.decode(MakeableToggle.self) {
                content.append(value)
            }  
            else {
                self.init(elements: [MakeableLabel.withText("ERROR")])
                return
            }
        }
        self.init(elements: content)
    }
    func encode(to encoder: Encoder) throws {
        var contentContainer = encoder.unkeyedContainer()
        for element in elements {
            switch element {
            case let value as MakeableButton:
                try contentContainer.encode(value)
            case let value as MakeableField:
                try contentContainer.encode(value)
            case let value as MakeableLabel:
                try contentContainer.encode(value)
            case let value as MakeableStack:
                try contentContainer.encode(value)
            case let value as MakeableToggle:
                try contentContainer.encode(value)
            default:
                fatalError()
            }
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
        case typeString(ArrayValue.self):
            self.value = try valueContainer.decode(ArrayValue.self, forKey: .value)
        case typeString(ArrayValueStep.self):
            self.value = try valueContainer.decode(ArrayValueStep.self, forKey: .value)
        case typeString(AxisValue.self):
            self.value = try valueContainer.decode(AxisValue.self, forKey: .value)
        case typeString(BoolValue.self):
            self.value = try valueContainer.decode(BoolValue.self, forKey: .value)
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
        case typeString(MakeableButton.self):
            self.value = try valueContainer.decode(MakeableButton.self, forKey: .value)
        case typeString(MakeableField.self):
            self.value = try valueContainer.decode(MakeableField.self, forKey: .value)
        case typeString(MakeableLabel.self):
            self.value = try valueContainer.decode(MakeableLabel.self, forKey: .value)
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
        case typeString(Value.self):
            self.value = try valueContainer.decode(Value.self, forKey: .value)
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
        case let value as ArrayValue:
            try container.encode(value, forKey: .value)
        case let value as ArrayValueStep:
            try container.encode(value, forKey: .value)
        case let value as AxisValue:
            try container.encode(value, forKey: .value)
        case let value as BoolValue:
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
        case let value as MakeableButton:
            try container.encode(value, forKey: .value)
        case let value as MakeableField:
            try container.encode(value, forKey: .value)
        case let value as MakeableLabel:
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
        case let value as Value:
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
            .init(title: "Button", onTap: {
                onSelect(MakeableButton.makeDefault())
            }),
            .init(title: "Field", onTap: {
                onSelect(MakeableField.makeDefault())
            }),
            .init(title: "Label", onTap: {
                onSelect(MakeableLabel.makeDefault())
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
	case list // ArrayValue
	case axis // AxisValue
	case boolean // BoolValue
	case comparisonType // ComparisonTypeValue
	case comparison // ComparisonValue
	case conditionalAction // ConditionalActionValue
	case dictionary // DictionaryValue
	case fontWeight // FontWeightValue
	case int // IntValue
	case makeableArray // MakeableArray
	case button // MakeableButton
	case field // MakeableField
	case label // MakeableLabel
	case stack // MakeableStack
	case toggle // MakeableToggle
	case `nil` // NilValue
	case numericalOperationType // NumericalOperationTypeValue
	case numericalOperation // NumericalOperationValue
	case optional // OptionalValue
	case stepArray // StepArray
	case string // StringValue
	case temporary // TemporaryValue
	case value // Value
	case variable // Variable
	case type // VariableTypeValue

	var defaultView: any EditableVariableValue {
        switch self {
        case .list: return ArrayValue.makeDefault()
        case .axis: return AxisValue.makeDefault()
        case .boolean: return BoolValue.makeDefault()
        case .comparisonType: return ComparisonTypeValue.makeDefault()
        case .comparison: return ComparisonValue.makeDefault()
        case .conditionalAction: return ConditionalActionValue.makeDefault()
        case .dictionary: return DictionaryValue.makeDefault()
        case .fontWeight: return FontWeightValue.makeDefault()
        case .int: return IntValue.makeDefault()
        case .makeableArray: return MakeableArray.makeDefault()
        case .button: return MakeableButton.makeDefault()
        case .field: return MakeableField.makeDefault()
        case .label: return MakeableLabel.makeDefault()
        case .stack: return MakeableStack.makeDefault()
        case .toggle: return MakeableToggle.makeDefault()
        case .`nil`: return NilValue.makeDefault()
        case .numericalOperationType: return NumericalOperationTypeValue.makeDefault()
        case .numericalOperation: return NumericalOperationValue.makeDefault()
        case .optional: return OptionalValue.makeDefault()
        case .stepArray: return StepArray.makeDefault()
        case .string: return StringValue.makeDefault()
        case .temporary: return TemporaryValue.makeDefault()
        case .value: return Value.makeDefault()
        case .variable: return Variable.makeDefault()
        case .type: return VariableTypeValue.makeDefault()
        }
    }
    var title: String {
        switch self {
        case .list: return "list"
        case .axis: return "axis"
        case .boolean: return "boolean"
        case .comparisonType: return "comparisonType"
        case .comparison: return "comparison"
        case .conditionalAction: return "conditionalAction"
        case .dictionary: return "dictionary"
        case .fontWeight: return "fontWeight"
        case .int: return "int"
        case .makeableArray: return "makeableArray"
        case .button: return "button"
        case .field: return "field"
        case .label: return "label"
        case .stack: return "stack"
        case .toggle: return "toggle"
        case .`nil`: return "`nil`"
        case .numericalOperationType: return "numericalOperationType"
        case .numericalOperation: return "numericalOperation"
        case .optional: return "optional"
        case .stepArray: return "stepArray"
        case .string: return "string"
        case .temporary: return "temporary"
        case .value: return "value"
        case .variable: return "variable"
        case .type: return "type"
        }
    }
}

extension MakeableWrapperView {
	var body: some View {
        switch view {
        case let value as MakeableButton:
            MakeableButtonView(isRunning: isRunning, showEditControls: showEditControls, button: value, onContentUpdate: onContentUpdate, onRuntimeUpdate: onRuntimeUpdate, error: $error).any
        case let value as MakeableField:
            MakeableFieldView(isRunning: isRunning, showEditControls: showEditControls, field: value, onContentUpdate: onContentUpdate, onRuntimeUpdate: onRuntimeUpdate, error: $error).any
        case let value as MakeableLabel:
            MakeableLabelView(isRunning: isRunning, showEditControls: showEditControls, label: value, onContentUpdate: onContentUpdate, onRuntimeUpdate: onRuntimeUpdate, error: $error).any
        case let value as MakeableStack:
            MakeableStackView(isRunning: isRunning, showEditControls: showEditControls, stack: value, onContentUpdate: onContentUpdate, onRuntimeUpdate: onRuntimeUpdate, error: $error).any
        case let value as MakeableToggle:
            MakeableToggleView(isRunning: isRunning, showEditControls: showEditControls, toggle: value, onContentUpdate: onContentUpdate, onRuntimeUpdate: onRuntimeUpdate, error: $error).any
        default:
            Text("UNKNOWN VIEW").any
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

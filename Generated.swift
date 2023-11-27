// Generated using Sourcery 2.1.2 — https://github.com/krzysztofzablocki/Sourcery
// DO NOT EDIT

import SwiftUI

extension APIValueStep {
	 enum Properties: String, ViewProperty {
        case url
        var defaultValue: Any {
            switch self {
            case .url: return APIValueStep.defaultValue(for: .url)
            }
        }
    }
    static func make(factory: (Properties) -> Any) -> APIValueStep {
        .init(
            url: factory(.url) as! Value
        )
    }

    static func makeDefault() -> APIValueStep {
        .init(
            url: Properties.url.defaultValue as! Value
		)
    }
    func value(for property: Properties) -> Any? {
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
        var defaultValue: Any {
            switch self {
            case .varName: return AddToVarStep.defaultValue(for: .varName)
            case .value: return AddToVarStep.defaultValue(for: .value)
            }
        }
    }
    static func make(factory: (Properties) -> Any) -> AddToVarStep {
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
    func value(for property: Properties) -> Any? {
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

extension ArrayValue {
	 enum Properties: String, ViewProperty {
        case type
        case elements
        var defaultValue: Any {
            switch self {
            case .type: return ArrayValue.defaultValue(for: .type)
            case .elements: return ArrayValue.defaultValue(for: .elements)
            }
        }
    }
    static func make(factory: (Properties) -> Any) -> ArrayValue {
        .init(
            type: factory(.type) as! VariableType,
            elements: factory(.elements) as! [any EditableVariableValue]
        )
    }

    static func makeDefault() -> ArrayValue {
        .init(
            type: Properties.type.defaultValue as! VariableType,
            elements: Properties.elements.defaultValue as! [any EditableVariableValue]
		)
    }
    func value(for property: Properties) -> Any? {
		switch property {
	        case .type: return type
	        case .elements: return elements
        }
    }

	func set(_ value: Any, for property: Properties) {
		switch property {
	        case .type: self.type = value as! VariableType
	        case .elements: self.elements = value as! [any EditableVariableValue]
	    }
	}
}

extension ArrayValueStep {
	 enum Properties: String, ViewProperty {
        case array
        case index
        var defaultValue: Any {
            switch self {
            case .array: return ArrayValueStep.defaultValue(for: .array)
            case .index: return ArrayValueStep.defaultValue(for: .index)
            }
        }
    }
    static func make(factory: (Properties) -> Any) -> ArrayValueStep {
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
    func value(for property: Properties) -> Any? {
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

extension AxisValue {
	 enum Properties: String, ViewProperty {
        case value
        var defaultValue: Any {
            switch self {
            case .value: return AxisValue.defaultValue
            }
        }
    }
    static func make(factory: (Properties) -> Any) -> AxisValue {
        .init(
            value: factory(.value) as! Axis
        )
    }

    static func makeDefault() -> AxisValue {
        .init(
            value: Properties.value.defaultValue as! Axis
		)
    }
    func value(for property: Properties) -> Any? {
		switch property {
	        case .value: return value
        }
    }

	func set(_ value: Any, for property: Properties) {
		switch property {
	        case .value: self.value = value as! Axis
	    }
	}
}

extension BoolValue {
	 enum Properties: String, ViewProperty {
        case value
        var defaultValue: Any {
            switch self {
            case .value: return BoolValue.defaultValue
            }
        }
    }
    static func make(factory: (Properties) -> Any) -> BoolValue {
        .init(
            value: factory(.value) as! Bool
        )
    }

    static func makeDefault() -> BoolValue {
        .init(
            value: Properties.value.defaultValue as! Bool
		)
    }
    func value(for property: Properties) -> Any? {
		switch property {
	        case .value: return value
        }
    }

	func set(_ value: Any, for property: Properties) {
		switch property {
	        case .value: self.value = value as! Bool
	    }
	}
}

extension ConditionalActionValue {
	 enum Properties: String, ViewProperty {
        case ifCondition
        case ifSteps
        var defaultValue: Any {
            switch self {
            case .ifCondition: return ConditionalActionValue.defaultValue(for: .ifCondition)
            case .ifSteps: return ConditionalActionValue.defaultValue(for: .ifSteps)
            }
        }
    }
    static func make(factory: (Properties) -> Any) -> ConditionalActionValue {
        .init(
            ifCondition: factory(.ifCondition) as! Value,
            ifSteps: factory(.ifSteps) as! StepArray
        )
    }

    static func makeDefault() -> ConditionalActionValue {
        .init(
            ifCondition: Properties.ifCondition.defaultValue as! Value,
            ifSteps: Properties.ifSteps.defaultValue as! StepArray
		)
    }
    func value(for property: Properties) -> Any? {
		switch property {
	        case .ifCondition: return ifCondition
	        case .ifSteps: return ifSteps
        }
    }

	func set(_ value: Any, for property: Properties) {
		switch property {
	        case .ifCondition: self.ifCondition = value as! Value
	        case .ifSteps: self.ifSteps = value as! StepArray
	    }
	}
}

extension DecodeDictionaryStep {
	 enum Properties: String, ViewProperty {
        case value
        var defaultValue: Any {
            switch self {
            case .value: return DecodeDictionaryStep.defaultValue(for: .value)
            }
        }
    }
    static func make(factory: (Properties) -> Any) -> DecodeDictionaryStep {
        .init(
            value: factory(.value) as! Value
        )
    }

    static func makeDefault() -> DecodeDictionaryStep {
        .init(
            value: Properties.value.defaultValue as! Value
		)
    }
    func value(for property: Properties) -> Any? {
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

extension DictionaryValue {
	 enum Properties: String, ViewProperty {
        case type
        case elements
        var defaultValue: Any {
            switch self {
            case .type: return DictionaryValue.defaultValue(for: .type)
            case .elements: return DictionaryValue.defaultValue(for: .elements)
            }
        }
    }
    static func make(factory: (Properties) -> Any) -> DictionaryValue {
        .init(
            type: factory(.type) as! VariableTypeValue,
            elements: factory(.elements) as! [StringValue: any EditableVariableValue]
        )
    }

    static func makeDefault() -> DictionaryValue {
        .init(
            type: Properties.type.defaultValue as! VariableTypeValue,
            elements: Properties.elements.defaultValue as! [StringValue: any EditableVariableValue]
		)
    }
    func value(for property: Properties) -> Any? {
		switch property {
	        case .type: return type
	        case .elements: return elements
        }
    }

	func set(_ value: Any, for property: Properties) {
		switch property {
	        case .type: self.type = value as! VariableTypeValue
	        case .elements: self.elements = value as! [StringValue: any EditableVariableValue]
	    }
	}
}

extension FontWeightValue {
	 enum Properties: String, ViewProperty {
        case value
        var defaultValue: Any {
            switch self {
            case .value: return FontWeightValue.defaultValue
            }
        }
    }
    static func make(factory: (Properties) -> Any) -> FontWeightValue {
        .init(
            value: factory(.value) as! Font.Weight
        )
    }

    static func makeDefault() -> FontWeightValue {
        .init(
            value: Properties.value.defaultValue as! Font.Weight
		)
    }
    func value(for property: Properties) -> Any? {
		switch property {
	        case .value: return value
        }
    }

	func set(_ value: Any, for property: Properties) {
		switch property {
	        case .value: self.value = value as! Font.Weight
	    }
	}
}

extension IfStep {
	 enum Properties: String, ViewProperty {
        case ifAction
        case elseAction
        var defaultValue: Any {
            switch self {
            case .ifAction: return IfStep.defaultValue(for: .ifAction)
            case .elseAction: return IfStep.defaultValue(for: .elseAction)
            }
        }
    }
    static func make(factory: (Properties) -> Any) -> IfStep {
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
    func value(for property: Properties) -> Any? {
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

extension IntValue {
	 enum Properties: String, ViewProperty {
        case value
        var defaultValue: Any {
            switch self {
            case .value: return IntValue.defaultValue
            }
        }
    }
    static func make(factory: (Properties) -> Any) -> IntValue {
        .init(
            value: factory(.value) as! Int
        )
    }

    static func makeDefault() -> IntValue {
        .init(
            value: Properties.value.defaultValue as! Int
		)
    }
    func value(for property: Properties) -> Any? {
		switch property {
	        case .value: return value
        }
    }

	func set(_ value: Any, for property: Properties) {
		switch property {
	        case .value: self.value = value as! Int
	    }
	}
}

extension MakeableArray {
	 enum Properties: String, ViewProperty {
        case value
        case axis
        var defaultValue: Any {
            switch self {
            case .value: return MakeableArray.defaultValue
            case .axis: return MakeableArray.defaultValue
            }
        }
    }
    static func make(factory: (Properties) -> Any) -> MakeableArray {
        .init(
            value: factory(.value) as! [any MakeableView],
            axis: factory(.axis) as! AxisValue
        )
    }

    static func makeDefault() -> MakeableArray {
        .init(
            value: Properties.value.defaultValue as! [any MakeableView],
            axis: Properties.axis.defaultValue as! AxisValue
		)
    }
    func value(for property: Properties) -> Any? {
		switch property {
	        case .value: return value
	        case .axis: return axis
        }
    }

	func set(_ value: Any, for property: Properties) {
		switch property {
	        case .value: self.value = value as! [any MakeableView]
	        case .axis: self.axis = value as! AxisValue
	    }
	}
}

extension MakeableButton {
	 enum Properties: String, ViewProperty {
        case title
        case action
        var defaultValue: Any {
            switch self {
            case .title: return MakeableButton.defaultValue(for: .title)
            case .action: return MakeableButton.defaultValue(for: .action)
            }
        }
    }
    static func make(factory: (Properties) -> Any) -> MakeableButton {
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
    func value(for property: Properties) -> Any? {
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
        var defaultValue: Any {
            switch self {
            case .text: return MakeableField.defaultValue(for: .text)
            case .fontSize: return MakeableField.defaultValue(for: .fontSize)
            case .onTextUpdate: return MakeableField.defaultValue(for: .onTextUpdate)
            }
        }
    }
    static func make(factory: (Properties) -> Any) -> MakeableField {
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
    func value(for property: Properties) -> Any? {
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
        var defaultValue: Any {
            switch self {
            case .text: return MakeableLabel.defaultValue(for: .text)
            case .fontSize: return MakeableLabel.defaultValue(for: .fontSize)
            case .fontWeight: return MakeableLabel.defaultValue(for: .fontWeight)
            case .italic: return MakeableLabel.defaultValue(for: .italic)
            }
        }
    }
    static func make(factory: (Properties) -> Any) -> MakeableLabel {
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
    func value(for property: Properties) -> Any? {
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
        var defaultValue: Any {
            switch self {
            case .content: return MakeableStack.defaultValue(for: .content)
            }
        }
    }
    static func make(factory: (Properties) -> Any) -> MakeableStack {
        .init(
            content: factory(.content) as! MakeableArray
        )
    }

    static func makeDefault() -> MakeableStack {
        .init(
            content: Properties.content.defaultValue as! MakeableArray
		)
    }
    func value(for property: Properties) -> Any? {
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

extension PrintVarStep {
	 enum Properties: String, ViewProperty {
        case varName
        var defaultValue: Any {
            switch self {
            case .varName: return PrintVarStep.defaultValue(for: .varName)
            }
        }
    }
    static func make(factory: (Properties) -> Any) -> PrintVarStep {
        .init(
            varName: factory(.varName) as! Value
        )
    }

    static func makeDefault() -> PrintVarStep {
        .init(
            varName: Properties.varName.defaultValue as! Value
		)
    }
    func value(for property: Properties) -> Any? {
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
        var defaultValue: Any {
            switch self {
            case .varName: return SetVarStep.defaultValue(for: .varName)
            case .value: return SetVarStep.defaultValue(for: .value)
            }
        }
    }
    static func make(factory: (Properties) -> Any) -> SetVarStep {
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
    func value(for property: Properties) -> Any? {
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
        var defaultValue: Any {
            switch self {
            case .value: return StaticValueStep.defaultValue(for: .value)
            case .type: return StaticValueStep.defaultValue(for: .type)
            }
        }
    }
    static func make(factory: (Properties) -> Any) -> StaticValueStep {
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
    func value(for property: Properties) -> Any? {
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

extension StepArray {
	 enum Properties: String, ViewProperty {
        case value
        var defaultValue: Any {
            switch self {
            case .value: return StepArray.defaultValue
            }
        }
    }
    static func make(factory: (Properties) -> Any) -> StepArray {
        .init(
            value: factory(.value) as! [any StepType]
        )
    }

    static func makeDefault() -> StepArray {
        .init(
            value: Properties.value.defaultValue as! [any StepType]
		)
    }
    func value(for property: Properties) -> Any? {
		switch property {
	        case .value: return value
        }
    }

	func set(_ value: Any, for property: Properties) {
		switch property {
	        case .value: self.value = value as! [any StepType]
	    }
	}
}

extension StringValue {
	 enum Properties: String, ViewProperty {
        case value
        var defaultValue: Any {
            switch self {
            case .value: return StringValue.defaultValue
            }
        }
    }
    static func make(factory: (Properties) -> Any) -> StringValue {
        .init(
            value: factory(.value) as! String
        )
    }

    static func makeDefault() -> StringValue {
        .init(
            value: Properties.value.defaultValue as! String
		)
    }
    func value(for property: Properties) -> Any? {
		switch property {
	        case .value: return value
        }
    }

	func set(_ value: Any, for property: Properties) {
		switch property {
	        case .value: self.value = value as! String
	    }
	}
}

extension TemporaryValue {
	 enum Properties: String, ViewProperty {
        case initial
        case output
        var defaultValue: Any {
            switch self {
            case .initial: return TemporaryValue.defaultValue(for: .initial)
            case .output: return TemporaryValue.defaultValue(for: .output)
            }
        }
    }
    static func make(factory: (Properties) -> Any) -> TemporaryValue {
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
    func value(for property: Properties) -> Any? {
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

extension Value {
	 enum Properties: String, ViewProperty {
        case value
        var defaultValue: Any {
            switch self {
            case .value: return Value.defaultValue
            }
        }
    }
    static func make(factory: (Properties) -> Any) -> Value {
        .init(
            value: factory(.value) as! any EditableVariableValue
        )
    }

    static func makeDefault() -> Value {
        .init(
            value: Properties.value.defaultValue as! any EditableVariableValue
		)
    }
    func value(for property: Properties) -> Any? {
		switch property {
	        case .value: return value
        }
    }

	func set(_ value: Any, for property: Properties) {
		switch property {
	        case .value: self.value = value as! any EditableVariableValue
	    }
	}
}

extension Variable {
	 enum Properties: String, ViewProperty {
        case value
        var defaultValue: Any {
            switch self {
            case .value: return Variable.defaultValue
            }
        }
    }
    static func make(factory: (Properties) -> Any) -> Variable {
        .init(
            value: factory(.value) as! any EditableVariableValue
        )
    }

    static func makeDefault() -> Variable {
        .init(
            value: Properties.value.defaultValue as! any EditableVariableValue
		)
    }
    func value(for property: Properties) -> Any? {
		switch property {
	        case .value: return value
        }
    }

	func set(_ value: Any, for property: Properties) {
		switch property {
	        case .value: self.value = value as! any EditableVariableValue
	    }
	}
}

extension VariableStep {
	 enum Properties: String, ViewProperty {
        case varName
        case type
        var defaultValue: Any {
            switch self {
            case .varName: return VariableStep.defaultValue(for: .varName)
            case .type: return VariableStep.defaultValue(for: .type)
            }
        }
    }
    static func make(factory: (Properties) -> Any) -> VariableStep {
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
    func value(for property: Properties) -> Any? {
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

extension VariableTypeValue {
	 enum Properties: String, ViewProperty {
        case value
        var defaultValue: Any {
            switch self {
            case .value: return VariableTypeValue.defaultValue
            }
        }
    }
    static func make(factory: (Properties) -> Any) -> VariableTypeValue {
        .init(
            value: factory(.value) as! VariableType
        )
    }

    static func makeDefault() -> VariableTypeValue {
        .init(
            value: Properties.value.defaultValue as! VariableType
		)
    }
    func value(for property: Properties) -> Any? {
		switch property {
	        case .value: return value
        }
    }

	func set(_ value: Any, for property: Properties) {
		switch property {
	        case .value: self.value = value as! VariableType
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
        case typeString(ConditionalActionValue.self):
            self.value = try valueContainer.decode(ConditionalActionValue.self, forKey: .value)
        case typeString(DecodeDictionaryStep.self):
            self.value = try valueContainer.decode(DecodeDictionaryStep.self, forKey: .value)
        case typeString(DictionaryValue.self):
            self.value = try valueContainer.decode(DictionaryValue.self, forKey: .value)
        case typeString(FontWeightValue.self):
            self.value = try valueContainer.decode(FontWeightValue.self, forKey: .value)
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
        case let value as ConditionalActionValue:
            try container.encode(value, forKey: .value)
        case let value as DecodeDictionaryStep:
            try container.encode(value, forKey: .value)
        case let value as DictionaryValue:
            try container.encode(value, forKey: .value)
        case let value as FontWeightValue:
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
            })
        ])
	}
}


enum VariableType: String, CaseIterable, Equatable, Codable {   
	case list // ArrayValue
	case axis // AxisValue
	case boolean // BoolValue
	case conditionalAction // ConditionalActionValue
	case dictionary // DictionaryValue
	case fontWeight // FontWeightValue
	case int // IntValue
	case makeableArray // MakeableArray
	case button // MakeableButton
	case field // MakeableField
	case label // MakeableLabel
	case stack // MakeableStack
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
        case .conditionalAction: return ConditionalActionValue.makeDefault()
        case .dictionary: return DictionaryValue.makeDefault()
        case .fontWeight: return FontWeightValue.makeDefault()
        case .int: return IntValue.makeDefault()
        case .makeableArray: return MakeableArray.makeDefault()
        case .button: return MakeableButton.makeDefault()
        case .field: return MakeableField.makeDefault()
        case .label: return MakeableLabel.makeDefault()
        case .stack: return MakeableStack.makeDefault()
        case .stepArray: return StepArray.makeDefault()
        case .string: return StringValue.makeDefault()
        case .temporary: return TemporaryValue.makeDefault()
        case .value: return Value.makeDefault()
        case .variable: return Variable.makeDefault()
        case .type: return VariableTypeValue.makeDefault()
        }
    }
}

extension MakeableWrapperView {
	var body: some View {
        switch view {
        case let value as MakeableButton:
            MakeableButtonView(isRunning: isRunning, showEditControls: showEditControls, button: value, onContentUpdate: onContentUpdate, onRuntimeUpdate: onRuntimeUpdate).any
        case let value as MakeableField:
            MakeableFieldView(isRunning: isRunning, showEditControls: showEditControls, field: value, onContentUpdate: onContentUpdate, onRuntimeUpdate: onRuntimeUpdate).any
        case let value as MakeableLabel:
            MakeableLabelView(isRunning: isRunning, showEditControls: showEditControls, label: value, onContentUpdate: onContentUpdate, onRuntimeUpdate: onRuntimeUpdate).any
        case let value as MakeableStack:
            MakeableStackView(isRunning: isRunning, showEditControls: showEditControls, stack: value, onContentUpdate: onContentUpdate, onRuntimeUpdate: onRuntimeUpdate).any
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

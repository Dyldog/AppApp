// Generated using Sourcery 2.1.2 — https://github.com/krzysztofzablocki/Sourcery
// DO NOT EDIT

import SwiftUI

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
            elements: factory(.elements) as! [any VariableValue]
        )
    }

    static func makeDefault() -> ArrayValue {
        .init(
            type: Properties.type.defaultValue as! VariableType,
            elements: Properties.elements.defaultValue as! [any VariableValue]
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
	        case .elements: self.elements = value as! [any VariableValue]
	    }
	}
}

extension BoolValue {
	enum Properties: String, PrimitiveViewProperty {
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

extension FontWeightValue {
	enum Properties: String, PrimitiveViewProperty {
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

extension IntValue {
	enum Properties: String, PrimitiveViewProperty {
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
	enum Properties: String, PrimitiveViewProperty {
        case value
        var defaultValue: Any {
            switch self {
            case .value: return MakeableArray.defaultValue
            }
        }
    }
    static func make(factory: (Properties) -> Any) -> MakeableArray {
        .init(
            value: factory(.value) as! [any MakeableView]
        )
    }

    static func makeDefault() -> MakeableArray {
        .init(
            value: Properties.value.defaultValue as! [any MakeableView]
		)
    }
    func value(for property: Properties) -> Any? {
		switch property {
	        case .value: return value
        }
    }

	func set(_ value: Any, for property: Properties) {
		switch property {
	        case .value: self.value = value as! [any MakeableView]
	    }
	}
}

extension MakeableButton {
	 enum Properties: String, ViewProperty {
        case title
        case action
        case fontSize
        case fontWeight
        case italic
        var defaultValue: Any {
            switch self {
            case .title: return MakeableButton.defaultValue(for: .title)
            case .action: return MakeableButton.defaultValue(for: .action)
            case .fontSize: return MakeableButton.defaultValue(for: .fontSize)
            case .fontWeight: return MakeableButton.defaultValue(for: .fontWeight)
            case .italic: return MakeableButton.defaultValue(for: .italic)
            }
        }
    }
    static func make(factory: (Properties) -> Any) -> MakeableButton {
        .init(
            title: factory(.title) as! Value,
            action: factory(.action) as! StepArray,
            fontSize: factory(.fontSize) as! IntValue,
            fontWeight: factory(.fontWeight) as! FontWeightValue,
            italic: factory(.italic) as! BoolValue
        )
    }

    static func makeDefault() -> MakeableButton {
        .init(
            title: Properties.title.defaultValue as! Value,
            action: Properties.action.defaultValue as! StepArray,
            fontSize: Properties.fontSize.defaultValue as! IntValue,
            fontWeight: Properties.fontWeight.defaultValue as! FontWeightValue,
            italic: Properties.italic.defaultValue as! BoolValue
		)
    }
    func value(for property: Properties) -> Any? {
		switch property {
	        case .title: return title
	        case .action: return action
	        case .fontSize: return fontSize
	        case .fontWeight: return fontWeight
	        case .italic: return italic
        }
    }

	func set(_ value: Any, for property: Properties) {
		switch property {
	        case .title: self.title = value as! Value
	        case .action: self.action = value as! StepArray
	        case .fontSize: self.fontSize = value as! IntValue
	        case .fontWeight: self.fontWeight = value as! FontWeightValue
	        case .italic: self.italic = value as! BoolValue
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

extension StepArray {
	enum Properties: String, PrimitiveViewProperty {
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
	enum Properties: String, PrimitiveViewProperty {
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

extension Value {
	enum Properties: String, PrimitiveViewProperty {
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
	enum Properties: String, PrimitiveViewProperty {
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

extension VariableTypeValue {
	enum Properties: String, PrimitiveViewProperty {
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


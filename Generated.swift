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
	case boolean // BoolValue
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
        case .boolean: return BoolValue.makeDefault()
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
            MakeableButtonView(makeMode: makeMode, button: value, onContentUpdate: onContentUpdate, onRuntimeUpdate: onRuntimeUpdate, variables: $variables, error: $error).any
        case let value as MakeableField:
            MakeableFieldView(makeMode: makeMode, field: value, onContentUpdate: onContentUpdate, onRuntimeUpdate: onRuntimeUpdate, variables: $variables, error: $error).any
        case let value as MakeableLabel:
            MakeableLabelView(makeMode: makeMode, label: value, onContentUpdate: onContentUpdate, onRuntimeUpdate: onRuntimeUpdate, variables: $variables, error: $error).any
        case let value as MakeableStack:
            MakeableStackView(makeMode: makeMode, stack: value, onContentUpdate: onContentUpdate, onRuntimeUpdate: onRuntimeUpdate, variables: $variables, error: $error).any
        default:
            Text("UNKNOWN VIEW").any
        }
    }
}
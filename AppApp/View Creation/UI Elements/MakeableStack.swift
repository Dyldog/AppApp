//
//  MakeableStack.swift
//  AppApp
//
//  Created by Dylan Elliott on 21/11/2023.
//

import SwiftUI
import DylKit

struct MakeableStack: MakeableView {
    enum Properties: String, CaseIterable, ViewProperty {
        case content
        
        var defaultValue: VariableValue { [] }
    }
    
    let content: [any MakeableView]
    let makeMode: Bool
    let addTapped: (Int) -> Void
    let editTapped: (Int) -> Void
    let removedTapped: (Int) -> Void
    
    init(
        content: [any MakeableView],
        makeMode: Bool = false,
        addTapped: @escaping (Int) -> Void,
        editTapped: @escaping (Int) -> Void,
        removedTapped: @escaping (Int) -> Void
    ) {
        self.content = content
        self.addTapped = addTapped
        self.editTapped = editTapped
        self.makeMode = makeMode
        self.removedTapped = removedTapped
    }
    
    func value(for property: Properties) -> (VariableValue)? {
        switch property {
        case .content: return nil
        }
    }
    
    static func make(factory: (Properties) -> any VariableValue) -> MakeableStack {
        .init(
            content: factory(.content) as! [any MakeableView],
            addTapped: { _ in },
            editTapped: { _ in }, 
            removedTapped: { _ in }
        )
    }
    
    func view(variables: Binding<Variables>?, alert: Binding<Alert?>?) -> AnyView {
        VStack {
            if makeMode {
                makeButton(at: 0)
            }
            
            ForEach(Array(content.enumerated()), id: \.offset) { (index, element) in
//                DoView {
                if let content = try? element.view(variables: variables, alert: alert) {
                    //                } content: { content in
                    VStack {
                        HStack {
                            content
                                .onEdit(makeMode ? { editTapped(index) } : nil)
                            
                            if makeMode {
                                SwiftUI.Button("X", action: { removedTapped(index) })
                            }
                        }
                        
                        if makeMode {
                            makeButton(at: index + 1)
                        }
                    }.any
                    //                } onError: { error in
                    ////                    alert?.wrappedValue = .init(title: "ERROR", message: $0.localizedDescription)
                    //                    return VStack {
                    //                        Text("ERROR: \(error.localizedDescription)")
                    //                    }.any
                    //                }
                }
            }
        }.if(makeMode) {
            $0.padding().border(.black, width: 2)
        }
    }
    
    func makeButton(at index: Int) -> some View {
        SwiftUI.Button("Add", action: {
            addTapped(index)
        })
    }
}

extension MakeableStack: Codable {
    enum CodingKeys: String, CodingKey {
        case content
    }
    
    init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        self.init(
            content: try container.decode(CodableMakeableList.self, forKey: .content).elements,
            addTapped: { _ in },
            editTapped: { _ in },
            removedTapped: { _ in }
        )
    }
    
    func encode(to encoder: Encoder) throws {
        var container = encoder.container(keyedBy: CodingKeys.self)
        try container.encode(CodableMakeableList(elements: content), forKey: .content)
    }
}

struct CodableMakeableList: Codable {
    let elements: [any MakeableView]
    
    init(elements: [any MakeableView]) {
        self.elements = elements
    }
    
    init(from decoder: Decoder) throws {
        var contentContainer = try decoder.unkeyedContainer()
        
        var content: [any MakeableView] = []
        
        while !contentContainer.isAtEnd {
            if let value = try? contentContainer.decode(MakeableStack.self) {
                content.append(value)
            } else if let value = try? contentContainer.decode(MakeableField.self) {
                content.append(value)
            } else if let value = try? contentContainer.decode(MakeableLabel.self) {
                content.append(value)
            } else if let value = try? contentContainer.decode(MakeableButton.self) {
                content.append(value)
            } else {
//                fatalError()
                self.init(elements: [MakeableLabel(text: StringValue(value: "ERROR"), fontSize: 18)])
                return
            }
        }
        
        self.init(elements: content)
    }
    
    func encode(to encoder: Encoder) throws {
        var contentContainer = encoder.unkeyedContainer()
        
        for element in elements {
            switch element {
            case let stack as MakeableStack:
                try contentContainer.encode(stack)
            case let label as MakeableLabel:
                try contentContainer.encode(label)
            case let button as MakeableButton:
                try contentContainer.encode(button)
            case let field as MakeableField:
                try contentContainer.encode(field)
            default:
                fatalError()
            }
        }
    }
}

struct CodableVariableValue: Codable {
    enum CodingKeys: String, CodingKey {
        case type
        case value
    }
    
    let type: String
    let value: VariableValue
    
    init(value: VariableValue) {
        self.value = value
        self.type = typeString(Swift.type(of: value))
    }
    
    init(from decoder: Decoder) throws {
        let valueContainer = try decoder.container(keyedBy: CodingKeys.self)
        
        self.type = try valueContainer.decode(String.self, forKey: .type)
        
        switch type {
        case typeString(Value.self):
            self.value = try valueContainer.decode(Value.self, forKey: .value)
        case typeString(ActionValue.self):
            self.value = try valueContainer.decode(ActionValue.self, forKey: .value)
        case typeString(ArrayValue.self):
            self.value = try valueContainer.decode(ArrayValue.self, forKey: .value)
        case typeString(DictionaryValue.self):
            self.value = try valueContainer.decode(DictionaryValue.self, forKey: .value)
        case typeString(Variable.self):
            self.value = try valueContainer.decode(Variable.self, forKey: .value)
        case typeString(VariableType.self):
            self.value = try valueContainer.decode(VariableType.self, forKey: .value)
        case typeString(Int.self):
            self.value = try valueContainer.decode(Int.self, forKey: .value)
        case typeString(StringValue.self):
            self.value = try valueContainer.decode(StringValue.self, forKey: .value)
        default:
            fatalError(type)
        }
    }
    
    func encode(to encoder: Encoder) throws {
        var container = encoder.container(keyedBy: CodingKeys.self)
        
        try container.encode(type, forKey: .type)
        
        switch self.value {
        case let value as Value:
            try container.encode(value, forKey: .value)
        case let value as ActionValue:
            try container.encode(value, forKey: .value)
        case let value as ArrayValue:
            try container.encode(value, forKey: .value)
        case let value as DictionaryValue:
            try container.encode(value, forKey: .value)
        case let value as Variable:
            try container.encode(value, forKey: .value)
        case let value as VariableType:
            try container.encode(value, forKey: .value)
        case let value as Int:
            try container.encode(value, forKey: .value)
        case let value as StringValue:
            try container.encode(value, forKey: .value)
        default: fatalError()
        }
    }
}

struct CodableVariableList: Codable {
    let variables: [CodableVariableValue]
    var values: [any VariableValue] { variables.map { $0.value } }
    
    init(variables: [CodableVariableValue]) {
        self.variables = variables
    }
    
    init(variables: [any VariableValue]) {
        self.variables = variables.map { .init(value: $0) }
    }
}

struct CodableVariableDictionary: Codable {
    let variables: [StringValue: CodableVariableValue]
    var values: [StringValue: any VariableValue] { variables.mapValues { $0.value } }
    
    init(variables: [StringValue: CodableVariableValue]) {
        self.variables = variables
    }
    
    init(variables: [StringValue: any VariableValue]) {
        self.variables = variables.mapValues { .init(value: $0) }
    }
}

struct CodableStepList: Codable {
    let steps: [any StepType]
    
    init(steps: [any StepType]) {
        self.steps = steps
    }
    
    func encode(to encoder: Encoder) throws {
        var actionContainer = encoder.unkeyedContainer()
        
        for action in steps {
            switch action {
            case let setVariable as SetVarStep:
                try actionContainer.encode(setVariable)
            case let addToVariable as AddToVarStep:
                try actionContainer.encode(addToVariable)
            case let printVariable as PrintVarStep:
                try actionContainer.encode(printVariable)
            case let staticValue as StaticValueStep:
                try actionContainer.encode(staticValue)
            case let getVariable as VariableStep:
                try actionContainer.encode(getVariable)
            case let getFromAPI as APIValueStep:
                try actionContainer.encode(getFromAPI)
            case let decodeJSON as DecodeDictionaryStep:
                try actionContainer.encode(decodeJSON)
            case let getDictValue as DictionaryValueForKeyStep:
                try actionContainer.encode(getDictValue)
            default:
                fatalError()
            }
        }
    }
    
    init(from decoder: Decoder) throws {
        var initActions = [any StepType]()
        var actionContainer = try decoder.unkeyedContainer()
        
        guard !actionContainer.isAtEnd else {
            self.init(steps: [])
            return
        }
        
        while !actionContainer.isAtEnd {
            if let value = try? actionContainer.decode(SetVarStep.self) {
                initActions.append(value)
            } else if let value = try? actionContainer.decode(SetVarStep.self) {
                initActions.append(value)
            } else if let value = try? actionContainer.decode(AddToVarStep.self) {
                initActions.append(value)
            } else if let value = try? actionContainer.decode(PrintVarStep.self) {
                initActions.append(value)
            } else if let value = try? actionContainer.decode(StaticValueStep.self) {
                initActions.append(value)
            } else if let value = try? actionContainer.decode(VariableStep.self) {
                initActions.append(value)
            } else if let value = try? actionContainer.decode(APIValueStep.self) {
                initActions.append(value)
            } else if let value = try? actionContainer.decode(DecodeDictionaryStep.self) {
                initActions.append(value)
            } else if let value = try? actionContainer.decode(DictionaryValueForKeyStep.self) {
                initActions.append(value)
            } else {
                fatalError()
            }
        }
        
        self.init(steps: initActions)
    }
}

func typeString(_ value: VariableValue.Type) -> String {
    String(describing: value).replacingOccurrences(of: "AppApp.", with: "")
}
//
//func valueTypeString<T>(_ value: T) -> String {
//    String(describing: type(of: value)).replacingOccurrences(of: "AppApp.", with: "")
//}

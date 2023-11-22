//
//  MakeableField.swift
//  AppApp
//
//  Created by Dylan Elliott on 21/11/2023.
//

import SwiftUI

final class MakeableField: MakeableView, Codable {
    var text: Value
    var fontSize: Int
    var onTextUpdate: [any StepType]
    var onEdit: (() -> Void)?
    
    init(text: Value, fontSize: Int, onTextUpdate: [any StepType], onEdit: (() -> Void)? = nil) {
        self.text = text
        self.fontSize = fontSize
        self.onTextUpdate = onTextUpdate
        self.onEdit = onEdit
    }
    
    func view(variables: Binding<Variables>?, alert: Binding<Alert?>?) throws -> AnyView {
        func field(_ text: String, variables: Binding<Variables>) -> AnyView {
            return TextField("", text: .init(get: {
                text
            }, set: {
                do {
                    self.text = Value(stringLiteral: $0)
//
//                    var variables = variables.wrappedValue
                    variables.wrappedValue.set(Value(stringLiteral: $0), for: "$0")
                    try self.onTextUpdate.forEach {
                        try $0.run(with: &variables.wrappedValue)
                    }
                    
//                    onEdit?()
                } catch {
//                    alert?.wrappedValue = .init(title: "Error", message: error.localizedDescription)
                }
            })).font(.system(size: CGFloat(fontSize))).any
        }
        if var variables = variables {
            guard let value = try text.value(with: &variables.wrappedValue)?.valueString
            else { throw VariableValueError.valueNotFoundForVariable }
            return field(value, variables: variables)
        } else {
//            return field(text.protoString)
            return Text(text.protoString)
                .font(.system(size: CGFloat(fontSize)))
                .frame(maxWidth: .infinity, alignment: .leading)
                .any
        }
    }
    
    func value(for property: Properties) -> (VariableValue)? {
        switch property {
        case .text: return text
        case .fontSize: return fontSize
        case .onTextUpdate: return onTextUpdate
        }
    }
    
    static func make(factory: (Properties) -> VariableValue) -> MakeableField {
        .init(
            text: .init(value: factory(.text)),
            fontSize: factory(.fontSize) as! Int,
            onTextUpdate: factory(.onTextUpdate) as! [any StepType]
        )
    }
    
    enum Properties: String, CaseIterable, ViewProperty {
        case text
        case fontSize
        case onTextUpdate
        
        var defaultValue: VariableValue {
            switch self {
            case .text: return "TEXT" as Value
            case .fontSize: return 18
            case .onTextUpdate: return [any StepType]()
            }
        }
    }

    enum CodingKeys: String, CodingKey {
        case text
        case fontSize
        case onTextUpdate
    }
    
    required init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        self.text = try container.decode(Value.self, forKey: .text)
        self.fontSize = try container.decode(Int.self, forKey: .fontSize)
        self.onTextUpdate = try container.decode(CodableStepList.self, forKey: .onTextUpdate).steps
    }
    
    func encode(to encoder: Encoder) throws {
        var container = encoder.container(keyedBy: CodingKeys.self)
        try container.encode(text, forKey: .text)
        try container.encode(fontSize, forKey: .fontSize)
        try container.encode(CodableStepList(steps: onTextUpdate), forKey: .onTextUpdate)
    }
}

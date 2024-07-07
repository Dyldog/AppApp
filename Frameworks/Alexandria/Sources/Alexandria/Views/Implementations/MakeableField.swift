//
//  MakeableField.swift
//  AppApp
//
//  Created by Dylan Elliott on 21/11/2023.
//

import SwiftUI
import Armstrong
import DylKit
import TextView

struct MakeableFieldView: View {
    let isRunning: Bool
    let showEditControls: Bool
    let scope: Scope
    let field: MakeableField
    let onContentUpdate: (MakeableField) -> Void
    let onRuntimeUpdate: (@escaping Block) -> Void
    @EnvironmentObject var variables: Variables
    @Binding var error: VariableValueError?
    @State var text: String = "LOADING"
    
    @ViewBuilder
    private var fieldView: some View {
        let variables = variables.copy()
        
        let binding: Binding<String> = .init(get: {
            do {
                return try field.text.value(with: variables, and: scope).valueString
            } catch {
                handleError(error)
                return "ERROR"
            }
        }, set: {
            onTextUpdate($0)
        })
        
        if isWidget {
            Text(binding.wrappedValue)
        } else if field.isMultiline.value {
            TextView(text: binding)
        } else {
            TextField("", text: binding)
        }
    }
    
    var body: some View {
        VStack {
            if isRunning {
                fieldView
                .multilineTextAlignment(field.alignment.value)
                .font(.system(size: CGFloat(field.fontSize.value)))
            } else {
                Text(field.protoString)
                    .font(.system(size: CGFloat(field.fontSize.value)))
                    .frame(maxWidth: .infinity, alignment: .leading)
            }
        }
    }
    
    func onTextUpdate(_ string: String) {
        guard self.text != string else { return }
        self.text = string
        
        do {
            if isRunning {
                let outputVar = try field.text.output.value.value(with: variables, and: scope)
                variables.set(AnyValue(value: StringValue(value: string)), for: outputVar.valueString)
                try field.onTextUpdate.run(with: variables, and: scope)
            }
        } catch {
            handleError(error)
        }
        
        onRuntimeUpdate { }
    }
    
    private func handleError(_ error: Error) {
        if let error = error as? VariableValueError {
            self.error = error
        } else {
            print(error.localizedDescription)
        }
    }
}

public final class MakeableField: MakeableView, Codable {
    public static let categories: [ValueCategory] = [.views]
    public static var type: VariableType { .field }
    
    public let id: UUID
    public var text: TemporaryValue
    public var fontSize: IntValue
    public var onTextUpdate: StepArray
    public var padding: IntValue
    public var alignment: TextAlignmentValue
    public var isMultiline: BoolValue
    
    public init(id: UUID, text: TemporaryValue, fontSize: IntValue, onTextUpdate: StepArray, padding: IntValue, alignment: TextAlignmentValue, isMultiline: BoolValue) {
        self.id = id
        self.text = text
        self.fontSize = fontSize
        self.onTextUpdate = onTextUpdate
        self.padding = padding
        self.alignment = alignment
        self.isMultiline = isMultiline
    }
    
    public static func defaultValue(for property: Properties) -> any EditableVariableValue {
        switch property {
        case .text: return TemporaryValue.makeDefault()
        case .fontSize: return IntValue(value: 18)
        case .onTextUpdate: return StepArray(value: [])
        case .padding: return IntValue(value: 5)
        case .alignment: return TextAlignmentValue(value: .center)
        case .isMultiline: return BoolValue.false
        }
    }
    
    public var protoString: String { text.protoString }
    public var valueString: String { text.valueString }
    
    public func add(_ other: VariableValue) throws -> VariableValue {
        fatalError()
    }
    
    public func value(with variables: Variables, and scope: Scope) throws -> VariableValue {
//        self
        try MakeableField(
            id: id,
            text: TemporaryValue(
                initial: (text.value(with: variables, and: scope) as (any EditableVariableValue)).any,
                output: text.output
            ),
            fontSize: fontSize.value(with: variables, and: scope),
            onTextUpdate: onTextUpdate.value(with: variables, and: scope),
            padding: padding.value(with: variables, and: scope),
            alignment: alignment.value(with: variables, and: scope),
            isMultiline: isMultiline.value(with: variables, and: scope)
        )
    }
    
    public func insertValues(into variables: Variables, with scope: Scope) throws {
        let outputVarName = try text.output.value.value(with: variables, and: scope)
        let outputValue = try text.value(with: variables, and: scope)
         variables.set(outputValue, for: outputVarName.valueString)
        try onTextUpdate.run(with: variables, and: scope)
    }
}

extension MakeableField: CodeRepresentable {
    public var codeRepresentation: String {
        """
        TextField("", text: .init(get: {
            \(text.codeRepresentation)
        }, set: {
            // TODO
        }))
        .multilineTextAlignment(\(alignment.codeRepresentation)
        .font(.system(size: \(fontSize.value))
        """
    }
}

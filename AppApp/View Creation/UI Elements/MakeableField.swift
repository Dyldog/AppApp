//
//  MakeableField.swift
//  AppApp
//
//  Created by Dylan Elliott on 21/11/2023.
//

import SwiftUI

struct MakeableFieldView: View {
    let makeMode: Bool
    let field: MakeableField
    let onContentUpdate: (MakeableField) -> Void
    let onRuntimeUpdate: () -> Void
    @EnvironmentObject var variables: Variables
//    @Binding var error: VariableValueError?
    @State var text: String = "LOADING"
    
    var body: some View {
        VStack {
            if !makeMode {
                TextField("", text: .init(get: {
                    text
                }, set: {
                    onTextUpdate($0)
                })).font(.system(size: CGFloat(field.fontSize.value))).any
            } else {
                Text(field.protoString)
                    .font(.system(size: CGFloat(field.fontSize.value)))
                    .frame(maxWidth: .infinity, alignment: .leading)
                    .any
            }
        }.task {
            do {
                guard let value = try await field.text.value(with: variables)?.valueString
                else { throw VariableValueError.valueNotFoundForVariable(field.text.protoString) }
                self.text = value
            }catch let error as VariableValueError {
//                self.error = error
            } catch {
                fatalError(error.localizedDescription)
            }
        }
    }
    
    func onTextUpdate(_ string: String) {
        self.text = string
        
        Task { @MainActor in
            do {
                if !makeMode, let outputVar = try await field.text.output.value.value(with: variables) {
                    variables.set(Value(value: StringValue(value: string)), for: outputVar.valueString)
                    for step in field.onTextUpdate {
                        try await step.run(with: variables)
                    }
                }
            } catch let error as VariableValueError {
//                self.error = error
            } catch {
                fatalError(error.localizedDescription)
            }
            
            onRuntimeUpdate()
        }
    }
}

final class MakeableField: MakeableView, Codable {
    
    static var type: VariableType { .label }
    var text: TemporaryValue
    var fontSize: IntValue
    var onTextUpdate: StepArray
    
    init(text: TemporaryValue, fontSize: IntValue, onTextUpdate: StepArray) {
        self.text = text
        self.fontSize = fontSize
        self.onTextUpdate = onTextUpdate
    }
    
    static func defaultValue(for property: Properties) -> Any {
        switch property {
        case .text: return TemporaryValue.makeDefault()
        case .fontSize: return IntValue(value: 18)
        case .onTextUpdate: return StepArray(value: [])
        }
    }
    
    var protoString: String { text.protoString }
    var valueString: String { text.valueString }
    
    func add(_ other: VariableValue) throws -> VariableValue {
        fatalError()
    }
    
    func value(with variables: Variables) async throws -> VariableValue? {
        self
    }
    
    func insertValues(into variables: Variables) async throws {
        if 
            let outputVarName = try await text.output.value.value(with: variables),
            let outputValue = try await text.value(with: variables)
        {
            await variables.set(outputValue, for: outputVarName.valueString)
        }
        
        for step in onTextUpdate {
            try await step.run(with: variables)
        }
    }
}

//
//  MakeablePicker.swift
//  AppApp
//
//  Created by Dylan Elliott on 28/11/2023.
//

import SwiftUI

final class MakeableToggle: MakeableView {
    
    static var type: VariableType { .toggle }
    
    var isOn: TemporaryValue
    var onToggleUpdate: StepArray
    
    var protoString: String { isOn.protoString }
    var valueString: String { isOn.valueString }
    
    init(isOn: TemporaryValue, onToggleUpdate: StepArray) {
        self.isOn = isOn
        self.onToggleUpdate = onToggleUpdate
    }
    
    static func defaultValue(for property: Properties) -> any EditableVariableValue {
        switch property {
        case .isOn: return TemporaryValue(
            initial: .init(value: BoolValue(value: false)),
            output: .init(value: StringValue(value: "SWITCHON")))
        case .onToggleUpdate: return StepArray(value: [])
        }
    }
    
    func value(with variables: Variables) async throws -> VariableValue {
        self
    }
    
    func insertValues(into variables: Variables) async throws {
        let outputVarName = try await isOn.output.value.value(with: variables)
        let outputValue = try await isOn.value(with: variables)
        await variables.set(outputValue, for: outputVarName.valueString)
        
        try await onToggleUpdate.run(with: variables)
    }
    
    func add(_ other: VariableValue) throws -> VariableValue {
        fatalError()
    }
}

struct MakeableToggleView: View {
    let isRunning: Bool
    let showEditControls: Bool
    let toggle: MakeableToggle
    let onContentUpdate: (MakeableToggle) -> Void
    let onRuntimeUpdate: () -> Void
    @EnvironmentObject var variables: Variables
    @Binding var error: VariableValueError?
    
    @State var isOn: Bool = false
    
    var body: some View {
        VStack {
            Toggle("", isOn: .init(get: {
                isOn
            }, set: {
                onUpdate($0)
            })).fixedSize().any
        }.task(id: variables.hashValue) {
            do {
                guard let value = try await toggle.isOn.value(with: variables) as? BoolValue
                else { throw VariableValueError.valueNotFoundForVariable(toggle.isOn.protoString) }
                self.isOn = value.value
            } catch let error as VariableValueError {
                self.error = error
            } catch {
                fatalError(error.localizedDescription)
            }
        }
    }
    
    func onUpdate(_ value: Bool) {
        self.isOn = value
        
        Task { @MainActor in
            do {
                if isRunning {
                  let outputVar = try await toggle.isOn.output.value.value(with: variables)
                    variables.set(Value(value: BoolValue(value: value)), for: outputVar.valueString)
                    try await toggle.onToggleUpdate.run(with: variables)
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

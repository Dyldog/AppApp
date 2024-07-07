//
//  MakeablePicker.swift
//  AppApp
//
//  Created by Dylan Elliott on 28/11/2023.
//

import SwiftUI
import Armstrong
import DylKit

public final class MakeableToggle: MakeableView {
    public static let categories: [ValueCategory] = [.views]
    public static var type: VariableType { .toggle }
    
    public let id: UUID
    
    public var isOn: TemporaryValue
    public var onToggleUpdate: StepArray
    public var padding: IntValue
    
    public var protoString: String { isOn.protoString }
    public var valueString: String { isOn.valueString }
    
    public init(id: UUID, isOn: TemporaryValue, onToggleUpdate: StepArray, padding: IntValue) {
        self.id = id
        self.isOn = isOn
        self.onToggleUpdate = onToggleUpdate
        self.padding = padding
    }
    
    public static func defaultValue(for property: Properties) -> any EditableVariableValue {
        switch property {
        case .isOn: return TemporaryValue(
            initial: .init(value: BoolValue(value: false)),
            output: .init(value: StringValue(value: "SWITCHON").any))
        case .onToggleUpdate: return StepArray(value: [])
        case .padding: return IntValue(value: 5)
        }
    }
    
    public func value(with variables: Variables, and scope: Scope) throws -> VariableValue {
        self
    }
    
    public func insertValues(into variables: Variables, with scope: Scope) throws {
        let outputVarName = try isOn.output.value.value(with: variables, and: scope)
        let outputValue = try isOn.value(with: variables, and: scope)
         variables.set(outputValue, for: outputVarName.valueString)
        
        try onToggleUpdate.run(with: variables, and: scope)
    }
    
    public func add(_ other: VariableValue) throws -> VariableValue {
        fatalError()
    }
}

struct MakeableToggleView: View {
    let isRunning: Bool
    let showEditControls: Bool
    let scope: Scope
    let toggle: MakeableToggle
    let onContentUpdate: (MakeableToggle) -> Void
    let onRuntimeUpdate: (@escaping Block) -> Void
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
        }
//        .task(id: variables.hashValue) {
//            do {
//                guard let value = try toggle.isOn.value(with: variables, and: scope) as? BoolValue
//                else { throw VariableValueError.valueNotFoundForVariable(toggle.isOn.protoString) }
//                self.isOn = value.value
//            } catch let error as VariableValueError {
//                self.error = error
//            } catch {
//                fatalError(error.localizedDescription)
//            }
//        }
    }
    
    func onUpdate(_ value: Bool) {
        self.isOn = value
        
        do {
            if isRunning {
              let outputVar = try toggle.isOn.output.value.value(with: variables, and: scope)
                variables.set(AnyValue(value: BoolValue(value: value)), for: outputVar.valueString)
                try toggle.onToggleUpdate.run(with: variables, and: scope)
            }
        } catch let error as VariableValueError {
            self.error = error
        } catch {
            fatalError(error.localizedDescription)
        }
        
        onRuntimeUpdate { }
    }
}

extension MakeableToggle: CodeRepresentable {
    public var codeRepresentation: String {
        """
        Toggle("", isOn: .init(get: {
            \(isOn.codeRepresentation)
        }, set: {
            // TODO
        }))
        .fixedSize()
        """
    }
}

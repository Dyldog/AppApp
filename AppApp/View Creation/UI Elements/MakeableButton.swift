//
//  MakeableButton.swift
//  AppApp
//
//  Created by Dylan Elliott on 21/11/2023.
//

import SwiftUI

struct MakeableButtonView: View {
    let isRunning: Bool
    let showEditControls: Bool
    let button: MakeableButton
    let onContentUpdate: (MakeableButton) -> Void
    let onRuntimeUpdate: () -> Void
    @EnvironmentObject var variables: Variables
//    @Binding var error: VariableValueError?
    
    var body: some View {
        return SwiftUI.Button(action: {
            runAction()
        }, label: {
            MakeableLabelView(isRunning: isRunning, showEditControls: showEditControls, label: button.title, onContentUpdate: {
                button.title = $0
                onContentUpdate(button)
            }, onRuntimeUpdate: {
                onRuntimeUpdate()
            })
        }).any
    }
    
    func runAction() {
        Task { @MainActor in
            if isRunning {
                do {
                    for action in button.action {
                        try await action.run(with: variables)
                    }
                    
                    onRuntimeUpdate()
                } catch let error as VariableValueError {
//                    self.error = error
                } catch {
                    fatalError(error.localizedDescription)
                }
            }
        }
    }
}

final class MakeableButton: MakeableView, Codable {
    static var type: VariableType { .button }
    
    var title: MakeableLabel
    var action: StepArray
    
    var protoString: String { title.protoString }
    var valueString: String { title.valueString }
    
    init(title: MakeableLabel, action: StepArray) {
        self.title = title
        self.action = action
    }
    
    func add(_ other: VariableValue) throws -> VariableValue {
        fatalError()
    }
    
    func value(with variables: Variables) async throws -> VariableValue? {
        self
    }
    
    static func defaultValue(for property: Properties) -> Any {
        switch property {
        case .title: return MakeableLabel.makeDefault()
        case .action: return StepArray(value: [])
        }
    }
    
    func insertValues(into variables: Variables) throws {
        //
    }
}


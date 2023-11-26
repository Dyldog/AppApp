//
//  MakeableButton.swift
//  AppApp
//
//  Created by Dylan Elliott on 21/11/2023.
//

import SwiftUI

extension Binding {
    func unwrapped<T>() -> Binding<T> where Value == Optional<T> {
        .init {
            wrappedValue!
        } set: {
            wrappedValue = $0
        }

    }
}

struct MakeableButtonView: View {
    let makeMode: Bool
    let button: MakeableButton
    let onContentUpdate: (MakeableButton) -> Void
    let onRuntimeUpdate: () -> Void
    @Binding var variables: Variables?
    @Binding var error: VariableValueError?
    @State var text: String = ""
    
    func titleString() async -> String {
        if variables != nil {
            do {
                guard let value = try await button.title.value(with: $variables.unwrapped()) else {
                    throw VariableValueError.valueNotFoundForVariable(button.title.protoString)
                }
                return value.valueString
            } catch let error as VariableValueError {
                self.error = error
                return "Error"
            } catch {
                fatalError(error.localizedDescription)
            }
        } else {
            return button.title.protoString
        }
    }
    
    var body: some View {
        return SwiftUI.Button(action: {
            runAction()
        }, label: {
            MakeableLabelView(makeMode: makeMode, label: button.title, onContentUpdate: {
                onContentUpdate(.init(title: $0, action: button.action))
            }, onRuntimeUpdate: {
                onRuntimeUpdate()
            }, variables: $variables, error: $error)
        }).task(id: variables) {
            self.text = await titleString()
        }.fixedSize().any
    }
    
    func runAction() {
        Task { @MainActor in
            if variables != nil {
                do {
                    for action in button.action {
                        try await action.run(with: $variables.unwrapped())
                    }
                    
                    onRuntimeUpdate()
                } catch let error as VariableValueError {
                    self.error = error
                } catch {
                    fatalError(error.localizedDescription)
                }
            }
        }
    }
}

final class MakeableButton: MakeableView, Codable {
    static var type: VariableType { .button }
    
    var id: UUID = .init()
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
    
    func value(with variables: Binding<Variables>) async throws -> VariableValue? {
        self
    }
    
    static func defaultValue(for property: Properties) -> Any {
        switch property {
        case .title: return MakeableLabel.makeDefault()
        case .action: return StepArray(value: [])
        }
    }
    
    func insertValues(into variables: Binding<Variables>) throws {
        //
    }
}


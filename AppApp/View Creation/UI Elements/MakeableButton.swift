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
            Text(text)
                .font(.system(size: CGFloat(button.fontSize.value)).weight(button.fontWeight.value))
                .if(button.italic.value) { $0.italic() }
                .fixedSize()
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
    
    func add(_ other: VariableValue) throws -> VariableValue {
        fatalError()
    }
    
    var valueString: String { title.valueString }
    
    func value(with variables: Binding<Variables>) async throws -> VariableValue? {
        self
    }
    
    static func defaultValue(for property: Properties) -> Any {
        switch property {
        case .title: return Value(value: StringValue(value: "TEXT"))
        case .action: return StepArray(value: [])
        case .fontSize: return IntValue(value: 18)
        case .fontWeight: return FontWeightValue(value: .regular)
        case .italic: return BoolValue(value: false)
        }
    }
    var id: UUID = .init()
    var title: Value
    var action: StepArray
    var fontSize: IntValue
    var fontWeight: FontWeightValue
    var italic: BoolValue
    
    
    init(title: Value, action: StepArray, fontSize: IntValue, fontWeight: FontWeightValue, italic: BoolValue) {
        self.title = title
        self.action = action
        self.fontSize = fontSize
        self.fontWeight = fontWeight
        self.italic = italic
    }
    
    var protoString: String { title.protoString }
    
    func insertValues(into variables: Binding<Variables>) throws {
        //
    }
}


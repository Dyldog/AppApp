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
                .font(.system(size: CGFloat(button.fontSize)).weight(button.fontWeight))
                .if(button.italic) { $0.italic() }
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

struct MakeableButton: MakeableView, Codable {
    let id: UUID = .init()
    let title: Value
    let action: StepArray
    let fontSize: Int
    let fontWeight: Font.Weight
    let italic: Bool
    
    init(title: Value, action: StepArray, fontSize: Int, fontWeight: Font.Weight, italic: Bool) {
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
    
    enum Properties: String, CaseIterable, ViewProperty {
        case title
        case fontSize
        case action
        case fontWeight
        case italic
        
        var defaultValue: VariableValue {
            switch self {
            case .title: return "TITLE" as Value
            case .fontSize: return 12
            case .action: return StepArray(values: [])
            case .fontWeight: return Font.Weight.regular
            case .italic: return false
            }
        }
    }
}

extension MakeableButton {
    func value(for property: Properties) -> (VariableValue)? {
        switch property {
        case .title: return title //(&variables)
        case .fontSize: return fontSize
        case .action: return action
        case .fontWeight: return fontWeight
        case .italic: return italic
        }
    }
    
    static func make(factory: (Properties) -> VariableValue) -> MakeableButton {
        return .init(
            title: factory(.title) as! Value,
            action: factory(.action) as! StepArray, fontSize: factory(.fontSize) as! Int,
            fontWeight: factory(.fontWeight) as! Font.Weight,
            italic: factory(.italic) as! Bool
        )
    }
}

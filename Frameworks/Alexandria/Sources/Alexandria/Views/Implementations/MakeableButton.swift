//
//  MakeableButton.swift
//  AppApp
//
//  Created by Dylan Elliott on 21/11/2023.
//

import SwiftUI
import Armstrong
import DylKit

struct MakeableButtonView: View {
    let isRunning: Bool
    let showEditControls: Bool
    let scope: Scope
    let button: MakeableButton
    let onContentUpdate: (MakeableButton) -> Void
    let onRuntimeUpdate: (@escaping Block) -> Void
    @EnvironmentObject var variables: Variables
    @Binding var error: VariableValueError?
    
    init(isRunning: Bool, showEditControls: Bool, scope: Scope, button: MakeableButton, onContentUpdate: @escaping (MakeableButton) -> Void, onRuntimeUpdate: @escaping (@escaping Block) -> Void, error: Binding<VariableValueError?>) {
        self.isRunning = isRunning
        self.showEditControls = showEditControls
        self.button = button
        self.onContentUpdate = onContentUpdate
        self.onRuntimeUpdate = onRuntimeUpdate
        self._error = error
        self.scope = scope 
    }
    var body: some View {
        return SwiftUI.Button(action: {
            runAction()
        }, label: {
            MakeableWrapperView(
                isRunning: isRunning,
                showEditControls: showEditControls,
                scope: scope,
                view: button.title.value,
                onContentUpdate: {
                    button.title = .init(value: $0)
                    onContentUpdate(button)
                }, onRuntimeUpdate:  { completion in
                    onRuntimeUpdate {
                        completion()
                    }
                }, error: $error
            )
        })
        .withButtonStyle(button.style.value)
    }
    
    func runAction() {
        Task { @MainActor in
            if isRunning {
                do {
                    try button.action.run(with: variables, and: scope)
                    onRuntimeUpdate { }
                } catch let error as VariableValueError {
                    self.error = error
                } catch {
                    fatalError(error.localizedDescription)
                }
            }
        }
    }
}

public final class MakeableButton: MakeableView, Codable {
    public static let categories: [ValueCategory] = [.views]
    public static var type: VariableType { .button }
    
    public let id: UUID
    
    @Published public var title: AnyMakeableView
    @Published public var style: ButtonStyleValue
    @Published public var action: FunctionValue
    
    public var protoString: String { "BUTTON(\(title.protoString))" }
    public var valueString: String { title.valueString }
    
    public init(id: UUID, title: AnyMakeableView, style: ButtonStyleValue, action: FunctionValue) {
        self.id = id
        self.title = title
        self.style = style
        self.action = action
    }
    
    public func add(_ other: VariableValue) throws -> VariableValue {
        fatalError()
    }
    
    public func value(with variables: Variables, and scope: Scope) throws -> VariableValue {
        try MakeableButton(
            id: id,
            title: title.value(with: variables, and: scope),
            style: style.value(with: variables, and: scope),
            action: action.value(with: variables, and: scope)
        )
    }
    
    public static func defaultValue(for property: Properties) -> any EditableVariableValue {
        switch property {
        case .title: return AnyMakeableView(value: MakeableLabel.makeDefault())
        case .action: return FunctionValue.makeDefault()
        case .style: return ButtonStyleValue(value: .bordered)
        }
    }
    
    public func insertValues(into variables: Variables, with scope: Scope) throws {
        //
    }
}

extension MakeableButton: CodeRepresentable {
    public var codeRepresentation: String {
        "TODO"
//        """
//        Button {
//            \(action.body.map { "\t" + $0.codeRepresentation }.joined(separator: "\n"))
//        } label: {
//            \(title.codeRepresentation)
//        }
//        .buttonStyle(\(style.codeRepresentation))
//        """
    }
}

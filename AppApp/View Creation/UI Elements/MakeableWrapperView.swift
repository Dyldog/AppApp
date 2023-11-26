//
//  MakeableWrapperView.swift
//  AppApp
//
//  Created by Dylan Elliott on 24/11/2023.
//

import SwiftUI

struct MakeableWrapperView: View {
    let makeMode: Bool
    let view: any MakeableView
    let onContentUpdate: (any MakeableView) -> Void
    let onRuntimeUpdate: () -> Void
    @Binding var variables: Variables?
    @Binding var error: VariableValueError?
    
    init(makeMode: Bool, view: any MakeableView, onContentUpdate: @escaping (any MakeableView) -> Void, onRuntimeUpdate: @escaping () -> Void, variables: Binding<Variables?>, error: Binding<VariableValueError?>) {
        self.makeMode = makeMode
        self.view = view
        self.onContentUpdate = onContentUpdate
        self.onRuntimeUpdate = onRuntimeUpdate
        self._variables = variables
        self._error = error
    }
    
    var body: some View {
        switch view {
        case let stack as MakeableStack:
            MakeableStackView(makeMode: makeMode, stack: stack, onContentUpdate: onContentUpdate, onRuntimeUpdate: onRuntimeUpdate, variables: $variables, error: $error)
        case let label as MakeableLabel:
            MakeableLabelView(makeMode: makeMode, label: label, onContentUpdate: onContentUpdate, onRuntimeUpdate: onRuntimeUpdate, variables: $variables, error: $error)
        case let button as MakeableButton:
            MakeableButtonView(makeMode: makeMode, button: button, onContentUpdate: onContentUpdate, onRuntimeUpdate: onRuntimeUpdate, variables: $variables, error: $error)
//        case let field as MakeableField:
//            MakeableFieldView(makeMode: makeMode, field: field, onContentUpdate: onContentUpdate, onRuntimeUpdate: onRuntimeUpdate, variables: $variables, error: $error)
        default:
            Text("UNKNOWN VIEW")
        }
    }
}

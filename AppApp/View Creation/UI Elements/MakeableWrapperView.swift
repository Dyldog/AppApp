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
//    @Binding var variables: Variables?
//    @Binding var error: VariableValueError?
    
    init(makeMode: Bool, view: any MakeableView, onContentUpdate: @escaping (any MakeableView) -> Void, onRuntimeUpdate: @escaping () -> Void) {
        self.makeMode = makeMode
        self.view = view
        self.onContentUpdate = onContentUpdate
        self.onRuntimeUpdate = onRuntimeUpdate
//        self._variables = variables
//        self._error = error
    }
    
    
}

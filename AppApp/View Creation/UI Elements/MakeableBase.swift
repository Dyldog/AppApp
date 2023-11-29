//
//  MakeableBase.swift
//  AppApp
//
//  Created by Dylan Elliott on 29/11/2023.
//

import SwiftUI

class MakeableBase: MakeableView, Codable {
    
    static var type: VariableType { .base }
        
    var padding: IntValue
    
    init(padding: IntValue) {
        self.padding = padding
    }
    
    func insertValues(into variables: Variables) throws { }
    
    var protoString: String { "ERROR!!!" }
    
    func add(_ other: VariableValue) throws -> VariableValue { fatalError() }
    
    var valueString: String { "ERROR!!!" }

    func value(with variables: Variables) async throws -> VariableValue { self }

    static func defaultValue(for property: Properties) -> any EditableVariableValue {
        switch property {
        case .padding: return IntValue.init(value: 5)
        }
    }
}

struct MakeableBaseView: View {
    let isRunning: Bool
    let showEditControls: Bool
    let base: MakeableBase
    
    let onContentUpdate: (MakeableBase) -> Void
    let onRuntimeUpdate: () -> Void
    
    @EnvironmentObject var variables: Variables
    @Binding var error: VariableValueError?
        
    init(isRunning: Bool, showEditControls: Bool, base: MakeableBase, onContentUpdate: @escaping (MakeableBase) -> Void, onRuntimeUpdate: @escaping () -> Void, error: Binding<VariableValueError?>) {
        self.isRunning = isRunning
        self.showEditControls = showEditControls
        self.base = base
        self.onContentUpdate = onContentUpdate
        self.onRuntimeUpdate = onRuntimeUpdate
        self._variables = .init()
        self._error = error
    }
    
    var body: some View {
        EmptyView()
            .padding(CGFloat(base.padding.value))
            .any
    }
}

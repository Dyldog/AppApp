//
//  MakeableBase.swift
//  AppApp
//
//  Created by Dylan Elliott on 29/11/2023.
//

import SwiftUI

final class MakeableBase: MakeableView, Codable {
    
    static var type: VariableType { .base }
        
    var padding: IntValue
    var backgroundColor: ColorValue
    var cornerRadius: IntValue
    
    init(padding: IntValue, backgroundColor: ColorValue, cornerRadius: IntValue) {
        self.padding = padding
        self.backgroundColor = backgroundColor
        self.cornerRadius = cornerRadius
    }
    
    func insertValues(into variables: Variables) throws { }
    
    var protoString: String { "ERROR!!!" }
    
    func add(_ other: VariableValue) throws -> VariableValue { fatalError() }
    
    var valueString: String { "ERROR!!!" }

    func value(with variables: Variables) async throws -> VariableValue { self }

    static func defaultValue(for property: Properties) -> any EditableVariableValue {
        switch property {
        case .padding: return IntValue.init(value: 5)
        case .backgroundColor: return ColorValue(value: .white) // .clear) TODO: Some issue decoding clear
        case .cornerRadius: return IntValue(value: 0)
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
        Rectangle()
            .background(.clear)
            .foregroundColor(base.backgroundColor.value)
            .fixedSize()
            .base(base)
            .any
    }
}

extension View {
    func base(_ base: MakeableBase) -> some View {
        self
            .padding(CGFloat(base.padding.value))
            .background(base.backgroundColor.value)
            .clipShape(RoundedRectangle(cornerRadius: CGFloat(base.cornerRadius.value)))
        
    }
}

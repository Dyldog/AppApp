//
//  MakeableList.swift
//  AppApp
//
//  Created by Dylan Elliott on 29/11/2023.
//

import SwiftUI

// sourcery: variableTypeName = "listView"
final class MakeableList: MakeableView {
    
    static var type: VariableType { .listView }
        
    var text: Value
    var fontSize: IntValue
    var fontWeight: FontWeightValue
    var italic: BoolValue
    var base: MakeableBase
    var textColor: ColorValue
    
    init(text: Value, fontSize: IntValue, fontWeight: FontWeightValue, italic: BoolValue, base: MakeableBase, textColor: ColorValue) {
        self.text = text
        self.fontSize = fontSize
        self.fontWeight = fontWeight
        self.italic = italic
        self.base = base
        self.textColor = textColor
    }
    
    static func withText(_ string: String) -> MakeableList {
        .init(
            text: Value(value: StringValue(value: string)),
            fontSize: IntValue(value: 18),
            fontWeight: .init(value: .regular),
            italic: .init(value: false),
            base: .makeDefault(),
            textColor: .init(value: .black)
        )
    }
    
    func insertValues(into variables: Variables) throws { }
    
    var protoString: String { text.protoString }
    
    func add(_ other: VariableValue) throws -> VariableValue { fatalError() }
    
    var valueString: String { text.valueString }

    func value(with variables: Variables) async throws -> VariableValue { self }

    static func defaultValue(for property: Properties) -> any EditableVariableValue {
        switch property {
        case .text: return Value(value: StringValue(value: "TEXT"))
        case .fontSize: return IntValue(value: 18)
        case .fontWeight: return FontWeightValue(value: .regular)
        case .italic: return BoolValue(value: false)
        case .base: return MakeableBase.makeDefault()
        case .textColor: return ColorValue(value: .black)
        }
    }
}

struct MakeableListView: View {
    let isRunning: Bool
    let showEditControls: Bool
    let listView: MakeableList
    
    let onContentUpdate: (MakeableList) -> Void
    let onRuntimeUpdate: () -> Void
    
    @EnvironmentObject var variables: Variables
    @Binding var error: VariableValueError?
    
    @State var text: String = "LOADING"
    
    init(isRunning: Bool, showEditControls: Bool, listView: MakeableList, onContentUpdate: @escaping (MakeableList) -> Void, onRuntimeUpdate: @escaping () -> Void, error: Binding<VariableValueError?>) {
        self.isRunning = isRunning
        self.showEditControls = showEditControls
        self.listView = listView
        self.onContentUpdate = onContentUpdate
        self.onRuntimeUpdate = onRuntimeUpdate
        self._variables = .init()
        self._error = error
    }
    
    var body: some View {
        EmptyView()
            .any
    }
}

//
//  File.swift
//  AppApp
//
//  Created by Dylan Elliott on 21/11/2023.
//

import SwiftUI

struct EditVariableView: View {
    @State var selectedType: VariableType
    @State var value: any VariableValue
    let onUpdate: (any VariableValue) -> Void
    
    init(value: any VariableValue, onUpdate: @escaping (any VariableValue) -> Void) {
        self._value = .init(initialValue: value)
        self.onUpdate = onUpdate
        self._selectedType = .init(initialValue: type(of: value).type)
    }
    
    var body: some View {
        List {
            Picker("Type", selection: $selectedType) {
                ForEach(VariableType.allCases) {
                    Text($0.protoString).tag($0)
                }
            }.pickerStyle(.menu)
            
//            value.editView(onUpdate: {
//                self.value = $0
//                onUpdate($0)
//            })
        }.onChange(of: selectedType, perform: { value in
            self.value = value.defautltView
            onUpdate(self.value)
        })
    }
}

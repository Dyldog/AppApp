//
//  EditViewViewModel.swift
//  AppApp
//
//  Created by Dylan Elliott on 21/11/2023.
//

import SwiftUI
import DylKit

class EditViewViewModel: ObservableObject {
    @Published private var properties: [String: any VariableValue]
    @Published var alert: Alert?
    
    var rows: [(String, Binding<any VariableValue>)] {
        properties.map { key, value in
            (key, Binding(get: {
                self.properties[key]!
            }, set: {
                self.properties[key] = $0
            }))
        }
    }
    
    let factory: ([String: any VariableValue]) -> any MakeableView
    private var onSave: (any MakeableView) -> Void
    
    init(constructor: MakeableViewConstructor, onSave: @escaping (any MakeableView) -> Void) {
        self.properties = constructor.properties
        self.factory = constructor.factory
        self.onSave = onSave
    }
    
    var view: any MakeableView {
        factory(properties)
    }
    
    func propertyUpdated(_ property: String, to value: any VariableValue) {
        properties[property] = value
        onSave(view)
    }
    
    func saveTapped() {
        onSave(view)
    }
}

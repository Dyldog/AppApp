//
//  EditViewViewModel.swift
//  AppApp
//
//  Created by Dylan Elliott on 21/11/2023.
//

import SwiftUI
import DylKit

class EditViewViewModel: ObservableObject {
    @Published var editable: any MakeableView
    @Published var alert: Alert?
    let onUpdate: (any MakeableView) -> Void
    
    init(editable: any MakeableView, onUpdate: @escaping (any MakeableView) -> Void) {
        self.editable = editable
        self.onUpdate = onUpdate
    }
//    var rows: [(String, Binding<Any>)] {
//        properties.map { key, value in
//            (key, Binding(get: {
//                self.properties[key]!
//            }, set: {
//                self.properties[key] = $0
//            }))
//        }
//    }
    
//    let factory: ([String: Any]) -> any MakeableView
    
//    init(constructor: MakeableViewConstructor, onSave: @escaping (any MakeableView) -> Void) {
//        self.properties = constructor.properties
//        self.factory = constructor.factory
//        self.onSave = onSave
//    }
    
//    var view: any MakeableView {
//        factory(properties)
//    }
    
//    func propertyUpdated(_ property: String, to value: any VariableValue) {
//        properties[property] = value
//        onSave(view)
//    }
//    
//    func saveTapped() {
//        onSave(view)
//    }
}

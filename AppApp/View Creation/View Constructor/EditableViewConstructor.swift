//
//  EditableViewConstructor.swift
//  AppApp
//
//  Created by Dylan Elliott on 21/11/2023.
//

import Foundation

struct EditableViewConstructor<T: CompositeEditableVariableValue>: ViewConstructor {
    let properties: [T.Properties: Any]
    let factory: ([T.Properties: Any]) -> any ViewEditable
    
    init(properties: [T.Properties : Any], factory: @escaping ([T.Properties : Any]) -> any ViewEditable) {
        self.properties = properties
        self.factory = factory
    }
    
    var view: any ViewEditable {
        factory(properties)
    }
}

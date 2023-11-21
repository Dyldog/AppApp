//
//  EditableViewConstructor.swift
//  AppApp
//
//  Created by Dylan Elliott on 21/11/2023.
//

import Foundation

struct EditableViewConstructor<T: ViewEditable>: ViewConstructor {
    let properties: [T.Properties: any VariableValue]
    let factory: ([T.Properties: any VariableValue]) -> any ViewEditable
    
    init(properties: [T.Properties : any VariableValue], factory: @escaping ([T.Properties : any VariableValue]) -> any ViewEditable) {
        self.properties = properties
        self.factory = factory
    }
    
    var view: any ViewEditable {
        factory(properties)
    }
}

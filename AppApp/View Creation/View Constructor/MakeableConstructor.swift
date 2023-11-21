//
//  MakeableConstructor.swift
//  AppApp
//
//  Created by Dylan Elliott on 21/11/2023.
//

import Foundation

struct MakeableViewConstructor: ViewConstructor {
    let properties: [String: any VariableValue]
    let factory: ([String: any VariableValue]) -> any MakeableView
    
    init(properties: [String : any VariableValue], factory: @escaping ([String : any VariableValue]) -> any MakeableView) {
        self.properties = properties
        self.factory = factory
    }
    
    var view: any ViewEditable {
        factory(properties)
    }
}

//
//  MakeableConstructor.swift
//  AppApp
//
//  Created by Dylan Elliott on 21/11/2023.
//

import Foundation

struct MakeableViewConstructor: ViewConstructor {
    let properties: [String: Any]
    let factory: ([String: Any]) -> any MakeableView
    
    init(properties: [String : Any], factory: @escaping ([String : Any]) -> any MakeableView) {
        self.properties = properties
        self.factory = factory
    }
    
    var makeableView: any MakeableView {
        factory(properties)
    }
    
    var view: any ViewEditable {
        makeableView
    }
}

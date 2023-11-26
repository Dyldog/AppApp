//
//  ViewEditable.swift
//  AppApp
//
//  Created by Dylan Elliott on 21/11/2023.
//

import Foundation

protocol ViewEditable {
    associatedtype Properties: ViewProperty
    static func make(factory: (Properties) -> Any) -> Self
    func value(for property: Properties) -> Any?
    var protoString: String { get }
    
    func set(_ value: Any, for property: Properties)
}

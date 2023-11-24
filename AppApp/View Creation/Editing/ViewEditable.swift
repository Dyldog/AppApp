//
//  ViewEditable.swift
//  AppApp
//
//  Created by Dylan Elliott on 21/11/2023.
//

import Foundation

protocol ViewEditable {
    associatedtype Properties: ViewProperty
    static func make(factory: (Properties) -> any VariableValue) -> Self
    func value(for property: Properties) -> (any VariableValue)?
    var protoString: String { get }
}

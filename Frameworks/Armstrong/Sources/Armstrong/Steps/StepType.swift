//
//  StepType.swift
//  AppApp
//
//  Created by Dylan Elliott on 21/11/2023.
//

import SwiftUI

public protocol StepType: ViewEditable, CompositeEditableVariableValue {
    static var title: String { get }
}

public extension StepType {
//    var valueString: String { protoString }

    func value(with _: Variables, and _: Scope) throws -> VariableValue {
        self
    }

    func add(_: VariableValue) throws -> VariableValue {
        fatalError()
    }
}

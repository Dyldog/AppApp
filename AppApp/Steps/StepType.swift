//
//  StepType.swift
//  AppApp
//
//  Created by Dylan Elliott on 21/11/2023.
//

import SwiftUI

protocol StepType: ViewEditable, CompositeEditableVariableValue {
    static var title: String { get }
}

extension StepType {
    var valueString: String { protoString }
    
    func value(with variables: Binding<Variables>) async throws -> VariableValue? {
        self
    }
}

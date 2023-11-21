//
//  ValueStep.swift
//  AppApp
//
//  Created by Dylan Elliott on 21/11/2023.
//

import Foundation

protocol ValueStep: StepType {
    func run(with variables: inout Variables) throws -> VariableValue
}

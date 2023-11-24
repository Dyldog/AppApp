//
//  ValueStep.swift
//  AppApp
//
//  Created by Dylan Elliott on 21/11/2023.
//

import SwiftUI

protocol ValueStep: StepType {
    func run(with variables: Binding<Variables>) async throws -> VariableValue
}

//
//  StepType+Run.swift
//  AppApp
//
//  Created by Dylan Elliott on 21/11/2023.
//

import SwiftUI

extension StepType {
    func run(with variables: Binding<Variables>) async throws {
        switch self {
        case let step as any ValueStep:
            try await variables.wrappedValue.set(step.run(with: variables), for: "$0")
        case let step as any Step:
            try await step.run(with: variables)
        default:
            fatalError()
        }
    }
    
}

//
//  StepType+Run.swift
//  AppApp
//
//  Created by Dylan Elliott on 21/11/2023.
//

import Foundation

extension StepType {
    func run(with variables: inout Variables) throws {
        switch self {
        case let step as any ValueStep:
            try variables.set(step.run(with: &variables), for: "$0")
        case let step as any Step:
            try step.run(with: &variables)
        default:
            fatalError()
        }
    }
    
}

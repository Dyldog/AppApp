//
//  File.swift
//  AppAppTests
//
//  Created by Dylan Elliott on 30/11/2023.
//

import Foundation
import XCTest
@testable import AppApp

final class SetVarStepTests: XCTestCase {
    var step: SetVarStep!
    
    private func configure(`var`: AnyValue, value: AnyValue) {
        step = .init(varName: `var`, value: value)
    }
    
//    func testStep() throws {
//        configure(var: .string("VAR"), value: .string("HELLO"))
//        let vars = Variables()
//        try step.run(with: vars)
//        XCTAssertEqual(
//             vars.variables["VAR"]?.valueString,
//            AnyValue.string("HELLO").valueString
//        )
//    }
}

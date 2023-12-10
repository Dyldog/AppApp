//
//  Float+VariableValue.swift
//  AppApp
//
//  Created by Dylan Elliott on 30/11/2023.
//

import SwiftUI
import Armstrong

extension Float: StringRepresentableValue, Numeric {
    static var defaultValue: Float = 0
    
    static func %(lhs: Float, rhs: Float) -> Float {
        lhs.truncatingRemainder(dividingBy: rhs)
    }
}


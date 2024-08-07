//
//  Numeric.swift
//  AppApp
//
//  Created by Dylan Elliott on 30/11/2023.
//

import DylKit
import Foundation

public protocol Numeric {
    init?(_ string: String)
    static func + (lhs: Self, rhs: Self) -> Self
    static func - (lhs: Self, rhs: Self) -> Self
    static func * (lhs: Self, rhs: Self) -> Self
    static func / (lhs: Self, rhs: Self) -> Self
    static func % (lhs: Self, rhs: Self) -> Self
    static func ** (_ lhs: Self, _ rhs: Self) -> Self

    var floatValue: Float { get }
}

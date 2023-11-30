//
//  Numbers+Pow.swift
//  AppApp
//
//  Created by Dylan Elliott on 30/11/2023.
//

import Foundation

precedencegroup ExponentiationPrecedence {
  associativity: right
  higherThan: MultiplicationPrecedence
}

infix operator ** : ExponentiationPrecedence

func ** (_ base: Double, _ exp: Double) -> Double {
  return pow(base, exp)
}

func ** (_ base: Float, _ exp: Float) -> Float {
  return pow(base, exp)
}

func ** (_ base: Int, _ exp: Int) -> Int {
    return (pow(Decimal(base), exp) as NSDecimalNumber).intValue
}

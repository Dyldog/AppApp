//
//  Binding+Nil.swift
//  AppApp
//
//  Created by Dylan Elliott on 24/11/2023.
//

import SwiftUI

extension Binding {
    static func `nil`<T>() -> Self where Value == T? {
        .init {
            nil
        } set: { _ in
        }
    }
}

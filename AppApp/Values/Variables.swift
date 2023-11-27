//
//  Variables.swift
//  AppApp
//
//  Created by Dylan Elliott on 20/11/2023.
//

import Foundation
import DylKit
import Combine

class Variables: Equatable, ObservableObject, Hashable, Identifiable {
    
    @MainActor var id: String { keyString + valueString }
//    var objectWillChange = PassthroughSubject<Void, Never>()
    
    @MainActor private(set) var variables: [String: VariableValue] {
        willSet { objectWillChange.send() }
        didSet {
            print("DIDSET")
        }
    }
    
    @MainActor var keys: [String] { Array(variables.keys) }
    
    init() {
        variables = .init()
    }
    
    @MainActor func value(for name: String) -> VariableValue? {
        variables[name]
    }
    
    @MainActor func set(_ value: VariableValue, for name: String) {
        variables[name] = value
    }
    
    @MainActor func set(from other: Variables) {
        for (key, value) in other.variables {
            if self.value(for: key)?.valueString != value.valueString {
                set(value, for: key)
            }
        }
    }
    
    @MainActor static func == (lhs: Variables, rhs: Variables) -> Bool {
        let isEqual = (lhs.keyString == rhs.keyString) && (lhs.valueString == rhs.valueString)
        return isEqual
    }
    
    @MainActor func hash(into hasher: inout Hasher) {
        hasher.combine(variables.mapValues { $0.valueString })
    }
}

private extension Variables {
    @MainActor var keyString: String {
        variables.keys.sorted().joined()
    }
    
    @MainActor var valueString: String {
        variables.values.map { $0.valueString }.sorted().joined()
    }
}

//
//  Variables.swift
//  AppApp
//
//  Created by Dylan Elliott on 20/11/2023.
//

import Combine
import DylKit
import Foundation

public final class Variables: Equatable, ObservableObject, Hashable, Identifiable, Copying {
    public var id: String { keyString + valueString }
//    var objectWillChange = PassthroughSubject<Void, Never>()

    private(set) var variables: [String: VariableValue]

    var keys: [String] { Array(variables.keys) }

    public init(values: [String: VariableValue] = [:]) {
        variables = values
    }

    public func value(for name: String) -> VariableValue? {
        objectWillChange.send()
        return variables[name]?.copy()
    }

    public func set(_ value: VariableValue, for name: String) {
        objectWillChange.send()
        variables[name] = value.copy()
    }

    public func set(from other: Variables) {
        objectWillChange.send()
        for (key, value) in other.variables {
            if self.value(for: key)?.valueString != value.valueString {
                set(value, for: key)
            }
        }
    }

    public func set(from dictionary: DictionaryValue) {
        objectWillChange.send()
        for value in dictionary.elements {
            set(value.value, for: value.key)
        }
    }

    public static func == (lhs: Variables, rhs: Variables) -> Bool {
        let isEqual = (lhs.keyString == rhs.keyString) && (lhs.valueString == rhs.valueString)
        return isEqual
    }

    public func hash(into hasher: inout Hasher) {
        hasher.combine(variables.mapValues { $0.valueString })
    }

    public func copy() -> Variables {
        return Variables(
            values: variables.mapValues { $0.copy() }
        )
    }

    public func removeReturnVariable() {
        variables.removeValue(forKey: "$0")
    }
}

private extension Variables {
    var keyString: String {
        variables.keys.sorted().joined()
    }

    var valueString: String {
        variables.values.map { $0.valueString }.sorted().joined()
    }
}

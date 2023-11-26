//
//  VariableValue.swift
//  AppApp
//
//  Created by Dylan Elliott on 20/11/2023.
//

import Foundation
import SwiftUI

/// Defines the properties required to show and edit the type implementing this protocol
protocol VariableValue {
    static var type: VariableType { get }
    func add(_ other: VariableValue) throws -> VariableValue
    var protoString: String { get }
    var valueString: String { get }
    func value(with variables: Binding<Variables>) async throws -> VariableValue?
//    func editView(title: String, onUpdate: @escaping (Self) -> Void) -> AnyView
}

extension Encodable {
    func encoded() -> Data { try! JSONEncoder().encode(self) }
}

extension Array where Element: Encodable {
    func encoded() -> Data { try! JSONEncoder().encode(self) }
}

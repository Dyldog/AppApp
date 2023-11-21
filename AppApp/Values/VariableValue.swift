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
    func string(with variables: inout Variables) throws -> String
    func editView(title: String, onUpdate: @escaping (Self) -> Void) -> AnyView
}

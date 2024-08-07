//
//  PrimitiveEditableVariableValue.swift
//
//
//  Created by Dylan Elliott on 10/12/2023.
//

import Foundation

public protocol PrimitiveEditableVariableValue: EditableVariableValue where Primitive.AllCases: RandomAccessCollection {
    associatedtype Primitive: CaseIterable & Hashable & Titleable & CodeRepresentable
    var value: Primitive { get set }
}

public extension PrimitiveEditableVariableValue {
    var codeRepresentation: String { value.codeRepresentation }
}

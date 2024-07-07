//
//
//  GetCurrentDateStep.swift
//
//
//  Created by Dylan Elliott on 22/12/2023.
//
//

import Armstrong
import Foundation

public final class GetCurrentDateStep: ValueStep {
    public static let categories: [ValueCategory] = [.dateSteps]
    public static var title: String { "Get the current date" }
    public static var type: VariableType { .getCurrentDateStep }

    init() {}

    public var protoString: String { "$CURRENT_DATE" }
    public var valueString: String { "$CURRENT_DATE" }

    public func run(with _: Variables, and _: Scope) throws -> VariableValue {
        DateValue(value: .now)
    }

    public static func defaultValue(for _: Properties) -> any EditableVariableValue {}

    public func add(_: VariableValue) throws -> VariableValue {
        fatalError()
    }
}

extension GetCurrentDateStep: CodeRepresentable {
    public var codeRepresentation: String {
        "TODO"
    }
}

//
//
//  OpenURLStep.swift
//
//
//  Created by Dylan Elliott on 22/12/2023.
//
//

import Armstrong
import DylKit
import Foundation

public final class OpenURLStep: Step {
    public static let categories: [ValueCategory] = [.network]
    public static var title: String { "Open URL" }
    public static var type: VariableType { .openURLStep }

    var url: TypedValue<StringValue>

    public init(url: TypedValue<StringValue>) {
        self.url = url
    }

    public var protoString: String { "OPEN(\(url.protoString))" }
    public var valueString: String { "OPEN(\(url.valueString))" }

    public func run(with variables: Variables, and scope: Scope) throws {
        let string = try url.value(with: variables, and: scope)

        guard let url = URL(string: string.valueString) else {
            throw VariableValueError.wrongTypeForOperation
        }

        SharedApplication.openURL(url)
    }

    public static func defaultValue(for property: Properties) -> any EditableVariableValue {
        switch property {
        case .url: return StringValue(value: "https://github.com").typed
        }
    }

    public func add(_: VariableValue) throws -> VariableValue {
        fatalError()
    }
}

extension OpenURLStep: CodeRepresentable {
    public var codeRepresentation: String {
        "TODO"
    }
}

//
//  DateValue.swift
//
//
//  Created by Dylan Elliott on 18/12/2023.
//

import Armstrong
import DylKit
import Foundation
import SwiftUI

public final class DateValue: EditableVariableValue {
    public static let categories: [ValueCategory] = [.dates]
    public static var type: VariableType { .date }

    public var protoString: String { "\(value.formatted())" }
    public var valueString: String { protoString }

    @Published var value: Date

    public init(value: Date) {
        self.value = value
    }

    public func value(with _: Variables, and _: Scope) throws -> VariableValue {
        self
    }

    public static func makeDefault() -> DateValue {
        DateValue(value: .now)
    }

    public func add(_: VariableValue) throws -> VariableValue {
        throw VariableValueError.variableCannotPerformOperation(.date, "add")
    }

    public func editView(scope: Scope, title: String, onUpdate: @escaping (DateValue) -> Void) -> AnyView {
        return ExpandableStack(scope: scope, title: title) {
            HStack {
                ProtoText(self.protoString)
            }
        } content: {
            DatePicker(selection: .init(get: { [weak self] in
                self?.value ?? .now
            }, set: { [weak self] in
                guard let self else { return }
                self.value = $0
                onUpdate(self)
            })) {
                Text("Hello")
            }
        }.any
    }
}

extension DateValue: CodeRepresentable {
    public var codeRepresentation: String { "TODO" }
}

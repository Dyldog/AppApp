//
//  MakeableLabel.swift
//  AppApp
//
//  Created by Dylan Elliott on 21/11/2023.
//

import DylKit
import SwiftUI

public struct MakeableLabelView: View {
    let isRunning: Bool
    let showEditControls: Bool
    let scope: Scope
    let label: MakeableLabel

    let onContentUpdate: (MakeableLabel) -> Void
    let onRuntimeUpdate: (@escaping Block) -> Void

    @EnvironmentObject var variables: Variables
    @Binding var error: VariableValueError?

    public init(isRunning: Bool, showEditControls: Bool, scope: Scope, label: MakeableLabel, onContentUpdate: @escaping (MakeableLabel) -> Void, onRuntimeUpdate: @escaping (@escaping Block) -> Void, error: Binding<VariableValueError?>) {
        self.isRunning = isRunning
        self.showEditControls = showEditControls
        self.label = label
        self.onContentUpdate = onContentUpdate
        self.onRuntimeUpdate = onRuntimeUpdate
        _error = error
        self.scope = scope
    }

    func content() -> some View {
        do {
            if isRunning {
                let value = try label.text.value(with: variables.copy(), and: scope).valueString
                return try Text(value)
                    .font(
                        .system(size: CGFloat((label.fontSize.value(with: variables, and: scope) as IntValue).value))
                            .weight((label.fontWeight.value(with: variables, and: scope) as FontWeightValue).value)
                    )
                    .if((label.italic.value(with: variables, and: scope) as BoolValue).value) { $0.italic() }
                    .lineLimit((label.isMultiline.value(with: variables, and: scope) as BoolValue).value ? nil : 1)
                    .foregroundStyle((label.textColor.value(with: variables, and: scope) as ColorValue).value)
                    .base(label.base.value(with: variables, and: scope) as MakeableBase)
                    .any
            } else {
                return Text(label.protoString).any
            }
        } catch {
            handleError(error)
            return Text("Error").any
        }
    }

    public var body: some View {
        Self._printChanges()
        return content()
    }

    private func handleError(_ error: Error) {
        if let error = error as? VariableValueError {
            self.error = error
        } else {
            print(error.localizedDescription)
        }
    }
}

public final class MakeableLabel: MakeableView {
    public static let categories: [ValueCategory] = [.views]
    public static var type: VariableType { .label }

    public let id: UUID

    @Published public var text: AnyValue
    @Published public var fontSize: IntValue
    @Published public var fontWeight: FontWeightValue
    @Published public var italic: BoolValue
    @Published public var base: MakeableBase
    @Published public var textColor: ColorValue
    @Published public var isMultiline: BoolValue

    public init(id: UUID, text: AnyValue, fontSize: IntValue, fontWeight: FontWeightValue, italic: BoolValue, base: MakeableBase, textColor: ColorValue, isMultiline: BoolValue) {
        self.id = id
        self.text = text
        self.fontSize = fontSize
        self.fontWeight = fontWeight
        self.italic = italic
        self.base = base
        self.textColor = textColor
        self.isMultiline = isMultiline
    }

    public static func withText(
        _ string: String, fontSize: Int = 18, bold: Bool = false, multiline: Bool = false
    ) -> MakeableLabel {
        .init(
            id: .init(),
            text: AnyValue(value: StringValue(value: string)),
            fontSize: IntValue(value: fontSize),
            fontWeight: .init(value: bold ? .bold : .regular),
            italic: .init(value: false),
            base: .makeDefault(),
            textColor: .init(value: .black),
            isMultiline: .init(value: multiline)
        )
    }

    public func insertValues(into _: Variables, with _: Scope) throws {}

    public var protoString: String { "LABEL(\(text.protoString))" }

    public func add(_: VariableValue) throws -> VariableValue { fatalError() }

    public var valueString: String { text.valueString }

    public func value(with variables: Variables, and scope: Scope) throws -> VariableValue {
        try MakeableLabel(
            id: id,
            text: (text.value(with: variables, and: scope) as (any EditableVariableValue)).any,
            fontSize: fontSize.value(with: variables, and: scope),
            fontWeight: fontWeight.value(with: variables, and: scope),
            italic: italic.value(with: variables, and: scope),
            base: base.value(with: variables, and: scope),
            textColor: textColor.value(with: variables, and: scope),
            isMultiline: isMultiline.value(with: variables, and: scope)
        )
//        self
    }

    public static func defaultValue(for property: Properties) -> any EditableVariableValue {
        switch property {
        case .text: return AnyValue(value: StringValue(value: "TEXT"))
        case .fontSize: return IntValue(value: 18)
        case .fontWeight: return FontWeightValue(value: .regular)
        case .italic: return BoolValue(value: false)
        case .base: return MakeableBase.makeDefault()
        case .textColor: return ColorValue(value: .black)
        case .isMultiline: return BoolValue.false
        }
    }
}

extension MakeableLabel: CodeRepresentable {
    public var codeRepresentation: String {
        """
        Text("\\(\(text.codeRepresentation))\")
            .font(.system(size: \(fontSize.codeRepresentation)).weight(\(fontWeight.codeRepresentation)))
            .if(\(italic.codeRepresentation)) { $0.italic() }
            .foregroundStyle(\(textColor.codeRepresentation))
        """
    }
}

public extension MakeableLabel {
    static func text(_ text: AnyValue, size: Int = 18, isMultiline: BoolValue = .false) -> MakeableLabel {
        .init(id: .init(), text: text, fontSize: .int(size), fontWeight: .init(value: .regular), italic: .init(value: false), base: .makeDefault(), textColor: .init(value: .black), isMultiline: isMultiline)
    }
}

public extension AnyMakeableView {
    static func text(_ text: AnyValue, size: Int = 18) -> AnyMakeableView {
        .init(value: MakeableLabel.text(text, size: size))
    }
}

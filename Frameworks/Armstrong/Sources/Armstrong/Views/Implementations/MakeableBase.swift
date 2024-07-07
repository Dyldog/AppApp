//
//  MakeableBase.swift
//  AppApp
//
//  Created by Dylan Elliott on 29/11/2023.
//

import DylKit
import SwiftUI

public final class MakeableBase: MakeableView, Codable {
    public let id: UUID = .init()

    public static let categories: [ValueCategory] = [.helperViews]
    public static var type: VariableType { .base }

    public var padding: IntValue
    public var backgroundColor: ColorValue
    public var cornerRadius: IntValue

    public init(padding: IntValue, backgroundColor: ColorValue, cornerRadius: IntValue) {
        self.padding = padding
        self.backgroundColor = backgroundColor
        self.cornerRadius = cornerRadius
    }

    public func insertValues(into _: Variables, with _: Scope) throws {}

    public var protoString: String { "ERROR!!!" }

    public func add(_: VariableValue) throws -> VariableValue { fatalError() }

    public var valueString: String { "ERROR!!!" }

    public func value(with _: Variables, and _: Scope) throws -> VariableValue { self }

    public static func defaultValue(for property: Properties) -> any EditableVariableValue {
        switch property {
        case .padding: return IntValue(value: 5)
        case .backgroundColor: return ColorValue(value: .clear) // .clear) TODO: Some issue decoding clear
        case .cornerRadius: return IntValue(value: 0)
        }
    }
}

public struct MakeableBaseView: View {
    let isRunning: Bool
    let showEditControls: Bool
    let base: MakeableBase

    let onContentUpdate: (MakeableBase) -> Void
    let onRuntimeUpdate: (@escaping Block) -> Void
    let scope: Scope

    @EnvironmentObject var variables: Variables
    @Binding var error: VariableValueError?

    public init(isRunning: Bool, showEditControls: Bool, scope: Scope, base: MakeableBase, onContentUpdate: @escaping (MakeableBase) -> Void, onRuntimeUpdate: @escaping (@escaping Block) -> Void, error: Binding<VariableValueError?>) {
        self.isRunning = isRunning
        self.showEditControls = showEditControls
        self.base = base
        self.onContentUpdate = onContentUpdate
        self.onRuntimeUpdate = onRuntimeUpdate
        _error = error
        self.scope = scope
    }

    public var body: some View {
        Rectangle()
            .background(.clear)
            .foregroundColor(base.backgroundColor.value)
            .fixedSize()
            .base(base)
            .any
    }
}

public extension View {
    func base(_ base: MakeableBase) -> some View {
        padding(CGFloat(base.padding.value))
            .background(base.backgroundColor.value)
            .clipShape(RoundedRectangle(cornerRadius: CGFloat(base.cornerRadius.value)))
    }
}

extension MakeableBase: CodeRepresentable {
    public var codeRepresentation: String {
        """
        Rectangle()
            .background(.clear)
            .foregroundColor(\(backgroundColor.codeRepresentation)
        """
    }
}

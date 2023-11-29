//
//  MakeableLAbel.swift
//  AppApp
//
//  Created by Dylan Elliott on 21/11/2023.
//

import SwiftUI

struct MakeableLabelView: View {
    let isRunning: Bool
    let showEditControls: Bool
    let label: MakeableLabel
    
    let onContentUpdate: (MakeableLabel) -> Void
    let onRuntimeUpdate: () -> Void
    
    @EnvironmentObject var variables: Variables
    @Binding var error: VariableValueError?
    
    @State var text: String = "LOADING"
    
    init(isRunning: Bool, showEditControls: Bool, label: MakeableLabel, onContentUpdate: @escaping (MakeableLabel) -> Void, onRuntimeUpdate: @escaping () -> Void, error: Binding<VariableValueError?>) {
        self.isRunning = isRunning
        self.showEditControls = showEditControls
        self.label = label
        self.onContentUpdate = onContentUpdate
        self.onRuntimeUpdate = onRuntimeUpdate
        self._variables = .init()
        self._error = error
    }
    func labelText() async -> String {
        do {
            if isRunning {
                return try await label.text.value(with: variables).valueString
            } else {
                return label.protoString
            }
        } catch let error as VariableValueError {
            self.error = error
            return "Error"
        } catch {
            fatalError(error.localizedDescription)
        }
    }
    
    var body: some View {
        Text(text)
            .font(.system(size: CGFloat(label.fontSize.value)).weight(label.fontWeight.value))
            .if(label.italic.value) { $0.italic() }
            .foregroundStyle(label.textColor.value)
            .base(label.base)
            .task(id: variables.hashValue) {
                self.text = await labelText()
            }
            .any
    }
}

final class MakeableLabel: MakeableView {
    
    static var type: VariableType { .label }
        
    var text: AnyValue
    var fontSize: IntValue
    var fontWeight: FontWeightValue
    var italic: BoolValue
    var base: MakeableBase
    var textColor: ColorValue
    
    init(text: AnyValue, fontSize: IntValue, fontWeight: FontWeightValue, italic: BoolValue, base: MakeableBase, textColor: ColorValue) {
        self.text = text
        self.fontSize = fontSize
        self.fontWeight = fontWeight
        self.italic = italic
        self.base = base
        self.textColor = textColor
    }
    
    static func withText(_ string: String) -> MakeableLabel {
        .init(
            text: AnyValue(value: StringValue(value: string)),
            fontSize: IntValue(value: 18),
            fontWeight: .init(value: .regular),
            italic: .init(value: false),
            base: .makeDefault(), 
            textColor: .init(value: .black)
        )
    }
    
    func insertValues(into variables: Variables) throws { }
    
    var protoString: String { text.protoString }
    
    func add(_ other: VariableValue) throws -> VariableValue { fatalError() }
    
    var valueString: String { text.valueString }

    func value(with variables: Variables) async throws -> VariableValue {
        await MakeableLabel(
            text: AnyValue(value: try text.value(with: variables)),
            fontSize: try fontSize.value(with: variables),
            fontWeight: try fontWeight.value(with: variables),
            italic: try italic.value(with: variables),
            base: try base.value(with: variables),
            textColor: try textColor.value(with: variables)
        )
    }

    static func defaultValue(for property: Properties) -> any EditableVariableValue {
        switch property {
        case .text: return AnyValue(value: StringValue(value: "TEXT"))
        case .fontSize: return IntValue(value: 18)
        case .fontWeight: return FontWeightValue(value: .regular)
        case .italic: return BoolValue(value: false)
        case .base: return MakeableBase.makeDefault()
        case .textColor: return ColorValue(value: .black)
        }
    }
}

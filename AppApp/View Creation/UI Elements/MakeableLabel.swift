//
//  MakeableLAbel.swift
//  AppApp
//
//  Created by Dylan Elliott on 21/11/2023.
//

import SwiftUI

struct MakeableLabelView: View {
    let makeMode: Bool
    let label: MakeableLabel
    
    let onContentUpdate: (MakeableLabel) -> Void
    let onRuntimeUpdate: () -> Void
    
    @Binding var variables: Variables!
    @Binding var error: VariableValueError?
    @State var text: String = ""
    
    func labelText() async -> String {
        do {
            if variables != nil {
                guard let value = try await label.text.value(with: $variables.unwrapped())?.valueString
                else { throw VariableValueError.valueNotFoundForVariable(label.text.protoString) }
                return value
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
            .task(id: variables) {
                self.text = await self.labelText()
            }
            .any
    }
}

final class MakeableLabel: MakeableView, Codable {
    
    static var type: VariableType { .label }
        
    var id: UUID = .init()
    var text: Value
    var fontSize: IntValue
    var fontWeight: FontWeightValue
    var italic: BoolValue
    
    init(text: Value, fontSize: IntValue, fontWeight: FontWeightValue, italic: BoolValue) {
        self.text = text
        self.fontSize = fontSize
        self.fontWeight = fontWeight
        self.italic = italic
    }
    
    static func withText(_ string: String) -> MakeableLabel {
        .init(
            text: Value(value: StringValue(value: string)),
            fontSize: IntValue(value: 18),
            fontWeight: .init(value: .regular),
            italic: .init(value: false)
        )
    }
    
    func insertValues(into variables: Binding<Variables>) throws { }
    
    var protoString: String { text.protoString }
    
    func add(_ other: VariableValue) throws -> VariableValue { fatalError() }
    
    var valueString: String { text.valueString }

    func value(with variables: Binding<Variables>) async throws -> VariableValue? { self }

    
    enum Properties: String, CaseIterable, ViewProperty {
        case value
        case fontSize
        case fontWeight
        case italic
        
        var defaultValue: Any {
            switch self {
            case .value: return Value(value: StringValue(value: "TEXT"))
            case .fontSize: return IntValue(value: 18)
            case .fontWeight: return FontWeightValue(value: .regular)
            case .italic: return BoolValue(value: false)
            }
        }
    }
}

extension MakeableLabel {
    func value(for property: Properties) -> Any? {
        switch property {
        case .value: return text
        case .fontSize: return fontSize
        case .fontWeight: return fontWeight
        case .italic: return italic
        }
    }
    
    static func make(factory: (Properties) -> Any) -> MakeableLabel {
        .init(
            text: factory(.value) as! Value,
            fontSize: factory(.fontSize) as! IntValue,
            fontWeight: factory(.fontWeight) as! FontWeightValue,
            italic: factory(.italic) as! BoolValue
        )
    }
    
    func set(_ value: Any, for property: Properties) {
        switch property {
        case .value: self.text = value as! Value
        case .fontSize: self.fontSize = value as! IntValue
        case .fontWeight: self.fontWeight = value as! FontWeightValue
        case .italic: self.italic = value as! BoolValue
        }
    }
}

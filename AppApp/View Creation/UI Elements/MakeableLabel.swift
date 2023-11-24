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
            .font(.system(size: CGFloat(label.fontSize)))
            .task(id: variables) {
                self.text = await self.labelText()
            }
            .any
    }
}

struct MakeableLabel: MakeableView, Codable {
    let id: UUID = .init()
    let text: Value
    let fontSize: Int
    
    func insertValues(into variables: Binding<Variables>) throws { }
    
    var protoString: String { text.protoString }
    
    func value(for property: Properties) -> (VariableValue)? {
        switch property {
        case .value: return text
        case .fontSize: return fontSize
        }
    }
    
    static func make(factory: (Properties) -> VariableValue) -> MakeableLabel {
        .init(
            text: factory(.value) as! Value,
            fontSize: factory(.fontSize) as! Int
        )
    }
    
    enum Properties: String, CaseIterable, ViewProperty {
        case value
        case fontSize
        
        var defaultValue: VariableValue {
            switch self {
            case .value: return "TEXT" as Value
            case .fontSize: return 18
            }
        }
    }
}

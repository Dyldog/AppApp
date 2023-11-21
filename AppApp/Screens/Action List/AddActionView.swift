//
//  AddActionView.swift
//  AppApp
//
//  Created by Dylan Elliott on 21/11/2023.
//

import SwiftUI

struct AddActionView: View {
    enum Actions: Int, CaseIterable {
        case setVariable
        case addToVariable
        case printVariable
        case staticValue
        case getVariable
        case getFromAPI
        case decodeJSON
        case getDictValue
        
        var title: String {
            switch self {
            case .printVariable: return PrintVarStep.title
            case .setVariable: return SetVarStep.title
            case .addToVariable: return AddToVarStep.title
            case .staticValue: return StaticValueStep.title
            case .getVariable: return VariableStep.title
            case .getFromAPI: return APIValueStep.title
            case .decodeJSON: return DecodeDictionaryStep.title
            case .getDictValue: return DictionaryValueForKeyStep.title
            }
        }
        
        func make() -> any StepType {
            switch self {
            case .printVariable: PrintVarStep(varName: "VAR")
            case .setVariable: SetVarStep(varName: "VAR", value: "VALUE")
            case .addToVariable: AddToVarStep(varName: "VAR", value: "VALUE")
            case .staticValue: StaticValueStep(value: "VALUE", type: .string)
            case .getVariable: VariableStep(varName: "VAR", type: .string)
            case .getFromAPI: APIValueStep(url: "https://swapi.dev/api/people/1")
            case .decodeJSON: 
                DecodeDictionaryStep(value: Value(value: Variable(name: StringValue(value: "$0"))))
            case .getDictValue:
                DictionaryValueForKeyStep(
                    dictionary: Value(value: DictionaryValue(type: .string, elements: [:])),
                    key: "TEXT" as Value)
            }
        }
    }
    
    let onSelect: (any StepType) -> Void
    
    var body: some View {
        List(Actions.allCases, id: \.self) { item in
            SwiftUI.Button(item.title) {
                onSelect(item.make())
            }
        }
    }
}

//
//  PrintVarStep.swift
//  AppApp
//
//  Created by Dylan Elliott on 21/11/2023.
//

import SwiftUI

final class PrintVarStep: Step {
    static var title: String { "Print variable" }
    var varName: String
    
    required init(varName: String) {
        self.varName = varName
    }
    
    var protoString: String { "{ print($\(varName)) }"}
    
    func run(with variables: inout Variables) throws {
        print("\(varName): \(variables.value(for: varName) as Any)")
    }
    
    static func make(factory: (Properties) -> VariableValue) -> Self {
        .init(
            varName: factory(.name) as! String
        )
    }
    
    func value(for property: Properties) -> (VariableValue)? {
        switch property {
        case .name: varName
        }
    }
    
    func set(_ value: VariableValue, for property: Properties) {
        switch property {
        case .name: varName = value.protoString
        }
    }
    
    enum Properties: String, ViewProperty {
        case name
        
        var defaultValue: VariableValue {
            switch self {
            case .name: return "Text"
            }
        }
    }
    
    func editView(onUpdate: @escaping (PrintVarStep) -> Void) -> any View {
        VStack {
            Text("Set variable")
            HStack {
                varName.editView {
                    self.varName = $0
                }
            }
        }
    }
}

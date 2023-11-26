//
//  MakeableField.swift
//  AppApp
//
//  Created by Dylan Elliott on 21/11/2023.
//

import SwiftUI

//struct MakeableFieldView: View {
//    let makeMode: Bool
//    let field: MakeableField
//    let onContentUpdate: (MakeableField) -> Void
//    let onRuntimeUpdate: () -> Void
//    @Binding var variables: Variables!
//    @Binding var error: VariableValueError?
//    @State var text: String = ""
//    
//    var body: some View {
//        VStack {
//            if variables != nil {
//                TextField("", text: .init(get: {
//                    text
//                }, set: {
//                    onTextUpdate($0)
//                })).font(.system(size: CGFloat(field.fontSize))).any
//            } else {
//                Text(field.protoString)
//                    .font(.system(size: CGFloat(field.fontSize)))
//                    .frame(maxWidth: .infinity, alignment: .leading)
//                    .any
//            }
//        }.task(id: variables) {
//            do {
//                if variables != nil {
//                    guard let value = try await field.text.value(with: $variables.unwrapped())?.valueString
//                    else { throw VariableValueError.valueNotFoundForVariable(field.text.protoString) }
//                    return self.text = value
//                }
//            } catch let error as VariableValueError {
//                self.error = error
//            } catch {
//                fatalError(error.localizedDescription)
//            }
//        }
//    }
//    
//    func onTextUpdate(_ string: String) {
//        self.text = string
//        
//        Task { @MainActor in
//            do {
//                if variables != nil, let outputVar = try await field.text.output.name.value(with: $variables.unwrapped()) {
//                    variables.set(Value(stringLiteral: string), for: outputVar.valueString)
//                    for step in field.onTextUpdate {
//                        try await step.run(with: $variables.unwrapped())
//                    }
//                }
//            } catch let error as VariableValueError {
//                self.error = error
//            } catch {
//                fatalError(error.localizedDescription)
//            }
//            
//            onRuntimeUpdate()
//        }
//    }
//}
//
//final class MakeableField: MakeableView, Codable {
//    var id: UUID = .init()
//    var text: TemporaryValue
//    var fontSize: Int
//    var onTextUpdate: StepArray
//    
//    init(text: TemporaryValue, fontSize: Int, onTextUpdate: StepArray) {
//        self.text = text
//        self.fontSize = fontSize
//        self.onTextUpdate = onTextUpdate
//    }
//    
//    var protoString: String { text.protoString }
//    
//    func insertValues(into variables: Binding<Variables>) async throws {
//        if let outputVarName = try await text.value(with: variables)?.valueString {
//            variables.wrappedValue.set(text, for: outputVarName)
//        }
//        
//        for step in onTextUpdate {
//            try await step.run(with: variables)
//        }
//    }
//    
//    enum Properties: String, CaseIterable, ViewProperty, CodingKey {
//        case text
//        case fontSize
//        case onTextUpdate
//        
//        var defaultValue: any VariableValue {
//            switch self {
//            case .text: return TemporaryValue(initial: StringValue(value: "TEXT"), output: .init(name: StringValue(value: "FIELDTEXT")))
//            case .fontSize: return 18
//            case .onTextUpdate: return StepArray(values: [])
//            }
//        }
//    }
//}
//
//extension MakeableField {
//    func value(for property: Properties) -> (any VariableValue)? {
//        switch property {
//        case .text: return text
//        case .fontSize: return fontSize
//        case .onTextUpdate: return onTextUpdate
//        }
//    }
//    
//    static func make(factory: (Properties) -> any VariableValue) -> MakeableField {
//        .init(
//            text: factory(.text) as! TemporaryValue,
//            fontSize: factory(.fontSize) as! Int,
//            onTextUpdate: factory(.onTextUpdate) as! StepArray
//        )
//    }
//    
//    func set(_ value: any VariableValue, for property: Properties) {
//        switch property {
//        case .text: self.text = value as! TemporaryValue
//        case .fontSize: self.fontSize = value as! Int
//        case .onTextUpdate: self.onTextUpdate = value as! StepArray
//        }
//    }
//}

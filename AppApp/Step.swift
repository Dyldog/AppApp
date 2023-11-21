//
//  Step.swift
//  AppApp
//
//  Created by Dylan Elliott on 20/11/2023.
//

import Foundation
import SwiftUI

protocol StepError {
    
}

protocol ViewEditable {
    associatedtype Properties: ViewProperty
    static func make(factory: (Properties) -> any VariableValue) -> Self
    func value(for property: Properties) -> (any VariableValue)?
}



extension ViewEditable {
    var properties: [Properties: any VariableValue] {
        Properties.allCases.reduce(into: [:], {
            $0[$1] = value(for: $1) ?? $1.defaultValue
        })
    }
    
    var constructor: some ViewConstructor {
        EditableViewConstructor<Self>(properties: properties) { props in
            Self.make {
                props[$0] ?? $0.defaultValue
            }
        }
    }
}

protocol StepType: AnyObject, ViewEditable {
    static var title: String { get }
    func set(_ value: VariableValue, for property: Properties)
    var protoString: String { get }
}

extension StepType {
    func run(with variables: inout Variables) throws {
        switch self {
        case let step as any ValueStep:
            try variables.set(step.run(with: &variables), for: "$0")
        case let step as any Step:
            try step.run(with: &variables)
        default:
            fatalError()
        }
    }
    
}
protocol Step: StepType {
    func run(with variables: inout Variables) throws
}

extension StepType {
    func editView(onUpdate: @escaping (Self) -> Void, remove: @escaping () -> Void) -> any View {
        VStack {
            Text(Self.title)
            HStack {
                VHStack {
                    ForEach(self.properties.map { ($0.key, $0.value)}, id: \.0) { property in
                        HStack {
                            Text(property.0.rawValue)
                            property.1.editView { value in
                                self.set(value, for: property.0)
                                onUpdate(self)
                            }
                        }
                    }
                }
                
                Spacer()
                
                SwiftUI.Button("X", action: remove)
            }
        }
    }
}

extension Array: VariableValue where Element == any StepType {
    static var type: VariableType { .action }
    
    func add(_ other: VariableValue) throws -> VariableValue {
        guard let other = other as? Array<any Step> else { throw VariableValueError.wrongTypeForOperation }
        return self + other
    }
    
    var protoString: String {
        map {
            $0.protoString
        }
        .joined(separator: "\n")
    }
    func string(with variables: inout Variables) throws -> String {
        var variables = try reduce(into: variables, { variables, step in
            try step.run(with: &variables)
        })
        return try variables.value(for: "$0")!.string(with: &variables)
    }
    
    func editView(title: String, onUpdate: @escaping (Array<any StepType>) -> Void) -> AnyView {
        return SheetButton(title: {
            Text(title)
        }) {
            ActionListView(steps: self, onUpdate: onUpdate)
        }.any
    }
}

struct SheetButton<Title: View, Content: View>: View {
    @State var showSheet: Bool = false
    
    let title: () -> Title
    let content: () -> Content
    
    var body: some View {
        SwiftUI.Button {
            showSheet = true
        } label: {
            title()
        }.sheet(isPresented: $showSheet, content: {
            content()
        })
    }
    
}

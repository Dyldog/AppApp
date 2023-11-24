//
//  MakeableStack.swift
//  AppApp
//
//  Created by Dylan Elliott on 21/11/2023.
//

import SwiftUI
import DylKit

struct MakeableStackView: View {
    let makeMode: Bool
    let stack: MakeableStack
    
    let onContentUpdate: (MakeableStack) -> Void
    let onRuntimeUpdate: () -> Void
    
    @State var showAddIndex: Int?
    @State var showEditIndex: Int?
    @Binding var variables: Variables?
    @Binding var error: VariableValueError?
    
    var body: some View {
        VStack {
            if makeMode {
                makeButton(at: 0)
            }
            
            ForEach(enumerated: stack.content.elements) { (index, element) in
//                DoView {
                VStack {
                    HStack {
                        MakeableWrapperView(makeMode: makeMode, view: element, onContentUpdate: {
                            self.onUpdate(at: index, with: $0)
                        }, onRuntimeUpdate: onRuntimeUpdate, variables: $variables, error: $error)
                        .onEdit(makeMode ? { self.showEditIndex = index } : nil)
                        
                        if makeMode {
                            SwiftUI.Button("X", action: { onRemove(at: index) })
                        }
                    }
                    
                    if makeMode {
                        makeButton(at: index + 1)
                    }
                }
            }
        }.if(makeMode) {
            $0.padding().border(.black, width: 2)
        }
        .sheet(item: $showAddIndex, content: { index in
            AddViewView(viewModel: .init(onSelect: { view in
                onContentUpdate(MakeableStack(content: stack.content.inserting(view, at: index)))
                self.showAddIndex = nil
            }))
        }).sheet(item: $showEditIndex, content: { index in
            EditViewView(viewModel: .init(constructor: stack.content.elements[index].makeableConstructor, onSave: { view in
                onUpdate(at: index, with: view)
            }))
        })
    }
    
    private func onRemove(at index: Int) {
        onContentUpdate(.init(content: stack.content.removing(at: index)))
    }
    private func onUpdate(at index: Int, with value: any MakeableView) {
        var existingContent = stack.content.elements
        existingContent[index] = value
        onContentUpdate(MakeableStack(content: .init(elements: existingContent)))
    }
    
    func makeButton(at index: Int) -> some View {
        SwiftUI.Button("Add", action: {
            showAddIndex = index
        })
    }
}

final class MakeableStack: MakeableView, Codable {
    enum Properties: String, CaseIterable, ViewProperty {
        case content
        
        var defaultValue: VariableValue { [] }
    }
    
    let id: UUID = .init()
    var content: MakeableArray
    
    var protoString: String { content.map { $0.protoString }.joined(separator: "\n") }
    
    init(content: MakeableArray) {
        self.content = content
    }
    
    func insertValues(into variables: Binding<Variables>) async throws {
        for element in content {
            try await element.insertValues(into: variables)
        }
    }
    
    func value(for property: Properties) -> (any VariableValue)? {
        switch property {
        case .content: return nil // TODO: Conform MakeableArray to VariableValue
        }
    }
    
    static func make(factory: (Properties) -> any VariableValue) -> MakeableStack {
        .init(content: factory(.content) as! MakeableArray)
    }
    
    func set(_ value: any VariableValue, for property: Properties) {
        switch property {
        case .content: break
        }
    }
}

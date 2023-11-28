//
//  MakeableStack.swift
//  AppApp
//
//  Created by Dylan Elliott on 21/11/2023.
//

import SwiftUI
import DylKit

struct MakeableStackView: View {
    let isRunning: Bool
    let showEditControls: Bool
    let stack: MakeableStack
    
    let onContentUpdate: (MakeableStack) -> Void
    let onRuntimeUpdate: () -> Void
    
    @State var showAddIndex: Int?
    @State var showEditIndex: Int?
    @EnvironmentObject var variables: Variables
//    @Binding var error: VariableValueError?
    
    var body: some View {
        Stack(axis: stack.content.axis.value) {
            if showEditControls {
                makeButton(at: 0)
            }
            
            if stack.content.value.isEmpty, !showEditControls {
                Text("STACK")
            } else {
                ForEach(enumerated: stack.content.value) { (index, element) in
                    //                DoView {
                    VStack {
                        HStack {
                            MakeableWrapperView(isRunning: isRunning, showEditControls: false, view: element, onContentUpdate: {
                                self.onUpdate(at: index, with: $0)
                            }, onRuntimeUpdate: onRuntimeUpdate)
                            .onEdit(showEditControls ? { self.showEditIndex = index } : nil)
                            
                            if showEditControls {
                                SwiftUI.Button("X", action: { onRemove(at: index) })
                            }
                        }
                        
                        if showEditControls {
                            makeButton(at: index + 1)
                        }
                    }
                }
            }
        }.if(showEditControls) {
            $0.padding().border(.black, width: 2)
        }
        .sheet(item: $showAddIndex, content: { index in
            AddViewView(viewModel: .init(onSelect: { view in
                onContentUpdate(MakeableStack(content: stack.content.inserting(view, at: index)))
                self.showAddIndex = nil
            }))
        }).sheet(item: $showEditIndex, content: { index in
            EditViewView(viewModel: .init(editable: stack.content.value[index]) {
                onUpdate(at: index, with: $0)
            })
        })
        .id(variables)
    }
    
    private func onRemove(at index: Int) {
        stack.content.value.remove(at: index)
        onContentUpdate(stack)
    }
    private func onUpdate(at index: Int, with value: any MakeableView) {
        stack.content.value[index] = value
        onContentUpdate(stack)
    }
    
    func makeButton(at index: Int) -> some View {
        SwiftUI.Button("Add", action: {
            showAddIndex = index
        })
    }
}

final class MakeableStack: MakeableView, Codable {
    static var type: VariableType { .stack }
    
    func add(_ other: VariableValue) throws -> VariableValue { fatalError() }
    
    var valueString: String { "STACK" }
    
    func value(with variables: Variables) async throws -> VariableValue { self }
    
    var content: MakeableArray
    
    var protoString: String { content.map { $0.protoString }.joined(separator: "\n") }
    
    init(content: MakeableArray) {
        self.content = content
    }
    
    static func defaultValue(for property: Properties) -> any EditableVariableValue {
        switch property {
        case .content: return MakeableArray(value: [], axis: .init(value: .vertical))
        }
    }
    
    func insertValues(into variables: Variables) async throws {
        for element in content {
            try await element.insertValues(into: variables)
        }
    }
}

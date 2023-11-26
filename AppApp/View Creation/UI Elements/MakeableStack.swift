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
            
            ForEach(enumerated: stack.content.value) { (index, element) in
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
            EditViewView(viewModel: .init(editable: stack.content.value[index]) {
                onUpdate(at: index, with: $0)
            })
        })
    }
    
    private func onRemove(at index: Int) {
        onContentUpdate(.init(content: stack.content.removing(at: index)))
    }
    private func onUpdate(at index: Int, with value: any MakeableView) {
        var existingContent = stack.content.value
        existingContent[index] = value
        onContentUpdate(MakeableStack(content: .init(value: existingContent)))
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
    
    func value(with variables: Binding<Variables>) async throws -> VariableValue? { self }
    
    let id: UUID = .init()
    var content: MakeableArray
    
    var protoString: String { content.map { $0.protoString }.joined(separator: "\n") }
    
    init(content: MakeableArray) {
        self.content = content
    }
    
    static func defaultValue(for property: Properties) -> Any {
        switch property {
        case .content: return MakeableArray(value: [])
        }
    }
    
    func insertValues(into variables: Binding<Variables>) async throws {
        for element in content {
            try await element.insertValues(into: variables)
        }
    }
}
